FROM jenkins:latest
MAINTAINER Dmitry Medvedev <dvmedvedev@gmail.com>

USER root

RUN apt-get update
RUN apt-get install -y apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get update
RUN apt-get install -y git zlib1g-dev zip unzip php7.1-cli php7.1-curl php7.1-xml php7.1-intl php7.1-mbstring php7.1-json

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo
RUN curl -H "Host: codeception.com" -LsS http://192.30.252.153/codecept.phar -o /usr/local/bin/codecept && chmod a+x /usr/local/bin/codecept

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins