#OS
FROM ubuntu:latest

#apache installing
RUN apt-get update && \
    apt-get install -y apache2

#creating directory for virtual hosts
RUN mkdir -p /var/www/html/site1.com 
    
#this is to copy index file
COPY index.html /var/www/html/site1.com/index.html

#this is where u make conf changes ports are mentioned here itself
COPY site1.com.conf /etc/apache2/sites-available/

# copy custom ports configuration
COPY ports.conf /etc/apache2

#Enable the virtual hosts
RUN a2ensite site1.com.conf 

#ports to be exposed 8080
EXPOSE 80

#this is to start apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

#restart apache
RUN service apache2 restart