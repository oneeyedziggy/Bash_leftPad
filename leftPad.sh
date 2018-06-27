#!/usr/bin/env bash
padStr=$1
#echo ${padStr}

padLen=$2
#echo ${padLen}

padChar=($3 0)
#echo ${padChar}

re='^[0-9]+$'
if ! [[ ${padLen} =~ $re ]] ; then
   echo "error: Not a number" >&2;
   exit 1
fi

padStr=$(printf "${padChar}%.0s" $(seq 1 ${padLen}))${padStr}

#this would work too
#echo ${padStr:$(( ${#padStr} - ${padLen} )):${padLen}}
echo ${padStr} | grep -Eo .\{0,${padLen}\}$
exit 0
