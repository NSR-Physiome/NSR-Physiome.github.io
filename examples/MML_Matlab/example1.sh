#!/bin/sh

A=.5

while (true) 
do
  echo "==running jsbatch gene1 with A=$A"
  BNEW=`jsbatch -f gene1.mod -i A=$A -oprec 3 -o B -ofmt pretty |\
      awk '{ print$2 }'`
  if [ "$B" = "$BNEW" ]
  then
    exit
  fi
  B=$BNEW

  echo "==running matlab gene2 with B=$B"
  echo "B=$B" > temp2.m
  cat gene2.m >> temp2.m
  matlab -nodesktop -nosplash -r temp2 >> /dev/null
  A=`sed 's/ //g' gene2.out`
done
     
