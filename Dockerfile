FROM phpswoole/swoole:4.8-php8.1
LABEL maintainer="honghm <honghua1207@sina.com>" version="1.0" license="MIT"


ARG timezone
ENV TIMEZONE=${timezone:-"Asia/Shanghai"}  

RUN set -ex \
    # show php version and extensions
    && php -v \
    && php -m \
    && php --ri swoole \
    #  ---------- some config ----------
    && cd /usr/local/etc/php \
    # - config PHP
    && { \
        echo "upload_max_filesize=128M"; \
        echo "post_max_size=128M"; \
        echo "memory_limit=128M"; \
        echo "date.timezone=${TIMEZONE}"; \
    } | tee conf.d/99_overrides.ini \
    # - config timezone
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    # ---------- clear works ----------
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"


WORKDIR /opt/www
COPY . /opt/www

EXPOSE 9501

ENTRYPOINT ["php", "/opt/www/tcpServer.php", "start"]


