# Centos 8 sshd docker image
Dockerfile pulls the default Centos 8 Docker container and applies a fresh SSHD daemon installation.

### Building the Centos 8 sshd image
```
docker build -t centos8_ssh:latest -t
```
### Start the container
```
docker run -d --name centos8_ssh centos8_ssh
```
### Find IP-address of container:
It is easier to allocate a static ip-adress. 
```
docker inspect centos8_ssh | grep IPAddress
```

### Description of files
.ssh directory contains:
- ./ssh/docker_ssh is the private SSH file. 
- ./ssh/docker_ssh.pub is the public SSH file.

../ssh_server directory contains:
- ./sshd_server/sshd_config ssh daemon config file
- ./sshd_server/ssh_host_ecdsa_key  ssh daemon key
- ./sshd_server/ssh_host_ed25519_key ssh daemon key  
- ./sshd_server/ssh_host_rsa_key ssh daemon key

./start.sh file
Init script that starts the ssh server daemon.

### Openssh server keys
Keys should be generated and mounted for production use!
```
/usr/bin/ssh-keygen -q -t ecdsa -f <location>/ssh_host_ecdsa_key -C '' -N ''
/usr/bin/ssh-keygen -q -t rsa -f <location>/ssh_host_rsa_key -C '' -N ''
/usr/bin/ssh-keygen -q -t ed25519 -f <location>/ssh_host_ed25519_key -C '' -N ''

```
Example mount binds (on host to container and not volume)
```
volumes:
  ./ssh_server/ssh_host_ecdsa_key:/etc/ssh/ssh_host_ecdsa_key:ro
  ./ssh_server/ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key:ro
  ./ssh_server/ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key:ro
  ./ssh_server/sshd_config:/etc/ssh/sshd_config:ro
  ./ssh/authorized_keys:/root/.ssh/authorized_keys:ro
```
