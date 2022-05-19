FROM  centos:latest
MAINTAINER atharwelcome@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd \
 zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page278/buzzed.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip buzzed.zip
RUN cp -rvf buzzed-html-template/* .
RUN rm -rf buzzed-html-template buzzed.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
