# Twin routine
#!/bin/bash
echo "Enter the number n"
read n
t_n=$n

twinprime()  
{  
	nt=$1
	k=2
	len=$((nt/2))
	# use for loop to find the twin prime  
    
	for ((k=2; k<=len; k++))
        do
        	if [ $(expr $nt % $k) -eq 0 ]
		then
			return 0
		fi
	done
	
	if [ $k -gt $(expr $nt / 2) ]
	then
		return 1
	fi
}

sum=0
      
for ((i=2; i<=n; i++))
do  
	twinprime $i
	t1=$?
	twinprime $((i+2))
	t2=$?
	#echo "--------------"
	#echo "Value of i"
	#echo $i
	#echo "Value of t1"
	#echo $t1
	#echo "Value of t2"
	#echo $t2
	#echo "--------------"
	#if (twinprime $i==1 && twinprime $((i+2))==1)
	if [ $t1 -eq 1 ]
	then
		if [ $t2 -eq 1 ]
		then
			d1=$(expr $i + 2)
			d2=$i
			d=$((d1*d2))
			q=$d
			d_sum=0
			while [ $q -gt 0 ]
			do
				#echo -n "$j "
				r=$(expr $q % 10)
				d_sum=$((r+d_sum))
				q=$(expr $q / 10)
			done
			sum=$((sum+d_sum))
		fi
	fi
done

echo $sum
