sudo mariadb -u root < sakila-schema.sql
sudo mariadb -u root < grant_training.sql
mariadb -t -utraining -ptraining sakila < sakila-data.sql
