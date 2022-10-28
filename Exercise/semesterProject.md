> Mini Project (Exercise 11)
``` 
* We will be deploying a real life application:

* Demo Project: https://https://github.com/omogidi/laravel-realworld-example-app.git

* Setup Debain 11 on a virtual machine instance with a cloud provider or as instructed

* Setup Apache2 with every dependency the application needs to run

* Don't use Laravel Sail or Docker as suggested in the project README.md file, simply clone the project with Git and deploy with apache2

* Setup MySQL with credentials and a database for your application to use

* Configure a subdomain if you have a domain name to point to the Vm instance or speak to an instructor for futher guide

* You have complete the project if you are able to view the application according to the specifications in the project from your Host browser 
```

---
# SOLUTIONS

## Created an AWS instance and connected to it using my git bash
* Go to aws,amazon.com to create a debian 11 instance. Configure the security group to allow port 22 and 0 - 65535.
* After creating. Open up git bash where you have your pem file downloaded and connect using the following.

<img src="semesterProject images\1connecting to aws.JPG" alt="com command" style="height: 400px; width:800px;"/>

<img src="semesterProject images\2awsinstance.JPG" alt="com command" style="height: 50px; width:1000px;"/>

<img src="semesterProject images\3securitygroup.JPG" alt="com command" style="height: 100px; width:1000px;"/>

---

## Update and upgrade the debian package

```
$ sudo apt update && upgrade -y
```
<img src="semesterProject images\4updatedebian.JPG" alt="com command" style="height: 400px; width:800px;"/>

---

## Time to install git
* This will enable you clone the laravel project into the debian server. The command will download and install git on the server.

``` 
$ sudo apt install git -y 
```
<img src="semesterProject images\5installgit.JPG" alt="com command" style="height: 300px; width:1000px;"/>

* You can check the version with

``` $ git --version ```

---

## Install Apache
* Apache is one of the dependencies needeed to run Laravel. The command will install the service and start the service.
```
$ sudo apt install apache
```
<img src="semesterProject images\6installapache.JPG" alt="com command" style="height: 500px; width:1400px;"/>

* You can confirm the version and start the apache service with the commands below

```
sudo apache2 -v

$ sudo systemctl enable apache2

$ sudo systemctl start apache2 
```
<img src="semesterProject images\7enableapache.JPG" alt="com command" style="height: 50px; width:1000px;"/>

---


## Clone the laravel project
* Changed directory to ```cd /var/www/html```
<img src="semesterProject images\8cdvar.JPG" alt="com command" style="height: 80px; width:1000px;"/>

* Clone the working directory from github.

```
$ sudo git clone https://github.com/omogidi/laravel-realworld-example-app.git
```
<img src="semesterProject images\9gitclone.JPG" alt="com command" style="height: 300px; width:9000px;"/>

* To confirm it is now cloned. Change directory to the laravel project

```cd /var/www/html/laravel-realworld-example-app```

<img src="semesterProject images\10cdlaravel.JPG" alt="com command" style="height: 80px; width:1000px;"/>

---

## Adding the PHP repo and installing PHP
* To install PHP 8.1 on debian. We will add the SURY repository manually. This is because. they are not available in the base repository. See the command to add below.
```
$ echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main"\
      | sudo tee /etc/apt/sources.list.d/sury-php.list
```
<img src="semesterProject images\11addphprepo.JPG" alt="com command" style="height: 80px; width:1000px;"/>

---

## Install GNUPG
* GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories. GnuPG, also known as GPG, is a command line tool with features for easy integration with other applications. A wealth of frontend applications and libraries are available. GnuPG also provides support for S/MIME and Secure Shell (ssh).
```
$ sudo apt install gnupg gnupg2
```
<img src="semesterProject images\12installgnupg2.JPG" alt="com command" style="height: 300px; width:1000px;"/>

* Import GPG Key on Debian
The system needs to verify the packages we receive to install PHP 8.0 from the Sury repository, to confirm they have not been altered by anyone.

```
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
```
<img src="semesterProject images\13wget.JPG" alt="com command" style="height: 100px; width:900px;"/>

* Update the package again

```
sudo apt update $$ sudo apt upgrade -y
```
<img src="semesterProject images\14aptupdate.JPG" alt="com command" style="height: 300px; width:1000px;"/>


---


## Install PHP
As per web apllication requirements. It is time to install PHP.
```
sudo apt-get install php8.1 libapache2-mod-php php8.1-dev php8.1-zip php8.1-curl php8.1-mbstring php8.1-mysql php8.1-gd php8.1-xml
```

<img src="semesterProject images\15installphp.JPG" alt="com command" style="height: 700px; width:1000px;"/>

* Tools installed

````
php8.1-cli - command interpreter, useful for testing PHP scripts from a shell or performing general shell scripting tasks

php8.1-common - documentation, examples, and common modules for PHP

php8.1-mysql - for working with MySQL databases

php8.1-zip - for working with compressed files

php8.1-gd - for working with images

php8.1-mbstring - used to manage non-ASCII strings

php8.1-curl - lets you make HTTP requests in PHP

php8.1-xml - for working with XML data

php8.1-bcmath - used when working with precision floats
````


You can check the PHP Version
```
php -v
```
<img src="semesterProject images\16phpversion.JPG" alt="com command" style="height: 80px; width:1000px;"/>

---

## Download my SQL repo package and Install MySQL
Configuration of MySQL repsotiory on Debian and on its Offical Community Download Page and there you will get the latest Apt repsotiory in the deb binary form to download. You can also use the given commands instead
```
sudo apt install wget -y

wget https://dev.mysql.com/get/mysql-apt-config_0.8.20-1_all.deb

sudo apt install ./mysql-apt-config_*_all.deb

sudo apt update && upgrade -y
```
<img src="semesterProject images\17installwget.JPG" alt="com command" style="height: 300px; width:800px;"/>

<img src="semesterProject images\18addmysqlrepo.JPG" alt="com command" style="height: 300px; width:1000px;"/>

<img src="semesterProject images\19installsql.JPG" alt="com command" style="height: 300px; width:1000px;"/>


* An error occurs... Confirm your PUBLIC_KEY from your ERROR MESSEGAE ...and run the following commands

<img src="semesterProject images\20errorpublickey.JPG" alt="com command" style="height: 300px; width:1000px;"/>

```
$ sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 467B942D3A79BD29

$ sudo apt update && sudo apt upgrade -y
```
<img src="semesterProject images\21publickeyerrsolved.JPG" alt="com command" style="height: 100px; width:1000px;"/>


---

## Installation of MySQL-Server
* During the installation process, it will prompt us to SET A PASSWORD FOR THE ROOT USER, make sure to enter a strong password and Hit the ENTER KEY

* Next it the again prompt us to re-enter our password, after this has been done, Hit the ENTER KEY again to exit
```
sudo apt install mysql-server

mysql --version

$ sudo systemctl enable --now mysql

$ sudo systemctl status mysql

sudo mysql_secure_installation
```
<img src="semesterProject images\22installmysql.JPG" alt="com command" style="height: 300px; width:1000px;"/>


<img src="semesterProject images\23mysqlversion.JPG" alt="com command" style="height: 50px; width:1000px;"/>

<img src="semesterProject images\24startmysql.JPG" alt="com command" style="height: 300px; width:1000px;"/>

* Input the password you setup during the Installation of MySQL

* Depending on your version it might prompt to install the VALIDATE PASSWORD plugin. This is not necessary since we will have control over making new users and we will make sure the passwords are secure enough, so we will skip over this setting. (Type ‘N’).

* Next, it will prompt if we want to change the existing password for the root user. If you had set a secure password in the last step then you can also skip this question by pressing any key (other than ‘Y’). If you left the password blank or set up a random password (like ‘password’ or ‘1234’) then go ahead and change your password now. You can generate a password here if you used a password that is not strong.

* It will then prompt to remove an anonymous user. Type Y to remove the anonymous users

<img src="semesterProject images\25mysqlsettings.JPG" alt="com command" style="height: 500px; width:1000px;"/>

---


# Configure Apache2
* We will create an Apache virtual host configuration file to host our Laravel application.
```
sudo nano /etc/apache2/sites-available/laravel.conf
```

````
<VirtualHost *:80>

    ServerAdmin ijustwanttobechairman.me

    ServerName ijustwanttobechairman.me

    DocumentRoot /var/www/html/laravel-realworld-example-app/public

    <Directory /var/www/html/laravel-realworld-example-app>

    Options Indexes MultiViews

    AllowOverride None

    Require all granted

    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log

    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
````
<img src="semesterProject images\26laravelconffile.JPG" alt="com command" style="height: 300px; width:800px;"/>


* We can now save and close the file and then enable the Apache rewrite module and activate the Laravel virtual host

```
$ sudo a2enmod rewrite

$ sudo a2ensite laravel.conf
```
<img src="semesterProject images\27apacherewritemodule.JPG" alt="com command" style="height: 100px; width:800px;"/>

<img src="semesterProject images\28enablesite.JPG" alt="com command" style="height: 200px; width:800px;"/>

---


# Configuring php
In the terminal, open the ``php.ini`` file with nano
```
$ sudo nano /etc/php/8.1/apache2/php.ini
```

* The line we need to edit is cgi.fix_pathinfo=0 so you can either search for it manually, or you can search for it using Ctrl+W

* Press Ctrl+W and now type in cgi.fix_pathinfo and click enter. This will take you to the right line. You will see a semicolon on the left of this line. Delete the semicolon and then change the value from 1 to a 0 and save the file.

<img src="semesterProject images\29configphpfile.JPG" alt="com command" style="height: 300px; width:1000px;"/>

* Restart the Apache service to apply changes
```
$ sudo systemctl restart apache2
```

---

# Setting Up Composer for Dependency Management
* Composer is a PHP dependency manager that manages the dependencies and libraries that PHP applications require. We will need it to install the Laravel dependencies and packages.

* Run the following commands to install Composer

* To install Composer, download the installer first with the following curl command
```
$ curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
```

* To facilitate the verification step, you can use the following command to programmatically obtain the latest hash from the Composer page and store it in a shell variable
```
$ HASH=`curl -sS https://composer.github.io/installer.sig`
```
* To verify the obtained value, you can run
```
$ echo $HASH
```

* Now execute the following PHP code, as provided in the Composer download page, to verify that the installation script is safe to run

```
$ php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
```

* If the output says Installer corrupt, you’ll need to download the installation script again and double check that you’re using the correct hash. Then, repeat the verification process. When you have a verified installer, you can continue.

* To install composer globally, use the following command which will download and install Composer as a system-wide command named composer, under /usr/local/bin

```
$ sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

* To test your installation, with the given command

```
$ composer
```

<img src="semesterProject images\30composer.JPG" alt="com command" style="height: 500px; width:1000px;"/>


## Run Composer
* We can use composer to install the laravel dependencies

* We use the –no-dev flag to install only the dependencies that are required in production

```
$ sudo composer install --no-dev
```

<img src="semesterProject images\31runcomposer.JPG" alt="com command" style="height: 500px; width:1000px;"/>

---

## Laravel Permissions

* In order to run, Apache needs certain permissions over the Laravel directory we made. We must first give our web group control of the Laravel-realworld-example-app directory

```
$ sudo chown -R :www-data /var/www/html/laravel-realworld-example-app

$ sudo chmod -R 775 /var/www/html/laravel-realworld-example-app

$ sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/storage

$ sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/bootstrap/cache
```
<img src="semesterProject images\32laravelpermissions.JPG" alt="com command" style="height: 300px; width:1000px;"/>

## Configring .env file
* We can finish the Laravel installation by running the following commands

```
$ sudo cp .env.example .env

$ sudo php artisan key:generate
```
<img src="semesterProject images\33applicationkeyset.JPG" alt="com command" style="height: 50px; width:1000px;"/>


# Database Setup
* Create a database to store our application data in it. We can set up the database that our application will be using in production.

Let’s start by executing the following command into MySQL

```
$ mysql -u root -p
```

* Write the following command

```
CREATE DATABASE laraveldatabase;
```
<img src="semesterProject images\34createdatabase.JPG" alt="com command" style="height: 300px; width:1000px;"/>


## Configuring Laravel
* Add the database credentials to the .env file generated earlier. This file contains all the application variables that need to be kept secret

*** NOTE::: APP_KEY=base64 should be left untouched ***

```
$ sudo nano .env
```
<img src="semesterProject images\35envfile.JPG" alt="com command" style="height: 500px; width:1000px;"/>

* Set the APP_ENV Key to production since our application is in production and also turn the APP_DEBUG key to false. This ensures that no debug and stack trace messages are displayed to the general public

* Set the APP_ENV Key to production since our application is in production and also turn the APP_DEBUG key to false. This ensures that no debug and stack trace messages are displayed to the general public

* Uncomment the web.php context in other to migrate our data

```
$ sudo nano routes/web.php
```
<img src="semesterProject images\36uncommentwebphp.JPG" alt="com command" style="height: 500px; width:800px;"/>

* Cache the configurations using the command

```
$ sudo php artisan config:cache
```

<img src="semesterProject images\37cacheconfig.JPG" alt="com command" style="height: 100px; width:1000px;"/>

* Disable default Apache2 configuration
```
$ sudo a2dissite 000-default.conf
```

* Delete default Apache2 configuration
```
$ sudo rm /etc/apache2/sites-available/000-default.conf
```
* Enable Laravel Host configuration
```
$ sudo a2ensite laravel.conf
```

* Restart Apache2 server
```
$ sudo systemctl status apache2
```
<img src="semesterProject images\38disabledefault.JPG" alt="com command" style="height: 300px; width:1000px;"/>

* The last thing in the Laravel setup is migrating the database

```
$ sudo php artisan migrate
```

<img src="semesterProject images\39phpmigrate.JPG" alt="com command" style="height: 500px; width:1000px;"/>

# EUREKKKAAAA

<img src="semesterProject images\40final.JPG" alt="com command" style="height: 500px; width:1000px;"/>
