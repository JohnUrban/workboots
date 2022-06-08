#!/bin/bash


#if [ $# -eq 0 ]; then echo "Usage: scriptname "; exit ; fi


find . -type f -name "*" -exec du -c {} + | sort -k1,1nr


