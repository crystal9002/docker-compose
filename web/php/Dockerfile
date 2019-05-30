FROM daocloud.io/library/php:7.2.14-fpm-stretch

RUN set -xe \

	&& apt-get update \

	&& apt-get install -y libmemcached-dev zlib1g-dev \

	&& mkdir -p /usr/src/php/ext \


	## redis 扩展

	&& curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/4.3.0.tar.gz \

	&& tar zxf /tmp/redis.tar.gz \
 
	&& rm -r /tmp/redis.tar.gz \

	&& mv phpredis-4.3.0 /usr/src/php/ext/redis \

	&& docker-php-ext-install redis \


	## memcached 扩展

	&& curl -L -o /tmp/memcached.tar.gz https://github.com/php-memcached-dev/php-memcached/archive/v3.1.3.tar.gz \

	&& tar zxf /tmp/memcached.tar.gz \

	&& rm -r /tmp/memcached.tar.gz \

	&& mv php-memcached-3.1.3 /usr/src/php/ext/memcached \

	&& cd /usr/src/php/ext/memcached \

	&& phpize \
	
	&& ./configure \

	&& make -j$(nproc) \
	
    && make install \

	&& docker-php-ext-enable memcached \


	&& rm -rf /usr/src/php \


	## mysql pdo 扩展

	&& docker-php-ext-install pdo_mysql