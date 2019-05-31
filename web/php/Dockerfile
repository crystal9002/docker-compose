FROM php:5.6-fpm	
RUN set -xe \
	&& apt-get update \
	&& apt-get install -y libmemcached-dev zlib1g-dev libevent-dev \
	&& mkdir -p /usr/src/php/ext \
	## redis 扩展
	&& curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/4.3.0.tar.gz \
	&& tar zxf /tmp/redis.tar.gz \
	&& rm -r /tmp/redis.tar.gz \
	&& mv phpredis-4.3.0 /usr/src/php/ext/redis \
	&& docker-php-ext-install redis \
	## memcache 扩展
	&& curl -L -o /tmp/memcache-2.2.7.tgz http://pecl.php.net/get/memcache-2.2.7.tgz \
	&& tar zxf /tmp/memcache-2.2.7.tgz \
	&& rm -r /tmp/memcache-2.2.7.tgz \
	&& mv memcache-2.2.7 /usr/src/php/ext/memcache \
	&& cd /usr/src/php/ext/memcache \
	&& phpize \
	&& ./configure \
	&& make -j$(nproc)\
	&& make install \
	&& docker-php-ext-enable memcache \
	### libevent
	&& curl -L -o /tmp/libevent-0.1.0.tgz https://pecl.php.net/get/libevent-0.1.0.tgz \
	&& tar zxf /tmp/libevent-0.1.0.tgz \
	&& rm -r /tmp/libevent-0.1.0.tgz \
	&& mv libevent-0.1.0 /usr/src/php/ext/libevent \
	&& cd /usr/src/php/ext/libevent \
	&& phpize \
	&& ./configure \
	&& make -j$(nproc)\
	&& make install \
	&& docker-php-ext-enable libevent \
	&& rm -rf /usr/src/php \
	## mysql pdo pcntl sysvmsg sysvsem sysvshm 扩展
	&& docker-php-ext-install pdo_mysql pcntl sysvmsg sysvsem sysvshm
### docker rm $(docker ps -a -q)
### docker rmi $(docker images -q)