#/////////////////////////////////////////////////////////////
# Made For CentOS - Ecstasy.
# API Dependencies | Usage: bash AutoAPI.sh / sh AutoAPI.sh
#/////////////////////////////////////////////////////////////
 
echo API Dependencies Setup
 
yum update -y
 
echo -e "Updates Installed."
clear
sleep 1s
echo -e ""
 
echo -e "Installing Dependencies"
 
yum install -y cpanel cmake screen dstat gcc php-devel php-pear libssh2 libssh2-devel epel-release perl-Net-RawIP libpcap libpcap-devel httpd mod_ssl php php-mysql php-devel php-gd php-pecl$
 
echo -e "Dependencies Done."
clear
sleep 1s
sudo /usr/sbin/apachectl start
 
sudo nano /etc/httpd/conf/httpd.conf
 
echo -e "Stopping IPTABLES"
clear
sleep 1s
service iptables stop
 
service ip6tables stop
 
chkconfig httpd on
 
chkconfig iptables off
 
chkconfig ip6tables off
 
echo - "IPTABLES stopped"
clear
sleep 1s
echo -e "installing SSH2"
 
pecl install -f ssh2
 
touch /etc/php.d/ssh2.ini
 
echo extension=ssh2.so > /etc/php.d/ssh2.ini
 
/etc/init.d/httpd restart
 
php -m | grep ssh2
 
echo -e ""
clear
sleep 1s
echo -e "Server ready to be used as an API!"
