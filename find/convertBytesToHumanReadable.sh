#!/bin/bash

function help {
  echo " 
	Usage:
		convertBytesToHumanReadable.sh filename bytescolumn [ls]
			- ls = ls mode; default is du -sk mode.
	Output:
		human readable in first position with input columns following.
"
}
if [ $# -eq 0 ]; then help ; exit ; fi


FILE=$1
COL=$2

python -c "
import numpy as np; import sys ; 
col=int(sys.argv[2])-1
file=sys.argv[1]
j = 0 if sys.argv[-1] == 'ls' else 1
with open(file) as fh:
  for line in fh:
      line = line.strip().split()
      size = int(line[col])
      i=np.floor(np.log(size)/np.log(1024)); 
      ans=str(round(size/(1024**i))) + ['B', 'K', 'M', 'G', 'T'][int(i+j)] ; 
      out=('\t').join([ans]+line) 
      print(out)
" ${FILE} ${COL} ${@:3}

#sys.stderr.write(out + "\n")
