AoC2, Day 10 | TryHackMe
=======
undermouse, 08.01.2021



# enum4linx
Scanned the host with the `enum4linux`, I've got this:
```
 ============================== 
|    Users on  MACHINE_IP      |
 ============================== 
index: 0x1 RID: 0x3e8 acb: 0x00000010 Account: elfmcskidy	Name: 	Desc: 
index: 0x2 RID: 0x3ea acb: 0x00000010 Account: elfmceager	Name: elfmceager	Desc: 
index: 0x3 RID: 0x3e9 acb: 0x00000010 Account: elfmcelferson	Name: 	Desc: 

user:[elfmcskidy] rid:[0x3e8]
user:[elfmceager] rid:[0x3ea]
user:[elfmcelferson] rid:[0x3e9]

 ========================================== 
|    Share Enumeration on MACHINE_IP       |
 ========================================== 

	Sharename       Type      Comment
	---------       ----      -------
	tbfc-hr         Disk      tbfc-hr
	tbfc-it         Disk      tbfc-it
	tbfc-santa      Disk      tbfc-santa
	IPC$            IPC       IPC Service (tbfc-smb server (Samba, Ubuntu))
SMB1 disabled -- no workgroup available
```

Then enum4linux mapped through shares, and my was interested in this share:
```
//10.10.205.217/tbfc-santa	Mapping: OK, Listing: OK
```

So, I've connected to this with `""`(empty line, just hit enter) password and got access to the Santa's data.


# Flag
There was no flag on this day, I was just answering to the questions.
