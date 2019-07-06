# If you want to use a docker container with the stack installed 

## Get image and start the container 
```bash
docker run -it -v $(pwd):/home/developer/project --name container_name harvellt/docker-python-developer /bin/bash
```

## Restart the container 
```bash
docker restart container_name
```

## Attach to restarted container
```bash
docker attach container_name
```
 
# AWS: Skip the container and use directly on EC2
You will need to use the appropriate shell script for the linux distribution you are useing. 

## Amazon Linux 2 AMI
```bash 
#!/bin/bash
yum update -y
yum install -y git
git clone https://github.com/tharvell/docker-python-developer.git
chmod u+x docker-python-developer/linux/amazon_linux_2.sh
docker-python-developer/linux/amazon_linux_2.sh
```

## Ubuntu 18
```bash
#!/bin/bash
apt-get update -y
apt-get install -y git
git clone https://github.com/tharvell/docker-python-developer.git
chmod u+x docker-python-developer/linux/ubuntu18.sh
docker-python-developer/linux/ubuntu18.sh
```
