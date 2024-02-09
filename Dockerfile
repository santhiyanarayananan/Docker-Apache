#OS
FROM ubuntu:latest

#apache installing
RUN apt-get update && \
    apt-get install -y apache2
    
#this is to copy index file
COPY index.html /var/www/html/index.html

#ports to be exposed 80
EXPOSE 80

#this is to start apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

#restart apache
RUN service apache2 restart
