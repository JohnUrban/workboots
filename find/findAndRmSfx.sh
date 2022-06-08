#!/bin/bash


if [ $# -eq 0 ]; then echo "Usage: scriptname suffix1 suffix2 ... suffixN "; exit ; fi


for SFX in $@ ; do
  echo $SFX
  if [ $SFX == "/" ] ; then echo "Don't use // root....." ; exit ; fi
  ##find . -type f -print -name "*${SFX}" -exec gzip {} \;
  ## find . -type f -name "*${SFX}" -exec du -ch {} +   
  find . -type f -name "*${SFX}" -exec rm -v {} +
  echo
done


## ENDING FIND WITH + OR ;
## + means to execute command just once on all files found as args to it
## \; means to execute command indpenendently on each file found
## for files 1 2 3 
## + means rm 1 2 3
## ; means rm 1; rm 2; rm 3
