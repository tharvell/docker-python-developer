# Please see my docker hub repository for an image 


# If you are workin in AWS add the following to the 'User Data' EC2 start up scripts.

## Amazon Linux 2 AMI
```bash 
yum update 
yum install -y 
git clone https://github.com/tharvell/docker-python-developer.git
. ./docker-python-developer/unix/amazon_linux_2.sh
```
