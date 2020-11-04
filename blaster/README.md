[THM] Blaster
================
Notes by undermouse, 04.11.2020



# [TASK 1] Activate Forward Scanners and Launch Proton Torpedoes
## #1 How many ports are open on our target system?
```
2 (idk why 2 bc nmap found 6 -_______-)
```

## #2 Looks like there's a web server running, what is the title of the page we discover when browsing to it?
```
ISS Windows Server
```

## #3 Interesting, let's see if there's anything else on this web server by fuzzing it. What hidden directory do we discover?
```
/retro
```

## #4 Navigate to our discovered hidden directory, what potential username do we discover?
```
wade
```


## #5 Crawling through the posts, it seems like our user has had some difficulties logging in recently. What possible password do we discover?
```
parzival
```

## #6 Log into the machine via Microsoft Remote Desktop (MSRDP) and read user.txt. What are it's contents?
```
THM{HACK_PLAYER_ONE}
```

# [TASK 2] Breaching the Control Room
## #1 When enumerating a machine, it's often useful to look at what the user was last doing. Look around the machine and see if you can find the CVE which was researched on this server. What CVE was it? 

Just check the bin!
```
CVE-2019-1388
```

## #2 What's the name of executable?
```
hhupd
```

## #4 Now that we've spawned a terminal, let's go ahead and run the command 'whoami'. What is the output of running this? 
```
nt authority\system
```


## #5 Now that we've confirmed that we have an elevated prompt, read the contents of root.txt on the Administrator's desktop. What are the contents? Keep your terminal up after exploitation so we can use it in task four!
```
THM{COIN_OPERATED_EXPLOITATION}
```


# [TASK 3] Adoption into the Collective 
## #2 First, let's set the target to PSH (PowerShell). Which target number is PSH? 
```
2
```

