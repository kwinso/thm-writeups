AoC | TryHackMe
===============
undermouse, 06.01.2021

## What I've done
I've just guessed `/api` route, again. So, with gobuster I'd use this:
```bash
gobuster dir -w ./wordlist.txt -u 'http://ip'
```

Then, I've used [this tool](https://github.com/williamleroux/dateGenerator) to generate a dates wordlist:
```bash
python3 date_generator.py 2018 2021 0 > dates.txt
```

And then **fuzzed** the API file.

```bash
wfuzz -c -z file,~/dates.txt -u 'http://ip/api/site-log.php?date=FUZZ' --hh 0 # ignoring zero-char responses
```
