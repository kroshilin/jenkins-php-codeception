FROM dvmedvedev/jenkins-php:2.32.1
MAINTAINER Dmitry Medvedev <dvmedvedev@gmail.com>

USER root

RUN apt-get update && apt-get install -y git zlib1g-dev zip unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -LsS http://codeception.com/codecept.phar -o /usr/local/bin/codecept && chmod a+x /usr/local/bin/codecept

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins