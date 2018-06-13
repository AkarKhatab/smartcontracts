#!/usr/bin/env bash

# Repair "stdin: is not a tty" message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

# Repair "dpkg-preconfigure: unable to re-open stdin"
# Use "> /dev/null 2>&1" in order to redirect stdout to /dev/null
# for more info see https://stackoverflow.com/questions/10508843/what-is-dev-null-21

echo 'Provisioning virtual machine'

# Fetches the list of available updates
sudo apt-get update > /dev/null 2>&1
# Strictly upgrades the current packages
sudo apt-get upgrade > /dev/null 2>&1
 # Installs updates (new ones)
sudo apt-get dist-upgrade > /dev/null 2>&1

echo 'Installing git'
sudo apt-get -y install git > /dev/null 2>&1

echo 'Installing python, pip and necessary library for compiling serpent'
sudo apt-get -y install python-pip
sudo pip install --upgrade pip setuptools
sudo apt-get -y install libssl-dev build-essential automake pkg-config libtool libffi-dev libgmp-dev libyaml-cpp-dev
sudo apt-get -y install python-dev


echo 'Copy and install Pyethereum repo'
mkdir -p /home/vagrant/thesis/
rm -rf /home/vagrant/thesis/pyethereum
git clone https://github.com/ethereum/pyethereum /home/vagrant/thesis/pyethereum
cd /home/vagrant/thesis/pyethereum/
sudo python setup.py install

echo 'Copy and install Serpent'
rm -rf /home/vagrant/thesis/serpent
git clone https://github.com/ethereum/serpent /home/vagrant/thesis/serpent
cd /home/vagrant/thesis/serpent
sudo python setup.py install
