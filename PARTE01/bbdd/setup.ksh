#!/bin/zsh
#
# Crea la base de datos tutorial
# y el usuario tutorial
sudo mariadb -u root < create_database_and_user2.sql

# Crea las tablas con datos
mariadb -ututorial -ptutorial tutorial < create_populate_tables2.sql
