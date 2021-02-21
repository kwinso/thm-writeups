AoC2, Day 16 | TryHackMe
===========
undermouse, 14.01.2021

# Pre-scan
```bash
export IP=MACHINE_IP

# What is the port number for the web server?
```bash
nmap -sC -sV -oN nmap/initial $IP
```


# Without using enumerations tools such as Dirbuster, what is the directory for the API?  (without the API key)
```
80
```
# Without using enumerations tools such as Dirbuster, what is the directory for the API?  (without the API key)
Well, where could _api_ directory be?
```
/api/
```

# Where is Santa right now?
```
Winter Wonderland, Hyde Park, < The capital of Greate Britain ;) >.
```

# Find out the correct API key. Remember, this is an odd number between 0-100. After too many attempts, Santa's Sled will block you. 
```
find it yourself.
```