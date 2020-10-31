undermouse, 31.10.2020
======================
[THM] Simple CTF
======================

```bash
export IP=10.10.82.177
```

#1 How many services are running under port 1000?
```bash
# let's check with nmap
nmap -sC -sV -oN nmap/initial $IP
```
## Answer
```
2
```
#2 What is running on the higher port?

Nmap has shown **SSH** running on port 2222.

## Answer
```
SSH
```
#3 What's the CVE you're using against the application?
There's app running on a web site on _/simple_ path. SQL Injection is our friend!
```
CVE-2019-9053
```

#4 To what kind of vulnerability is the application vulnerable?
```
sqli
```
#5 What's the password?
I've just mirrored the exploit and passed URL with the wordlist.
Then waited...

Found:
```
username: mitch
password: **secret**
email: amdin@amdin.com
```
## Answer
```
secret
```
#6 Where can you login with the details obtained?
## Answer
```
ssh
```
_ho-ho-ho lets connect!_

#7 What's the user flag?
## Answer

```
G00d j0b, keep up!
```
#8 Is there any other user in the home directory? What's its name?
## Answer
```
sunbath
```
#9 What can you leverage to spawn a privileged shell?
Ran `sudo -l` and get vim.
## Answer
```
vim
```
#10 Root flag.
## Answer
```
W3ll d0n3. You made it!
```