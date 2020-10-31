Advent of Cyber Day 12

===================================
undermouse | 8th of September, 2020
===================================

Downloaded file.
```bash
unzip tosend.zip
```

#1 	What is the md5 hashsum of the encrypted note1 file?

```bash
md5sum note1.txt.gpg
```

```
24cf615e2a4f42718f2ff36b35614f8f
```

#2 Where was elf Bob told to meet Alice?


```bash
gpg --decrypt note1.txt.gpg
```

```
Santa's Grotto
```

#3 Decrypt note2 and obtain the flag!

```bash
openssl rsautl -decrypt -inkey private.key  -in note2_encrypted.txt -out note2_decrypted.txt
```

```
THM{ed9ccb6802c5d0f905ea747a310bba23}
```