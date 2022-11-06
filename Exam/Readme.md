# Setup your ec2 with your ec2 key and download the key
    
    1. On AWS, navigate to the EC2 service and search for `key pairs`, at the top right, click on `create key-pair`. Give your Key pair a name (e.g. awsKey), the key pair type you should use is `RSA` and the private key format is `.pem` and click `create a key pair`. It will be automatically downloaded as `awsKkey.pem`. Open it in your VSCode, we'll need it in step 6.
    
    2. Created security groups for the ec2 instance. Navigate to the EC2 service and search for `security groups`, at the top right, click on `create security group`. Give your security group a name (e.g. awsSecurityGroup), give it a description and click `create security group`. Edit the inbound rules and add the following: Port 80, 443, 5432, 22
    
    3. Next, I created two instances. Master and Slave. To do this, click launch instances give your instance a name to recognize it as the one that you're deploying your application to. Choose an Amazon Machine Image (AMI or Operating System). There's Debian 11 there or Ubuntu 22.o4 or 20.04 or Amazon Linux, any Linux distro you're comfortable with. Leave the instance type in the free tier, Select the keypair you created in step 1. In the network settings, click edit to select the logical network you added in step 3 above or just go on and use the default security groups (with the proper firewall you need for it to work i.e. HTTP, HTTPS, SSH and the likes). REPEAT THIS SAME PROCESS FOR THE INSTANCE THAT WILL HOST YOUR PROJECT (called a managed node or slave if you prefer).
    
    4. Next, go to `Elastic IPs` and select `Allocate Elastic IP Address`, it will generate an IP address for you, click on it and associate it to you MANAGED NODE (slave), This because if you use the regular IP address, if your server is stopped (not terminated) and started again, without Elastic IP, the IP will change. Also not that once you associate the Elastic IP, and you stop your instance (not terminated), you will incur charges but you won't if it is left on. Also, we're doing this because you will have to go to your AWS Route 53 service, edit your A record and put this new IP there so that the IP will be associated to your domain name.
    
    5. Next spin up your CLIENT NODE (master instance), update and then upgrade its apt packages. Install all the necessary dependencies for ansible (python3, pip, curl etc) and then install ansible. 
    
    6. Next on the same CLIENT NODE go to your .ssh folder or home folder and create the same name you used to create the key pair in step 3 (e. awsKey.pem), create the same file using the `touch` command and the `nano awsKey.pem`, now go to your VSCode and copy the contents and paste it in the same file you opened on your CLIENT NODE and save it.
    
    9. Next, go `sudo nano /etc/ansible/hosts` and set up your HOSTS IP (managed node)
      On AWS, default user for debian instances ==== admin; ubuntu instances ==== ubuntu  
     the user and private key file is for the CLIENT NODE
     Let's assume, I'm using ubuntu, this is what I'll put in the hosts file we nano-ed into just now.
      [managedNode]
      3.95.132.58
      
      [all:vars]
      ansible_user=ubntu
      ansible_ssh_private_key_file=/home/ubuntu/.ssh/awsKey.pem
      
    This step will allow us to be able to connect from the CLIENT NODE (master) to the MANAGED NODE (slave)
    when you're done, go back to the home directory
    Test this by pinging all
    
    10. Go to the home directory of the user `cd ~` and create a folder you want to keep all the files you may need (e.g. your playbook.yml) and also, files you may need to copy from your CLIENT NODE to your MASTER NODE (e.g. bash script to install and set up PostgreSQL).

# for setting up ansible remote connection

# Setup /etc/ansible/hosts with the necessary info e.g
sudo su
cd
mkdir ansible
cd ansible
nano hosts
```

Edit the hosts file and add the following:

```
[slave]
3.227.36.21

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/home/ubuntu/.ssh/awskey.pem

Ping the slave node by running the following command:
ansible all -i hosts -m ping

# Create a playbook.yml and add your tasks to it. I'll be using the following playbook.yml file:

 Go to the home directory of the user `cd ~` and create a folder you want to keep all the files you may need (e.g. your playbook.yml) and also, files you may need to copy from your CLIENT NODE to your MASTER NODE (e.g. bash script to install and set up PostgreSQL).
        

# Create files and folders you may need to copy to your slave node
db-setup.sh
laravel-realworld-example-app
.env.j2

# Run playbook
- ansible-playbook playbook.yml -i hosts