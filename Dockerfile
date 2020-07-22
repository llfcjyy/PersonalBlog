FROM debian:10

MAINTAINER wenlang "llfcjyy@gmail.com"

RUN  /bin/bash -c 'echo -e "\
deb http://mirrors.163.com/debian/ buster main non-free contrib\n\
deb http://mirrors.163.com/debian/ buster-updates main non-free contrib\n\
deb http://mirrors.163.com/debian/ buster-backports main non-free contrib\n\
deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib" > /etc/apt/sources.list;\
apt update;\
apt upgrade -y;\
apt install -y sqlite3 php php-fpm php-xml php-sqlite3 nginx git;\
rm /var/lib/apt/lists -r'

RUN /bin/bash -c '\
sed -i "s/;extension=pdo_sqlite/extension=pdo_sqlite/g" /etc/php/7.3/fpm/php.ini;\
sed -i "21a\	client_max_body_size 10m;" /etc/nginx/nginx.conf;\
sed -i -e "s/index.html i/index.php index.html i/g" \
-e "56,63s/#//" \
-e "62s/fast/# fast/" \
-e "s#location ~ \\\.php#location ~ \.*\\\.php(\\\/\.*)*#" \
-e "27,28s/# //" \
-e "28a\	ssl_certificate_key /var/www/html/ssl/swwx.key;" \
-e "28a\	ssl_certificate /var/www/html/ssl/swwx.crt;" \
/etc/nginx/sites-available/default'

RUN /bin/bash -c '\
git config --global user.email "llfcjyy@gmail.com";\
git config --global user.name "yi";\
rm /var/www/html/*;'

RUN /bin/bash -c '\echo -e "#!/bin/bash\n\
cd /var/www/html\n\
git pull || git clone https://github.com/swwx/PersonalBlog.git .\n\
chmod 777 usr && chmod 777 usr/typecho.db\n\
service php7.3-fpm start && service nginx start && tail -f /dev/null" > start-blog.sh;\
chmod +x start-blog.sh'

EXPOSE 443

ENTRYPOINT ["/start-blog.sh"]
