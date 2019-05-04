# If you want to use a docker container with the stack installed 


# If you are workin in AWS add the following to the 'User Data' EC2 start up scripts.

## Amazon Linux 2 AMI
```bash 
yum update -y
yum install -y git
git clone https://github.com/tharvell/docker-python-developer.git
chmod u+x docker-python-developer/linux/amazon_linux_2.sh
docker-python-developer/linux/amazon_linux_2.sh
```
