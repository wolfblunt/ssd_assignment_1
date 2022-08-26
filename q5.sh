#!/bin/bash
echo "Enter the Lucas Number which you want to print"
read n
f1=2
f2=1
if [ $n == 0 ]; then
  echo "$f1"
fi
if [ $n == 1 ]; then
  echo "$f2"
fi
for((i=2;i<=$n;i++))
do
    #fn=$((f1 + f2))
	#fn=`expr $f1 + $f2`
    fn=$(bc <<< "$f1+$f2")
    f1=$f2
    f2=$fn
done
echo "$fn" | bc
