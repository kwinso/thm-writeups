Advent of Cyber Day 10

===================================
undermouse | 7th of September, 2020
===================================

```bash
export IP=10.10.156.45
```



#1 	Compromise the web server using Metasploit. What is flag1?


```
THM{3ad96bb13ec963a5ca4cb99302b37e12}
```


#2 	Now you've compromised the web server, get onto the main system. What is Santa's SSH password?

Creds found in /home/santa/ssh-creds.txt

```
santa:rudolphrednosedreindeer
```


#3 	Who is on line 148 of the naughty list?

```bash
cat naughty_list.txt -n | grep 148
> 148  Melisa Vanhoose
```

```
Melisa Vanhoose
```

#4 Who is on line 52 of the nice list?

```bash
cat nice_list.txt -n | grep 52
> 52  Lindsey Gaffney
```

```
Lindsey Gaffney
```