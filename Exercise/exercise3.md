>Create 3 groups – admin, support & engineering and add the admin group to sudoers. 
Create a user in each of the groups. 
Generate SSH keys for the user in the admin group

# Instruction:
Submit the contents of /etc/passwd, /etc/group, /etc/sudoers


### Steps taken to complete the exercise
1. Created the groups (admin, support and engineering)
2. Created users and password (user1, user2, user3)
3. Added the user1 to admin, user2 to support and user3 to engineering

## Step 1
To create a group. The **groupadd** command is used
```
groupadd admin
groupadd support
groupadd engineering
```
<img src="exercise3 images\groupadd.PNG" alt="com command" style="height: 50px; width:400px;"/>

<img src="exercise3 images\groupadd1.PNG" alt="com command" style="height: 200px; width:400px;"/>

## Step2
To create a user
```
useradd user1
passwd user1
useradd user2
passwd user2
useradd user3
passwd user3
```

<img src="exercise3 images\useradd.PNG" alt="com command" style="height: 600px; width:600px;"/>

## Step 3
*Adding user to group*
```
usermod -G admin user1
usermod -G support user2
usermod -G engineering user3
```
<img src="exercise3 images\usermod.PNG" alt="com command" style="height: 200px; width:400px;"/>

Use cat to view the groups and user
cat /etc/group
