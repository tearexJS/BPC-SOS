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
rm -rf /var/log/

