#!/usr/bin/env bash
set -eou pipefail

# Install docker and start daemon as root
# sudo apt-get update
# sudo apt-get install -y \
#   apt-transport-https \
#   ca-certificates \
#   curl \
#   gnupg-agent \
#   software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
# sudo apt-get update
# sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install docker and start docker daemon as nonroot
# https://docs.docker.com/engine/security/rootless/
sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common \
  uidmap \
  qemu-user-static

id -u
whoami
grep ^$(whoami): /etc/subuid
grep ^$(whoami): /etc/subgid

curl -fsSL https://get.docker.com/rootless | sh

export PATH=/home/michaelfornaro/bin:$PATH
export DOCKER_HOST=unix:///run/user/1001/docker.sock

systemctl --user enable docker
sudo loginctl enable-linger $(whoami)
