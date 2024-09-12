#!/usr/bin/env bash

sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf install -y epel-release dnf-plugins-core
sudo dnf copr enable atim/lazygit -y
sudo dnf config-manager --set-enabled PowerTools
sudo dnf config-manager --add-repo 'https://rpm.releases.hashicorp.com/$release/hashicorp.repo'
sudo dnf config-manager --add-repo 'https://cli.github.com/packages/rpm/gh-cli.repo'
sudo yum install -y yum-utils epel-release

RELEASE_VERSION=$(grep -Po '(?<=VERSION_ID=")[0-9]' /etc/os-release)
cat <<EOF | sudo tee -a /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$RELEASE_VERSION/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://aquasecurity.github.io/trivy-repo/rpm/public.key
EOF

cat <<EOF | sudo tee -a /etc/yum.repos.d/charm.repo
[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key'
EOF

sudo yum -y update
