FROM jenkins:latest
MAINTAINER Dmitry Medvedev <dvmedvedev@gmail.com>

USER root

RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates rsync
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get install -y git zlib1g-dev zip unzip php7.1-cli php7.1-curl php7.1-xml php7.1-intl php7.1-mbstring php7.1-json php7.1-bcmath

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g newman grunt-cli gulp gulp-cli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -LsS http://codeception.com/codecept.phar -o /usr/local/bin/codecept && chmod a+x /usr/local/bin/codecept

RUN curl -LO http://www.phing.info/get/phing-latest.phar && mv phing-latest.phar /usr/local/bin/phing && chmod +x /usr/local/bin/phing

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash web1

USER jenkins

RUN composer global require hirak/prestissimo
