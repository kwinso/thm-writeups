AoC 2, Day 13 | TryHackMe
===========
undermouse


## Scanning

### Nmap
NMAP resulst are in `nmap/initial`.  
Found interesting service on port 23:
```
telnet
```


## Looking around

Tried to connect to `telnet` service with
```bash
telnet $MACHINE_IP 23
```

On login I got message & login prompt.  
Message:
```
HI SANTA!!! 

We knew you were coming and we wanted to make
it easy to drop off presents, so we created
an account for you to use.

Username: santa
Password: clauschristmas

We left you cookies and milk!
```

I used `santa:clauschristmas` to login and got `sh` shell.


## Enumeration

```bash
cat /etc/*release
```
Output:
```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=12.04
DISTRIB_CODENAME=precise
DISTRIB_DESCRIPTION="Ubuntu 12.04 LTS"
```

Found file `cookies_and_milk.txt` which was a portion of `dirtycow` exploit.  
I found whole file on [exploitdb](https://www.exploit-db.com) and transfered it to the target with python http server.

## Root
I ran the exploit and got user `fartfart` with password `yikes` (I've chosen it manually).

Instructions how to get a flag were in `/root` dir.

## Special

I love you, John Hammond <3  
![Happy Christmas, even it's already was](https://i.imgur.com/JW5ukTL.png)
