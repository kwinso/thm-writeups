Advent of Cyber Day 7

===================================
undermouse | 7th of September, 2020
===================================

```bash
export IP=10.10.239.47
mkdir nmap
```

# 1 How many TCP ports are open under 1000?

```bash
sudo nmap -sC -sV -O nmap/initial $IP
```

```
3
```

#2 What is the name of the OS of the host?

```bash

```

```
Linux
```

#3 What version of SSH is running?

```
7.4
```

#4 	What is the name of the file that is accessible on the server you found running?

```
interesting.file
```