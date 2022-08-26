#!/bin/bash
flag=1

isPalindrome() {
        local s=$1
        local len=${#s}
        for (( i=0;i<len/2;i+=1 )); do
                if [[ ${s:i:1} != ${s:len-i-1:1} ]]; then
                        return 0 # false
                fi
        done
        flag=0
        return 1 # true
}

islowertogether() {
	local sm=$1
	if [[ "$sm" =~ [a-z][0-9] || "$sm" =~ [0-9][a-z] ]]
	then
   		#echo 1
   		return 1
	else
   		#echo 0
   		return 0
	fi
}

isSpecialSymbol()
{
	local ssy=$1
	if [[ "$ssy" =~ ^[\!@#\$%^\&] || "$ssy" =~ [\!@#\$%^\&][\!@#\$%^\&] ]]
	then
   		#echo 1
   		return 1
	else
   		#echo 0
   		return 0
	fi

}

isupperEnd() {
	local cl=$1
	if [[ "$cl" =~ [A-Z]$ ]]
	then
   		#echo 1
   		return 1
	else
   		#echo 0
   		return 0
	fi
}


while [ $flag -eq 1 ]
do
	choose() { echo ${1:RANDOM%${#1}:1} $RANDOM; }

	{
		choose '!@#$%^\&'
		choose '0123456789'
		choose 'abcdefghijklmnopqrstuvwxyz'
		choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

		for i in $( seq 1 $(( 5 + RANDOM % 9 )) )
		do
			choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
		done

	} | sort -R | awk '{printf "%s", $1}' > file.txt
	#echo ""
	
	filename="file.txt"
	password=$(<$filename)
	#pali=$(isPalindrome $password)
        #echo $?
        isPalindrome $password
	if [[ $? -ne 0 ]]; then
		flag=1
        	continue
        fi
        
        #low_c=$(islowertogether $password)
        #echo $?
        islowertogether $password
	if [[ $? -ne 0 ]]; then
		flag=1
        	continue
        fi
        
        #sp_symbol=$(isSpecialSymbol $password)
        isSpecialSymbol $password
	if [[ $? -ne 0 ]]; then
		#echo "Lower Found"
		flag=1
        	continue
        fi
        #else
        #	echo $password
        #fi
        
        #cap_s=$(isupperEnd $password)
        isupperEnd $password
        if [[ $? -ne 0 ]]; then
		flag=1
        	continue
        else
        	flag=0
        	echo $password
        fi
done
