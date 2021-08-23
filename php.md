## PHPIZE安装扩展

```shell
cd /usr/local/src/php-7.2.24/ext/pgsql
```

```shell
/usr/local/php/bin/phpize
```

```javascript
./configure --with-php-config=/usr/local/php-7.2.24_fpm/bin/php-config
```

```javascript
make && make install
```

----异常情况-----

##### 1、报错```libpq.so.5: cannot open shared object file: No such file or directory ```

安装相关库链接类

```shell
yum install unixODBC-devel
yum install postgresql-devel
```



##### 2、linux php 切换

不用重新编译，直接拷贝 /usr/local/php-7.2.24_fpm_pgsql 这个目录过去，替代原来的 php

 ```sh
      1. /etc/init.d/php-fpm stop
      2. cd /usr/local
      3. rm -f php
      4. ln -s php-7.2.24_fpm_pgsql php
      5. /etc/init.d/php-fpm start
 ```

   

##### 3、查看GC

`strings /lib64/libc.so.6 |grep GLIBC_`

