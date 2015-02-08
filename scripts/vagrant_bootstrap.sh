#!/bin/bash
# Disable sudo password for vagrant
sudo echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

sudo useradd -d /home/nemitek -m nemitek
echo 'nemitek:nemitek' | sudo chpasswd
sudo echo 'nemitek ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Grab vagrant public key and create related files
sudo wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -P /tmp
sudo mkdir /home/vagrant/.ssh
sudo cat /tmp/vagrant.pub > /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant.vagrant /home/vagrant/.ssh
sudo chmod 0700 /home/vagrant/.ssh
sudo chmod 0600 /home/vagrant/.ssh/authorized_keys
