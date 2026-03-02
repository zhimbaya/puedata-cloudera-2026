 #!/bin/bash

# Script to check that all services required for the Data Analyst course are running

verify_api(){
  result=$(curl -X GET -u "admin:admin" http://localhost:7180/api/version 2> /dev/null | grep 'v41'  )
  if [ -z "$result" ]; then

    echo ""
    echo "******************************************"
    echo "* ERROR: The catchup script has failed!  *"
    echo "* CM does not seem to be running.        *"
    echo "* Start the cluster (from Applications)  *"
    echo "* and try again.                         *"
    echo "******************************************"
    echo ""
    exit 999
  fi
}

verify_service_running() {
  SVC_NAME=$1

  if [ -z "$SVC_NAME" ]; then
    echo '### FATAL: verify_service_running invoked incorrectly ###'
    exit 999
  fi

  result=$(curl -X GET -u "admin:admin" http://localhost:7180/api/v41/clusters/Cluster1/services/"$SVC_NAME"  2> /dev/null | egrep  'BAD|DISABLED|STOPPED')
  if [ $? -eq 0 ]; then
    echo ""
    echo "***************************************************"
    echo "* ERROR: The catchup script has failed!           *"
    echo "* One or more required services are not running.  *"
    echo "* To fix this, check the cluster health using     *"
    echo "* Cloudera Manager and resolve any issues.        *"
    echo "* See Starting the Exercise Environment in the    *"
    echo "* Exercise Manual if necessary.                   *"
    echo "*                                                 *"
    echo "* Then run the catchup script again.              *"
    echo "***************************************************"
    echo ""
    exit 1
  fi
}


verify_yarn() {

  result=$(curl -X GET -u "admin:admin" http://localhost:7180/api/v41/clusters/Cluster1/services/yarn/  2> /dev/null | egrep -B 1 'BAD|DISABLED|STOPPED' | grep -v 'YARN_USAGE_AGGREGATION_HEALTH' | grep -v 'DISABLED')
  if [ $? -eq 0 ]; then
    echo ""
    echo "***************************************************"
    echo "* ERROR: The catchup script has failed!           *"
    echo "* One or more required services are not running.  *"
    echo "* To fix this, check the cluster health using     *"
    echo "* Cloudera Manager and resolve any issues.        *"
    echo "* See Starting the Exercise Environment in the    *"
    echo "* Exercise Manual if necessary.                   *"
    echo "*                                                 *"
    echo "* Then run the catchup script again.              *"
    echo "***************************************************"
    echo ""
    exit 1
  fi
}


verify_hdfs() {

#  echo in verify_hdfs
#  curl -X GET -u "admin:admin" http://localhost:7180/api/v41/clusters/Cluster1/services/hdfs/  2> /tmp/out2
  result=$(curl -X GET -u "admin:admin" http://localhost:7180/api/v41/clusters/Cluster1/services/hdfs/  2> /dev/null | grep healthSummary | cut -d '"' -f4 2>/dev/null)

 #echo
 #echo result is \'$result\'
 if [[ "$result" != "GOOD" && "$result" != "CONCERNING" ]]; then
    echo ""
    echo "***************************************************"
    echo "* ERROR: The catchup script has failed!           *"
    echo "* One or more required services are not running.  *"
    echo "* To fix this, check the cluster health using     *"
    echo "* Cloudera Manager and resolve any issues.        *"
    echo "* See Starting the Exercise Environment in the    *"
    echo "* Exercise Manual if necessary.                   *"
    echo "*                                                 *"
    echo "* Then run the catchup script again.              *"
    echo "***************************************************"
    echo ""
    exit 1
  fi
}


verify_mysql(){
maria_db_status=$(systemctl | grep mariadb | awk '{print $2 $3 $4}' )
  if [ "$maria_db_status" != "loadedactiverunning" ]; then
    echo ""
    echo "*************************************************"
    echo "* ERROR: The catchup script has failed!         *"
    echo "* The MySQL database (MariaDB) is not running.  *"
    echo "* To fix this, start the service:               *"
    echo "*                                               *"
    echo "*           $ systemctl start mariadb           *"
    echo "*                                               *"
    echo "* Then run the catchup script again.            *"
    echo "*************************************************"
    echo ""
    exit 1
  fi
}

echo verify_api
verify_api

echo verify_service_running zookeeper
verify_service_running zookeeper
# verify_service_running spark_on_yarn
echo verify_service_running hive
verify_service_running hive
echo verify_service_running impala
verify_service_running impala
echo verify_service_running hue
verify_service_running hue

echo verify_hdfs
verify_hdfs
echo verify_yarn
verify_yarn

echo verify_mysql
verify_mysql

exit 0
