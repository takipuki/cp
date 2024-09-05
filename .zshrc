infile="in"
ansfile="ans"

cf_old () {
  url=$1
  html=`curl -s $url | htmlq '.sample-test'`

  echo $html |
    htmlq '.input pre' |
    sed -E 's/<div[^>]*>([^<]*)<\/div[^>]*>/\1\n/g' |
    sed -E 's/<\/?pre[^>]*>//g' |
    sed '/^$/d' > $infile
  
  echo $html |
    htmlq '.output pre' |
    sed -E 's/<\/?pre[^>]*>//g' |
    sed '/^$/d' > $ansfile
}

cf () {
  sed '/^$/d' |
    sed '/Copy/d' |
    while read -r line; do
      if [ "$line" = "Input" ]; then
        echo -n > $infile
        f="$infile"
      elif [ "$line" = "Output" ]; then
        echo -n > $ansfile
        f="$ansfile"
      else echo $line >> $f
      fi
    done
}

tst () {
  make -s cf && ./exe < $infile |
      paste $ansfile - |
      awk -F '\t' '{ printf "\033[0;32m%-39s", $1;
                     gsub(/[ \t]+$/, "", $1);
                     gsub(/[ \t]+$/, "", $2);
                     if ($1 != $2) printf "\033[0;31m";
                     printf "%s\033[0m\n", $2 }'
}

run () {
  make -s deb && ./exe
}
