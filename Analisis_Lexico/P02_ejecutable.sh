#!/bin/bash
# @Autor Alejandro Hernandez Gomez, Johan Axel Zarazua Ramirez
# @Fecha 04/10/2021
# @Descripcion shell script para ejecutar proyecto flex

#obtiene ruta actual del script
path=$(cd `dirname $0`; pwd)

echo "Moviendose al directorio de ejecucion => " ${path}
#echo ${path}
cd ${path}

#se compila el archivo Flex para generar Scanner.cpp
flex Lexer.ll

#se compilan los archivos necesarios para el proyecto
g++ main.cpp Scanner.cpp -o scanner

#ejecuta el proyecto
./scanner ../prueba