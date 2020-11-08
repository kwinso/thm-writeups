[THM] Fowsniff CTF
================
Notes by umouse, 08.11.2020


# NMAP
Nmapped the machine, results are saved to nmap/initial file.

Interesting info:
- Machine running ubuntu.
- There's Apache Server and SSH service.
- Two more ports.

Let's check the web server

Looks like employees' passwords were leaked.
I've saved them to crack with hashcat.
