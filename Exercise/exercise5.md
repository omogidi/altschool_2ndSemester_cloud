> Create a bash script to run at every hour, saving system memory (RAM) usage to a specified file and at midnight it sends the content of the file to a specified email address, then starts over for the new day.

### Instruction:

Submit the content of your script, cronjob and a sample of the email sent, all in the folder for this exercise.

# SOLUTION

This exercise can be splited into three parts. They are 
1. Installing the dependencies
The following dependencies are required. The ssmtp, mailutils and Mutt

**ssmtp:** is a program which deleivers email from a local computer to a configured mailhost. It does not recieive email but it is used to forward automated email (like system alerrs)off your machine to an external email address.

**Mailutils:** Mailutils is a set of libraries and utilities for handling electronic mail. See link for more detail
https://mailutils.org/manual/mailutils.html#:~:text=Mailutils%20offers%20functions%20for%20almost,Sieve%20filtering%2C%20access%20control%20lists.


**Mutt:** is command-line email client for unix operating systems.

2. Scripting
Bash scripting is a convenient way to automate tasks. A bash script is a series of commands written in a file. These are read and executed by the bash program. The program executes line by line.

3. Scheduling
Cron is a job scheduling utility present in Unix like systems. The crond daemon enables cron functionality and runs in background. The cron reads the crontab (cron tables) for running predefined scripts. By using a specific syntax, you can configure a cron job to schedule scripts or other commands to run automatically.


# PROCESS
## Installing Dependencies
* Set the date of the system to Africa/Lagos using `timedatectl` : timedatectl may be used to query and change the system clock and its settings, and enable or disable time synchronization services.

```
timedatectl set-timezone Africa/Lagos
```

* Change to the root user to install the dependencies

```
sudo su
```
* Install the Dependencies
```bash
# SSMTP
apt-get install ssmtp -y

# Mailutils
apt-get install mailutils -y

# Mutt
apt-get install Mutt -y
```

* Everything was  installed correctly. Time to edit the ssmtp.conf file
```
nano /etc/ssmtp/ssmttp.conf
```

* I Edited the contents of my ssmtp.conf file to include the following:
```
Outgoing mail server (SMTP server) or mailhub=smtp.gmail.com:587

root=username@gmail.com

AuthUser=your Gmail address

AuthPass=your Gmail app password
```
* Here is what it looks like after editing
```
root=ubuntu-focal
mailhub=smtp.gmail.com:587

AuthUser=alaoemmanuel2020@gmail.com
Authpass=********
UseSTARTTLS=YES
UseTLS=YES
FromLineOverride=Yes
```
Use Ctrl + o to save

Use Ctrl + x to exit


> [See how to setup App password](https://support.google.com/mail/answer/185833?hl=en)



_**Note that: If you are using the 465 port**_
**Comment out the UseSTARTTLS=YES**

 <img src="exercise5 images\ssmtp config.PNG" alt="com command" style="height: 400px; width:800px;"/>



Run the following command to test. 
```
echo "This is a test!" | mail -s "Test Email" alaoemmanuel2014@gmail.com
```
 <img src="exercise5 images\mail.PNG" alt="com command" style="height: 50px; width:800px;"/>


___


## Bash Scripting
```bash
#!/bin/bash

# Assignment of Variables

# create a variable for path where the directory will be created and used
path=/home/vagrant/memory_logs/log_file.log

#Variable for date formatted from date to string formatting
midnight=$(date +%H%M)

#email address variable
email=alaoemmanuel2020@gmail.com

# Command to create the file
touch ${path}

# Conditionals
if [[ ${midnight} == 0000 ]]; 
   then echo "HERE IS YOUR MIDNIGHT REPORT" | mutt -a ${path} -s "Midnight RAM Report" -- ${email} && sudo rm -f ${path}
else
date >> ${path}
free -h >> ${path}
echo "-------" >> ${path}
fi
```

 <img src="exercise5 images\bash script.PNG" alt="com command" style="height: 400px; width:800px;"/>

 ___


## Scheduling

Edited the crontab
```bash
crontab -e
```

Included the command at the bottom of the file
```
0 * * * * bash /home/vagrant/memory_logs/memory_log.sh
```
 <img src="exercise5 images\crontab.PNG" alt="com command" style="height: 400px; width:800px;"/>

Email sent image

 <img src="exercise5 images\Report.PNG" alt="com command" style="height: 400px; width:800px;"/>


