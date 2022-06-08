#!/bin/bash

SEED=$RANDOM

UNAME=$( uname )
if [ $UNAME == "Linux" ]; then 
  DATE=$( date | awk '{print $2"-"$3"-"$4}' )
elif [ $UNAME == "Darwin" ]; then
  DATE=$( date | awk '{print $3"-"$2"-"$(NF)}' )
else
  DATE=today
fi

TMP=tmpdir_md5loop_${DATE}_${SEED}

mkdir -p ${TMP}

for DIR in *; do 
  if [ -d ${DIR} ]; then
    find ./${DIR} -type f  -exec md5sum-lite {} \; > ${TMP}/${DIR}.txt &
  fi
done
wait

echo "Concatenate with the following command:"
echo "cat ${TMP}/\*"
echo "Remove tmpdir: rm -r ${TMP}"
