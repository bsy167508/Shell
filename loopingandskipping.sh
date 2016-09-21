echo "The Test Command and Operators"

#The command used in conditionals nearly all the time is the test command. Test returns true or false (more accurately, exits with 0 or non zero status) depending respectively on whether the test is passed or failed. It works like this:
#test operand1 operator operand2
#for some tests, there need be only one operand (operand2) The test command is typically abbreviated in this form:
#[ operand1 operator operand2 ]
#To bring this discussion back down to earth, we give a few examples:

X=3
Y=4
empty_string=''
if [ $X -lt $Y ] # is $X less than $Y?
then
	echo "\$X=${X}, which is smaller than \$Y=${Y}"
fi

if [ -n "empty_string" ]; then
	echo "empty_string is non empty"
fi

if [ -e "${HOME}/.fvwmrc" ]; then #test to see ~/.fvwmrc exists
	echo "You have a .fvwmrc file"
	if [ -L "${HOME}/.fvwmrc" ]; then #is it a symlink?
		echo "it's a symbolic link"
	elif [ -f "${HOME}./fvwmrc" ]; then #is it a regular file?
		echo "it's a regular file"
	fi
else
	echo "you have no .fvwmrc file"
fi

#The syntax for the for loops is best demonstrated by example.

for X in red green blue
do
	echo $X
done

#if some of the items have embedded spaces you need to protect them with double quotes

colour1='red'
colour2="light blue"
colour3="dark green"
for X in "$colour1" "$colour2" "$colour3"
do
	echo $X
done

#and this is another example


for X in *.html
do
	grep -l '<UL>' "$X" #learn later
done

#and a while loop is also present

X=1
while [ $X -le 20 ]
do
	echo $X
	X=$( ($X+1) ) #learn later
done

# for bash version 4+ we have {START..END..INCREMENT} syntax:

for i in {0..10..2}
do
	echo "Welcome $i"
done

#Three expression bash for-loop syntax

for (( c=1; c<=5; c++ ))
do
	echo "Welcome $c"
done
#This is an infinite loop

#for (( ; ; ))
#do
	#echo "infinite loops [ hit ctrl+c to stop ]"
#done

#Conditional exit with break

for file in /etc/*
do
	if [ "${file}" == "/etc/resolv.conf" ]
	then
		countNameservers=$(grep -c nameserver /etc/resolv.conf)
		echo "Total ${countNameservers} nameservers defined in ${file}"
		break
	fi
done

#continue statement

for f in $FILES
do
	if [ -f ${f}.bak ] # if .bak backup file exists, read next file
	then
		echo "Skipping $f file..."
		continue #read next file and skip the cp command
	fi
	# we are here means no backup file exists, just use cp command to copy file
	/bin/cp $f $f.bak
done
