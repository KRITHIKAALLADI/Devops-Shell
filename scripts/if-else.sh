#/bin/bash/

apt --help &> /dev/null
if [ $? -eq 0 ]
then
	sudo apt update
	sudo apt install apche2 wget unzip -y
	sudo systemctl status apache2
	sudo systemctl start httpd
	wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip
        unzip 2133_moso_interior.zip
	sudo cp -r 2133_moso_interior/* /var/www/html/
	ls /var/www/html/
	sudo systemctl restart apache2
else
	sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
        sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
        sudo yum update
	sudo yum install httpd wget unzip -y
	sudo systemctl status httpd
	sudo systemctl start httpd
	wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip
        unzip 2133_moso-interior/* /var/www/html/
        sudo cp -r 2133_moso_interior/* /var/www/html/
        sudo systemctl restart httpd
fi	
