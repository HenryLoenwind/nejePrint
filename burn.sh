#!/bin/bash

echo -en '\x06\x3C' > $1
sleep 1

echo -en '\xF1' > $1

echo All Done
