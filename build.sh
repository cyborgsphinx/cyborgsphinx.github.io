#! /bin/bash

#DIR=`dirname "$1"`
#TEMPLATE="$DIR"/template

#echo "$TEMPLATE"
pandoc -t html "$1" --template=$3 | tidy -qi -o "$2"
