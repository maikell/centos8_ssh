#!/bin/bash

# Making all required files if they are not existing. (This means
# you may add a Docker volume on /etc/ssh or /root to insert your
# own files.

# By default the keys in ssh_server are added to the container 
#/usr/bin/ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -C '' -N ''
#/usr/bin/ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
#/usr/bin/ssh-keygen -q -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -C '' -N ''

#sed -i 's/#LogLevel INFO/LogLevel DEBUG/' /etc/ssh/sshd_config

# Now start ssh.
/usr/sbin/sshd -D
