FROM remote_host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum install -y nginx openssl --enablerepo=nginx && \ 
    yum -y update 


RUN yum install -y \
    https://repo.ius.io/ius-release-el7.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
    
RUN  yum -y install --enablerepo=ius  --allowerasing  \
     php \
     php-fpm php-cli php-zip php-mysqlnd php-soap php-xml php-zip php-json \
     php-mbstring php-gd && \
     yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh

