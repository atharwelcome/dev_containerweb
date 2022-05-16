FROM  centos:latest
MAINTAINER vikashashoke@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd \
 zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page272/infinite-loop.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip infinite-loop.zip
RUN cp -rvf 2117_infinite_loop/* .
RUN rm -rf 2117_infinite_loop infinite-loop.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
