[THM] Capture The Flag
================
Notes by undermouse, 03.11.2020


# [TASK 1] Translation & Shifting 
## #1 c4n y0u c4p7u23 7h3 f149?
This is leatspeak. Gotta learn this :)
### Answer
```
can you capture the flag?
```

## #2 01101100 01100101 01110100 01110011 00100000 01110100 01110010 01111001 00100000 01110011 01101111 01101101 01100101 00100000 01100010 01101001 01101110 01100001 01110010 01111001 00100000 01101111 01110101 01110100 00100001
Binary. Can be converted online.
### Answer
```
lets try some binary out!
```

## 3 MJQXGZJTGIQGS4ZAON2XAZLSEBRW63LNN5XCA2LOEBBVIRRHOM======
This is probably base32
```bash
echo <base32text> | base32 -d
```
### Answer
```
base32 is super common in CTF's
```

## 4 RWFjaCBCYXNlNjQgZGlnaXQgcmVwcmVzZW50cyBleGFjdGx5IDYgYml0cyBvZiBkYXRhLg==
This is base64
### Answer
```
Each Base64 digit represents exactly 6 bits of data.
```
## #5 68 65 78 61 64 65 63 69 6d 61 6c 20 6f 72 20 62 61 73 65 31 36 3f
HEX.
```bash
echo <hex> | xxd -r -p
```
### Answer
```
hexadecimal or base16?
```

## #6 Ebgngr zr 13 cynprf!
https://www.dcode.fr/rot-13-cipher
### Answer
```bash
Rotate me 13 places!
```

## #7 *@F DA:? >6 C:89E C@F?5 323J C:89E C@F?5 Wcf E:>6DX 
ROT47, decrypted on the same site as ROT13 (question above)
### Answer
```
You spin me right round baby right round (47 times)
```

## #8 - . .-.. . -.-. --- -- -- ..- -. .. -.-. .- - .. --- -.

. -. -.-. --- -.. .. -. --.

It seems like morse code.
### Answer
```
TELECOMMUNICATIONENCODING
```

## #9 85 110 112 97 99 107 32 116 104 105 115 32 66 67 68
Numbers seems like codes for chars in ASCII, so I wrote little script.
### Answer
```
Unpack this BCD
```

## #10 *long base64 string*
Base64 > Morse Code > Binary > Unicode Code Points > Text
### Answer
```
Let's make this a bit trickier...                                                                                                                                 
```
