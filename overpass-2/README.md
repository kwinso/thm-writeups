[THM] OverPass 2
================
Notes by undermouse, 19.03.2021

## Backdoor
I thought that I could connect to the backdoor that hacker leaved.
There was 2 ssh ports open. 1st is on port `22`, the second one on port `2222`. So, it's obvious what's the backdoor.  
Using the brootforced password from salt for the backdoor, I was in the machine as `james`.

## user.txt
```bash
cat /home/james/user.txt
```

## root.txt
I tried to see what `james` can run with sudo. The password that attacker used to gain access didn't work, so I've came back to `wireshark` and found output for `sudo -l`, turns out `james` can run anything with `sudo`. But it gives nothing since I don't know password for `james`.  
  
Let's try something different, like finding `SUID` files.
```bash
find / -perm -4000 2>/dev/null
```
Some interesting file appeared in the output:
```
/home/james/.suid_bash
```
So, if it's `SUID` bash, then I can use `bash -p` to get a `root` shell.   
root.txt:
```bash
cat /root/root.txt
```

