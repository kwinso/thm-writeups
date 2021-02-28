[THM] overpass
================
Notes by undermouse, 28.02.2021


# NMAP
Nmap found ports 80 and 22 open.

# Gobuster
Found these routes:
```
/img (Status: 301)           
/downloads (Status: 301)     
/aboutus (Status: 301)        
/admin (Status: 301)          
/css (Status: 301)    
```

# Exploring the website

- Found interesting comment about "Romans" cryptography, that probably leads to Ceaser Cipher also known as ROT.
- Found source code of the program on `/downloads`.

#### Exploring the binary
- Reading source code gave me not a lot of info but this guys really use ROT cipher (ROT-47 to be clear)

#### Admin page
As we've seen there's a `/admin` page.  
Hint on TryHackMe says it's OWASP TOP 10 Vuln. So I've tried some SQLi, but this didn't worked.  

Let's move to the `Broken Auth` vuln.   
I've found `login.js` file in the `degugger` tab in Firefox. I've noticed that there's no verification for token. It just gets set and the page is reloaded.  
So I've opened browser's console and typed:
```js
Cookie.set("SessionToken", "overpass"); // "overpass" can be basically any work
```


# Bruting James' Password
It done with `ssh2john` and `john` with `rockyou.txt` wordlist.

## Root
Found cron job which gets a script and runs it by root.
`/etc/hosts` was world-writable, so I chaned the domain to my machine, created a little http server with python with the same structure as the original overpass.thm site and spinned up a nc listener. Then I got root shell.
