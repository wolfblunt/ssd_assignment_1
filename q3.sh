# Kaprekar's routine
#!/bin/bash
echo "Enter Four-digit number as input, using at least two different digits"
read n

arrToNo()
{
	local -n arr1=$1

	d=0
	for ((i=0; i<len; i++))
        do
        	d=$((d*10))
        	d=$((d+arr1[i]))
	done
}

sortno()
{
	number=$1
        len=${#number}
        for ((i=0; i<len; i++))
        do
        	arr[$i]=${number:$i:1}
	done 
	#echo "${arr[@]}"
	
	readarray -t arrSorted < <(printf '%d\n' "${arr[@]}" | sort)
	readarray -t arrDesc < <(printf '%d\n' "${arr[@]}" | sort -r)
	
	arrToNo arrSorted
	sortN=$d
	arrToNo arrDesc
	descN=$d
}


kaprekar()
{
	n=$1
	if (($n==0000 || $n==1111))
	then
		echo 0
	elif (( $n == 6174 ))
	then
		echo "$n"
	else
		echo -n "$n, "
		sortno $n
		n1=sortN
		n2=descN
		finn=$((n2-n1))
		kaprekar $finn
	fi
}





kaprekar $n
