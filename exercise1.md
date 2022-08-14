# Week 1 - Exercise 1

> Task: Setup Ubuntu 20.04 LTS on your local machine using Vagrant.
Instruction: 
Customize your Vagrantfile as necessary with private_network set to dhcp.
Once the machine is up, run ifconfig and share the output in your submission along with your Vagrantfile in a folder for this exercise.

### The Altschool Exercise

This is the first exercise in the cloud engineering track. I divided the exercise into four parts
1.  Setting Up
2.  Executing the OS
3.  Configuring the Vagrantfile
4.  Push to Github.

For the setup. The following steps were taking
1. [Setup git](#Setup-git)
2. [Setup Virtualbox](#Setup-Virtualbox)
3. [Setup vagrant](#Setup-vagrant)

For the Execution. I took the following steps
1. [Install OS](#Install)
2. [Run OS](#Run-OS)
3. [Login to the OS](#Login-to-the-OS)

For configuration. i took the following steps
1. [Edit the Vagrant file](Edit-the-vagrant-file)
2. [Run ifconfig](Run-ifconfig)

Pushing to github

This includes creating a repository, cloning, branching, commiting and pushing the project to github.


# Setting Up

### Setup git
All GitHub projects are backed by a version control software called *Git*. You'll need to [set up Git](https://docs.github.com/en/get-started/quickstart/set-up-git) in order to run the bash scripts and run vagrant.

### Setup-Virtualbox
Download virtual box and set it up.VirtualBox (https://www.computerhope.com/jargon/v/virtualbox.htm) is open-source software for virtualizing the x86 computing architecture. It acts as a hypervisor, creating a VM (virtual machine) where the user can run another OS (operating system).

### Setup-Vagrant
Download vagrant and install vagrant. Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past.


# Executing
### Install OS
Navigated to the site [Vagrant](https://www.vagrantup.com/)
Look for the OS Ubuntu/focal64. Get the name.
Open git bash on your computer. See how to set up git if you dont have one.

**Create a folder for the OS you will be installing**

_This is optional. However, it will let you know where your vagrantfile is_
```
mkdir vagrant
```

**Initialize vagrant**

_This will attempt to look for an image of the OS on your computer. if none is found, it will then look in the vagrant repository online and download it from there. This will include the vagrant file for the set up et al. At this point the OS will be visible in virtual box._
```
vagrant init
```

**Run vagrant up**

_This will spin up the OS. check your virtualbox and you will ree running._
```
vagrant up.
```

**Log in to the OS**

_This will ssh into the os._

```
vagrant ssh
```


# Editing the Vagrant file.

To configure the vagrant file.
Exit the OS
Navigate to where the vagrantfile is

**View the vagrant file.**
```
cat vagrantfile
```

**Edit the file using vim.** 

```
vim vagrantfile
```

The vim editor will open with the content of the file. To start editing the file.
***``type i``***
You can now edit.
Look for the **config.vm.network "private_network", ip: "192.168.33.10"** and uncomment and edit the ip to

``` 
config.vm.network "private_network", ip: "dhcp"
``` 

Enter the **esc** key to exit the editor and enter the **:wq** to go back to git terminal.

## Run IfConfig
**ssh into the vm using vagrant ssh**
```
vagrant up
```
**Run the ifconfig**

```
ifconfig
```
The rendered output is
```
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::52:20ff:fe6d:cccd  prefixlen 64  scopeid 0x20<link>
        ether 02:52:20:6d:cc:cd  txqueuelen 1000  (Ethernet)
        RX packets 1245  bytes 360512 (360.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 994  bytes 143989 (143.9 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 30  bytes 2892 (2.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 30  bytes 2892 (2.8 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

# Pushing to Git
### Save your changes locally

First, get a list of all the files you have changed.
```
$ git status
```

Next, *stage* the file you want to save. This will add the file to a new list that is ready to be saved.

```
$ git add src/exercise1.md
```

Next, verify that the file has been staged correctly. Notice that the text color has changed, and your file is now in a list that says "Changes to be committed" instead of "Changes not staged for commit"

```
$ git status
```

Finally, commit your staged files.
```
$ git commit -m "exercise1"
```

### Send your changes to the master and merge to main

With one simple `git` command, you can send the changes you just committed locally to your *branch* on GitHub.

```
$ git push origin master
```


