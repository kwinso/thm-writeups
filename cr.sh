#!/bin/bash
# Creates folder with needed stuff for THM CTF

NMAP=0
for i in "$@"
do
case $i in
	-r|--room)
	ROOM_NAME="$2"
	shift
	shift
	;;
	-s|--sample)
	SAMPLE_FILE="$2"
	shift
	shift
	;;
	-u|--user)	
	USERNAME="$2"
	shift
	shift
	;;
	-n|--nmap)
	NMAP=1
	shift
	;;
	-h|--help)
	echo "-r|--room - \"Room Name\""
	echo "-s|--sample - /path/to/sample/file"
	echo "-u|--user - username"
	echo "-h|--help - show this message"
	echo "-n|--nmap - run nmap scan"
	exit 0
	;;
esac	
done

if [ -z "$ROOM_NAME" ]; then
	echo "Required param -r not set. See -h for help"
	exit
elif [ -z "$USERNAME" ]; then
	read -r -p "Username not set, use $USER? [Y/n] " input
 
	case $input in
		[yY][eE][sS]|[yY])
	    	USERNAME=$USER
		;;
		*)
		echo "Exitting..."
		exit 0
		;;
	esac
fi

DIR_NAME=${ROOM_NAME//" "/"-"}
DIR_NAME=${DIR_NAME,,}

mkdir -p  "$DIR_NAME/nmap"
echo Created $DIR_NAME

DATE=$(date +"%d.%m.%Y")

if [ ! -z $SAMPLE_FILE ]; then
	if [ ! -f "$SAMPLE_FILE" ]; then
		echo "$SAMPLE_FILE not found."
		exit
	fi
		
	# creating notes from sample file
	cp $SAMPLE_FILE "$DIR_NAME/README.md"

	sed  -i -e "s/!DATE/${DATE}/g" "$DIR_NAME/README.md"

	sed  -i -e "s/!ROOM/${ROOM_NAME}/g" "$DIR_NAME/README.md"

	sed  -i -e "s/!USERNAME/${USERNAME}/g" "$DIR_NAME/README.md"
else
	echo "# [THM] Notes by **$USERNAME** for **$ROOM_NAME**, $DATE" > "$DIR_NAME/README.md"
fi


if [ "$NMAP" -eq 1 ]; then
	echo -e "\n\n====================="
	echo "Performing NMAP Scan"
	echo -e  "=====================\n\n"
	echo "Command nmap -sC -A -oN $DIR_NAME/nmap/inital <IP>"

	read -r -p "IP: " IP

	echo -e "\n\n"

	nmap -sC -sV -A -oN $DIR_NAME/nmap/initial $IP
fi
