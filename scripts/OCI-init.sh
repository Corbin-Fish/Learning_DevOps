#!usr/bin/env bash

#Update Image - Check Python
#Verify SSH Config

dnf check-update

if ! command -v python3 &> /dev/null; then
    dnf install -y python3
fi

#####

systemctl enable --now sshd
firewall-cmd -permanent --add-service=ssh
firewall-cmd --reload
