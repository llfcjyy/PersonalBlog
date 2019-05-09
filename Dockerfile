FROM debian:9

MAINTAINER wenlang "llfcjyy@gmail.com"

RUN  /bin/bash -c 'echo -e "\
deb http://mirrors.163.com/debian/ stretch main non-free contrib\n\
deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib\n\
deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib\n\
deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" > /etc/apt/sources.list;\
apt update;\
apt upgrade -y;\
apt install -y sqlite3 php php-fpm php-xml php-sqlite3 nginx wget unzip;\
rm /var/lib/apt/lists -r'

RUN /bin/bash -c '\
sed -i "s/;extension=php_pdo_sqlite/extension=php_pdo_sqlite/g" /etc/php/7.0/fpm/php.ini;\
sed -i "s/index.html i/index.php index.html i/g" /etc/nginx/sites-available/default;\
sed -i "56,63s/#//" /etc/nginx/sites-available/default;\
sed -i "62s/^/#&/" /etc/nginx/sites-available/default;\
sed -i "s#location ~ \\\.php#location ~ \.*\\\.php(\\\/\.*)*#" /etc/nginx/sites-available/default'

RUN /bin/bash -c '\echo -e "#!/bin/bash\n\
cd /var/www/\n\
wget https://codeload.github.com/llfcjyy/PersonalBlog/zip/master -O blog.zip\n\
unzip blog.zip && rm blog.zip html -r && mv * html\n\
service php7.0-fpm start\n\
service nginx start\n\
tail -f /dev/null" > start-blog.sh;\
chmod +x start-blog.sh'

EXPOSE 80

ENTRYPOINT ["/start-blog.sh"]

