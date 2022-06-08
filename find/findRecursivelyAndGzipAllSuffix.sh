if [ $# -eq 0 ]; then echo "Usage: scriptname suffix1 suffix2 ... suffixN "; exit ; fi


for SFX in $@ ; do
  echo $SFX
  find . -type f -print -name "*${SFX}" -exec gzip {} \;
  echo
done
