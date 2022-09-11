>Exercise

>> Task:

>>>>>> Install php7.4 on your local linux machine using the ppa:ondrej/php package repo.
Instruction:

Learn how to use the add-apt-repository command
Submit the content of /etc/apt/sources.list and the output of php -v command.


# Step1

**Install the Ondrej Repository on your linux**
```
sudo add-apt-repository ppa:ondrej/php
```

<img src="exercise4 images\repo.PNG" alt="com command" style="height: 800px; width:1040px;"/>

**Update the repository**

```
sudo apt update
```

<img src="exercise4 images\update.PNG" alt="com command" style="height: 800px; width:1000px;"/>

**Install the Php7.4**

```
sudo apt install php7.4
```
