FROM douggapp/fulcro:20250917
LABEL maintainer="Dougg TI"

# INSTALLATIONS
#RUN apt-get install -y && \
#    apt-get install apt-transport-https dirmngr gpg -y

# APACHE2
#RUN a2enmod rewrite && \
#    a2ensite 000-default.conf && \
#    service apache2 force-reload

# DIR
#RUN chown -R www-data:www-data /var/www/html && \
#    find /var/www/html -type d -exec chmod 755 {} \; && \
#    find /var/www/html -type f -exec chmod 644 {} \;

# WORKDIR
WORKDIR /var/www/html

# EXPOSE
EXPOSE 80 443

CMD apache2-foreground