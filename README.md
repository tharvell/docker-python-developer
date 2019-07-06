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



## 
# If you are workin in AWS add the following to the 'User Data' EC2 start up scripts.

## Amazon Linux 2 AMI
```bash 
#!/bin/bash
yum update -y
yum install -y git
git clone https://github.com/tharvell/docker-python-developer.git
chmod u+x docker-python-developer/linux/amazon_linux_2.sh
docker-python-developer/linux/amazon_linux_2.sh
```
