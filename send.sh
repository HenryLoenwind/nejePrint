#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage:"
    echo " nejePrint.sh SERIALDEVICE IMAGE"
    exit
fi

actualsize=$(wc -c <"$2")

if [ $actualsize -ne 32830 ]; then
    echo "Image must be 512x512 BMP 1 bit color depth"
   exit
fi


echo setting port...
stty 57600 < $1
sleep 1
stty < $1
echo done

echo Sending
echo -en '\xFE\xFE\xFE\xFE\xFE\xFE\xFE\xFE' >$1
sleep 3
cat $2 > $1
echo done
sleep 7

echo All Done
