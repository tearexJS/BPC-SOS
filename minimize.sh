#!/usr/bin/bash
cat << EOT > /etc/yum.repos.d/fedora.repo
[fedora]
name=Fedora 34 - x86_64
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-34&arch=x86_64
enabled=1
gpgcheck=0
type=rpm
EOT
dnf -y install xorg-x11-server-Xorg twm arora xinit mupdf
echo "xterm & exec twm" > ~/.xinitrc

dnf -y remove git

rm -rf /usr/share/locale
rm -rf /usr/man/
rm -rf /usr/doc/
rm -rf /usr/info/

rm -rf /usr/share/qt4/
rm -rf /usr/share/zoneinfo/
rm -rf /usr/share/cracklib/
rm -rf /usr/share/doc/
rm -rf /usr/share/licenses/
rm -rf /usr/share/iso-codes/
rm -rf /usr/share/hwdata/
rm -rf /usr/lib/firewalld/
rm -rf /usr/lib64/python-3.9/
rm -rf /usr/lib64/liblvm2cmd.so.2.03

rm -rf /usr/lib/firmware/
rm -rf /var/cache/
find /var/log/ -type f -not -name "Xorg.0.log" -delete
mkdir /var/log

FILE1=$HOME/all_modules.txt
FILE2=$HOME/current_modules.txt
find /lib/modules/"$(uname -r)" -type f -name '*.ko*' > "$FILE1"
lsmod | cut -f1 -d " " | tail -n +2 | xargs -I {} modinfo {} -n > "$FILE2"
sort "$FILE1" | uniq > file1.sorted
sort "$FILE2" | uniq > file2.sorted
comm -23 file1.sorted file2.sorted | xargs -I {} rm -fv {}

rm -rf /bin/ssh
rm -rf /bin/ssh-add
rm -rf /bin/ssh-agent
rm -rf /bin/ssh-keygen
rm -rf /bin/ssh-keyscan
rm -rf /bin/sss_ssh_authorizedkeys
rm -rf /bin/sss_ssh_knownhostsproxy
rm -rf /bin/cat
rm -rf /bin/chcon
rm -rf /bin/chrt
rm -rf /bin/chgrp
rm -rf /bin/chmem
rm -rf /bin/chmod
rm -rf /bin/choom
rm -rf /bin/chown
rm -rf /bin/chronyc
rm -rf /bin/comm
rm -rf /bin/cpio
rm -rf /bin/crontab
rm -rf /bin/cpupower
rm -rf /bin/curl
rm -rf /bin/dirmngr
rm -rf /bin/ejects
rm -rf /bin/find
rm -rf /bin/false
rm -rf /bin/kill
rm -rf /bin/killall
rm -rf /bin/less
rm -rf /bin/mkdir
rm -rf /bin/mkinfo
rm -rf /bin/mkfontscale
rm -rf /bin/msggrep
rm -rf /bin/pic
rm -rf /bin/pigz
rm -rf /bin/sftp
rm -rf /bin/sleep
rm -rf /bin/tac
rm -rf /bin/top
rm -rf /bin/truncate
rm -rf /bin/whoami
rm -rf /bin/who
rm -rf /bin/whereis

dnf -y remove acl audit device-mapper-event lshw diffutils e2fsprogs epel-release findutils groff-base hostname iproute iputils irqbalance less libnfnetlink logrotate lsscsi parted passwd prefixdevname procps-ng selinux-policy teamd xfsprogs

rpm -e selinux-policy-targeted --nodeps
rpm -e snappy --nodeps
rpm -e grubby --nodeps
rpm -e python3-libs --nodeps
rpm -e libssh --nodeps
rpm -e curl --nodeps
rpm -e curl-7.76.1-14.el9.x86_64 --nodeps
rpm -e python3-six --nodeps
rpm -e gdbm-libs --nodeps
rpm -e gettext --nodeps
rpm -e sssd-common --nodeps
rpm -e dejavu-sans-fonts --nodeps



