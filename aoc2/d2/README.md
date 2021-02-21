AoC Day 2 | TryHackMe
=================
undermouse, 06.01.2021

## What I've done

I bypassed image-only filter by renaming reverse shell .php file into .jpg.php so it contains `.jpg` part.

After I've just fired up `netcat` listener and go to the `/uploads/revshel.jpg.php` (I've just guessed `/uploads` directory :]) and got reverse shell.

## Flag
Flag was in `/var/www/flag.txt` as it's said in description for task
