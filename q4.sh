# Palindrome days
#!/bin/bash
echo "Enter the year"
read year

PalindromeCheck()
{	
	r_year=$(rev<<<"${year}")
	d="$r_year$year"
	r_d=$(rev<<<"${d}")
        
        if [ "$d" = "$r_d" ]; then
        	day=${r_d:0:2}
        	month=${r_d:2:2}
        	#if (($day -gt 30] || [$day -lt 1))
		if [[ ($month -gt 12) || ($month -lt 1) ]]
		then
			echo "No Palindrome days available in the given year"
		elif [[ ($day -gt 31) || ($day -lt 1) ]]
		then
			echo "No Palindrome days available in the given year"	
		else
			if [[ ($month==2) || ($month==4) || ($month==6) || ($month==9) || ($month==11) ]]
			then
				if [[ ($day -gt 30) ]]
				then
					if [[ $month==2 ]]
					then
						if [[ ((($(expr $year % 4) == 0) && ($(expr $year % 100) != 0)) || ($(expr $year % 400) == 0)) ]]
						then
							if [[ ($day -gt 29) ]]
							then
								echo "No Palindrome days available in the given year"
							else
								ddate="$day-$month-$year"
								echo $ddate
							fi
						else
							if [[ ($day -gt 28) ]]
							then
								echo "No Palindrome days available in the given year"
							else
								ddate="$day-$month-$year"
								echo $ddate
							fi
						fi
					else
						echo "No Palindrome days available in the given year"
					fi
				else
					ddate="$day-$month-$year"
					echo $ddate
				fi
			else
				ddate="$day-$month-$year"
				echo $ddate
			fi
		fi
	else
        	echo "It is not a palindrome."
	fi
}

PalindromeCheck $year
