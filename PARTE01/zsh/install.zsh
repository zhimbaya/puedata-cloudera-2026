#!/bin/zsh

tut=$HOME/bbdd/tutorial

#
# borra $tut si existe
#
if [[ -d $tut ]] ; then
  rm -rf $tut
fi

#
# crea $tut
#
mkdir -p $tut

#
# Situarse en $tut
#
cd $tut

# Mover zip a directorio
# y extraerlo
mv $HOME/thinclient_drives/GUACFS/tutorial.zip .
unzip -qq tutorial.zip

#
# Ejecutar comandos para crear
# base de datos y usuario
./setup.ksh

#
# Mover ficheros que no se necesitan ya
mkdir -p $HOME/tmp
mv create*.sql *.zip *.ksh $HOME/tmp

#
# Probar acceso a la base de datos
./maria temp.sql
