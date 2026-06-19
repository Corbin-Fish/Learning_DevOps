#!usr/bin/env bash

#script to roughly reproduce desired result
#I wont be testing it but its to show the methodology
#learn process automate process
#which means that this script may or may not work
#POC script wont be in use as ill be using ansible but in case of emergency

#install Core utils
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io tar wget curl git
sudo systemctl enable --now docker

#create user account
sudo useradd -m github
read -r -s -p "Enter github's Password: " pword
sudo passwd github $pword
sudo usermod -aG wheel docker github

#prompt user to start the runner setup
echo "navigate to github repository Settings"
echo "navigate to Actions"
echo "navigate to Runners then choose New Self-Hosted runner"

#create directories necessary
mkdir /opt/actions-runner
cd /opt/actions-runner
curl -o actions-runner-linux-x64-2.335.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.335.1/actions-runner-linux-x64-2.335.1.tar.gz
#i should validate the hash here to make sure its good but that requires prompting for it and this is just a hypothetical
tar xzf ./actions-runner-linux-x64-2.335.1.tar.gz

read -r -s "Enter repository URL example: https://github.com/foobar/reponame" url
read -r -s "Enter Token Here: (Found under configure on page you navigated to)" token

./config.sh --url $url --token $token
./run.sh
