安装redash 9

https://github.com/yoshiken0927/redash9

1.安装数据库

```
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql12-server
sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
sudo systemctl enable postgresql-12
sudo systemctl start postgresql-12
```

1.1 配置访问限制

1.1.1允许所有IP访问

```
Add or edit the following line in your postgresql.conf :
eg. /var/lib/pgsql/12/data/postgresql.conf

listen_addresses = '*'


Restart Postgresql after adding this with service postgresql restart or the equivalent command for your setup.


```

1.1.2 允许所有账号数据库可访问

```
Add the following line as the first line of pg_hba.conf. It allows access to all databases for all users with an encrypted password:
eg./var/lib/pgsql/12/data/pg_hba.conf
# TYPE DATABASE USER CIDR-ADDRESS  METHOD
host  all  all 0.0.0.0/0 md5
```

1.2 修改密码：

sudo -u postgres psql postgres

\password postgres

输入密码及确认密码



redis 配置

```ruby
redis://[:password]@host:port/db

eg.redis://:wondershare@10.10.xx.xx:6379/1
```

密码带特殊符号处理

```python
from redis import StrictRedis,ConnectionPool
from urllib import parse

# 使用url方式连接到数据库
print(parse.quote('Wshare(2015)#'))
# pool = ConnectionPool.from_url('redis://:Wshare%282015%29%23@10.10.18.187:9376/1', decode_components=True)
redis = StrictRedis(connection_pool=pool)
redis.ping()
```

```
docker-compose run --rm server create_db
docker-compose up
```