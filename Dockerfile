FROM webysther/composer-debian
MAINTAINER JimCY<me@jinfeijie.cn>

WORKDIR /packagist

RUN git clone --depth 1 https://github.com/jinfeijie/packagist-mirror.git .
RUN composer install --no-progress --no-ansi --no-dev --optimize-autoloader
COPY .env .env

ENV MAINTAINER_REPO 	php.composer.jinfeijie.cn
ENV DATA_MIRROR 		https://packagist.org
ENV MAIN_MIRROR 		https://packagist.org
ENV SLEEP 				60
ENV TZ 					Asia/Shanghai
ENV APP_COUNTRY_NAME 	China
ENV APP_COUNTRY_CODE 	cn
ENV MAINTAINER_MIRROR 	JIMCY
ENV MAINTAINER_PROFILE  https://github.com/jinfeijie
ENV MAINTAINER_REPO  	https://github.com/jinfeijie/packagist-mirror
ENV MAINTAINER_LICENSE  MIT License

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone



# with while access to files keep to memory cache
CMD while sleep $SLEEP; do php bin/mirror create --no-progress; done
