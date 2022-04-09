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
dnf -y remove acl audit device-mapper-event lshw diffutils e2fsprogs epel-release findutils groff-base hostname iproute iputils irqbalance less libnfnetlink logrotate lsscsi parted passwd prefixdevname procps-ng selinux-policy teamd xfsprogs
dnf -y remove git
rpm -e selinux-policy-targeted --nodeps
rpm -e snappy --nodeps
rpm -e grubby --nodeps
rpm -e python3-libs --nodeps