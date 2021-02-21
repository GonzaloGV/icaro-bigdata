#!/bin/bash

number=$(( 1 + $RANDOM % 10))
echo "Ingrese un numero entre 1 y 10"
read guess_number

while [[ -n ${guess_number//[0-9]/} ]] 
do
    echo "ERROR! input invalido."
    echo "Ingrese un numero entre 1 y 10."
    read guess_number
done


if [ $(( number - guess_number)) -eq 0 ] 
then
    echo "Ganaste! el numero es $number";
else
    echo "Perdiste! el numero es $number";
fi
