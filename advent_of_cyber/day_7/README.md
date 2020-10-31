[THM] Advent of Cyber, Day 7
=============================
### undermouse, 07.09.2020


# Enviroment
```bash
export IP=10.10.239.47
```

# #1 How many TCP ports are open under 1000?

```bash
sudo nmap -sC -sV -O nmap/initial $IP
```

```
3
```

# #2 What is the name of the OS of the host?
```
Linux
```

# #3 What version of SSH is running?

```
7.4
```

# #4 What is the name of the file that is accessible on the server you found running?

```
interesting.file
```