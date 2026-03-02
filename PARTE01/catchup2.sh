#!/bin/bash

handlePrematureTermination() {
  echo ""
  echo ""
  echo "WARNING: This script has been terminated before completion!"
  echo "Execute the command to run the script again."
  echo ""
  exit 1
}

trap handlePrematureTermination SIGINT SIGTERM

checkServices() {
  ~/training_materials/analyst/scripts/check_services2.sh
  rc=$?
#  echo $rc
  if [[ $rc != 0 ]]; then
    exit $rc;
  fi
}

killSpark() {
  ~/training_materials/analyst/scripts/shut_down_spark.sh WARN
}

setExerciseNames() {
  EXERCISES[0]="Data Ingest with Hadoop Tools"
  EXERCISES[1]="Running Queries from the Shell, Scripts, and Hue"
  EXERCISES[2]="Using Functions"
  EXERCISES[3]="Data Management"
  EXERCISES[4]="Data Storage and Performance"
  EXERCISES[5]="Working with Multiple Datasets"
  EXERCISES[6]="Analytic Functions"
  EXERCISES[7]="Complex Data"
  EXERCISES[8]="Analyzing Text with Hive"
  EXERCISES[9]="Hive Optimization"
  EXERCISES[10]="Impala Optimization"
  EXERCISES[11]="Data Transformation with Hive"
  EXERCISES[12]="Analyzing Abandoned Carts"
  EXERCISES[13]="Using Apache Kudu with Apache Impala"
}

getStartState() {
  validResponse=0
  while [ $validResponse -eq 0 ]
  do
    echo ""
    echo "Please enter the number of the exercise that you want to do."
    echo "This script will reset your system to the start state for that exercise."
    echo ""
    echo " 1" ${EXERCISES[0]}
    echo " 2" ${EXERCISES[1]}
    echo " 3" ${EXERCISES[2]}
    echo " 4" ${EXERCISES[3]}
    echo " 5" ${EXERCISES[4]}
    echo " 6" ${EXERCISES[5]}
    echo " 7" ${EXERCISES[6]}
    echo " 8" ${EXERCISES[7]}
    echo " 9" ${EXERCISES[8]}
    echo "10" ${EXERCISES[9]}
    echo "11" ${EXERCISES[10]}
    echo "12" ${EXERCISES[11]}
    echo "13" ${EXERCISES[12]}
    echo "14" ${EXERCISES[13]}
    echo ""
    read EXERCISE
    if [[ $EXERCISE -ge 1 && $EXERCISE -le 14 ]]; then
      PENULTIMATE=$((EXERCISE-1))
      validResponse=1
    else
      echo ""
      echo "Invalid response. Please re-enter a valid exercise number."
      echo ""
    fi
  done
}

doCatchup(){
  if [[ $EXERCISE -gt 1 ]]; then
    ADVANCE_TO=lab$PENULTIMATE
  else
    ADVANCE_TO=cleanup
  fi
  ~/training_materials/analyst/scripts/advance_labs.sh $ADVANCE_TO
  echo ""
  echo "You can now perform the" ${EXERCISES[$PENULTIMATE]} "exercise."
  echo ""
}

#echo setExerciseNames
setExerciseNames
#echo getStartState
getStartState
#echo checkServices
checkServices
#echo killSpark
killSpark
#echo doCatchup
doCatchup
