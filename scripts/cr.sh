#!/bin/bash
# Creates folder with needed stuff for THM CTF

for i in "$@"
do
case $i in
	-r|--room)
	ROOM_NAME="$2"
	shift
	shift
	;;
	-p|--platform)
	PLATFORM_NAME="$2"
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
    --ip=*)
    TARGET_IP="${i#*=}"
	shift
	;;
    --host=*)
    DOMAIN_NAME="${i#*=}"
    shift
    ;;
	-h|--help)
	echo -e "Create Room Script: Do CTF Routine faster!\n\n
    Options:\n
    -r | --room - \"Room Name\" [Will be replaced in sample file] \n
    -s | --sample - /path/to/sample/file\n
    -u | --user - username [Will be replaced in sample file]\n
    -h | --help - show this message\n
    --ip - if provided, run NMAP scan on this IP. (Usage: --ip=<ip>)\n
    --host - same as ip, but if you want to use Domain Name. (Usage: --host=<hostname.com>
	-p | --platform - platform where ctf was created. [Will be replaced in sample file] "
	exit 0
	;;
    -*)
    echo "Unknown option $1"
    exit 1
    ;;
esac	
done


if [ ! -z "$DOMAIN_NAME"  -a  ! -z "$TARGET_IP" ]; then
    echo "Do not use --host and --ip at the same time. Please choose one of this options"
    exit 1
fi

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

	sed -i -e "s/!PLATFORM/${PLATFORM_NAME}/g" "$DIR_NAME/README.md"
else
	echo "# [$PLATFORM_NAME] Notes by **$USERNAME** for **$ROOM_NAME**, $DATE" > "$DIR_NAME/README.md"
fi


function validate_ip() {
    octet="(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])"
    ip4="^$octet\\.$octet\\.$octet\\.$octet$" 
    [[ $1 =~ $ip4 ]] && echo 1 || echo 0
}

function nmap_scan() {
    host=$1
    
	echo -e "\n====================="
	echo "Performing NMAP Scan"
	echo -e  "====================="
    echo -e "HOST: $host \n"
	nmap -sC -sV -A -oN $DIR_NAME/nmap/initial $host 
}


if [ ! -z "$TARGET_IP" ]; then
    if [ "$(validate_ip $TARGET_IP)" -eq "0" ]; then
        while [ "$(validate_ip $TARGET_IP)" -eq "0" ]
        do
            read -r -p "Provided IP was invalid, try again: " TARGET_IP
        done
    fi
    nmap_scan $TARGET_IP
elif [ ! -z "$DOMAIN_NAME" ]; then
    nmap_scan $DOMAIN_NAME
fi

