# FROM douggapp/php83:20240926A
FROM ubuntu/apache2
# LABEL maintainer="Dougg TI"
# LINUX
# RUN cat /etc/lsb-release
# PHP
RUN apt update
RUN apt install curl ca-certificates apt-transport-https software-properties-common lsb-release gnupg2 tee -y
RUN apt install libapache2-mod-php php8.3-common php8.3-cli php8.3-mbstring php8.3-bcmath php8.3-fpm php8.3-mysql php8.3-zip php8.3-soap php8.3-gd php8.3-curl php8.3-xml php8.3-intl php-xdebug -y
RUN php -v
# APACHE2
RUN service apache2 restart
#Configurações do Xdebug
RUN echo 'zend_extension=/usr/lib/php/20230831/xdebug.so' > /etc/php/8.3/cli/conf.d/20-xdebug.ini && \
	echo 'xdebug.remote_enable=1' >> /etc/php/8.3/cli/conf.d/20-xdebug.ini && \
	echo 'xdebug.remote_autostart=1' >> /etc/php/8.3/cli/conf.d/20-xdebug.ini && \
	echo 'xdebug.remote_connect_back=1' >> /etc/php/8.3/cli/conf.d/20-xdebug.ini && \
	echo 'xdebug.remote_port=9000' >> /etc/php/8.3/cli/conf.d/20-xdebug.ini && \
	echo 'xdebug.remote_log=/usr/local/etc/xdebug.log' >> /etc/php/8.3/cli/conf.d/20-xdebug.ini 
# WORKDIR
WORKDIR /var/www/html/
# EXPOSE
EXPOSE 80
