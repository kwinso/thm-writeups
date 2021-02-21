AoC2, Day 9 | TryHackMe
=========
udnermouse, 08.01.2021



### Interesting file
Got access to the service with `anonymous` username.  
Found .sh file in `/public` directory on the ftp server.  
Replaced code in this script to my reverse shell.  
  
Then set up a `netcat` listener:
```bash
nc -lnvvp 9999
```
  
Then I've uploaded that file with `put` command in directory.  
Since it runs every minute, I've got my reverse shell in 10 secs.

### Flag
It was in `/root/flag.txt`.
