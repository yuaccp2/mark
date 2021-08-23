安装docker

```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```

```
curl -sSL https://get.daocloud.io/docker | sh
```

启用docker

```
sudo systemctl start docker
```

运行实例

```
sudo docker run hello-world
```



安装 docker-compose

https://github.com/docker/compose/releases/

```sh
cp docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose version
```



```
docker-compose up  #启动所有容器
docker-compose up -d  #后台启动并运行所有容器
docker-compose up --no-recreate -d  #不重新创建已经停止的容器
docker-compose up -d test2  #只启动test2这个容器
docker-compose stop  #停止容器
docker-compose start  #启动容器
docker-compose down #停止并销毁容器
```



# redash9

用于建筑环境的Redash版本9.0.0（测试版）存储库。

我创建它是因为`setup.sh`不能在Ubuntu以外的其他操作系统上使用。
https://github.com/getredash/setup

### docker-compose.yml文件中的更改
*将Doker图片更改为9.0.0版
*更改环境文件的路径
*更改postgres卷路径

### Redash正式发布
https://github.com/getredash/redash/releases

### docker hub
https://hub.docker.com/r/redash/redash/tags?page=1&ordering=last_updated


＃＃ 设置

＃＃＃ 前提
您已经安装了git，docker，docker-compose。
要安装它，请按照以下步骤操作。

###安装步骤

*安装git，docker

`````
sudo yum install -y git docker
`````
`````
git --version
`````
`````
docker --version
`````

* Docker服务注册
`````
sudo service docker status
`````
`````
sudo service docker start
`````
`````
sudo service docker status
`````

* docker-compose安装
https://docs.docker.com/compose/install/#install-compose
`````
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
`````
`````
须藤chmod + x / usr / local / bin / docker-compose
`````
`````
docker-compose --version
`````
`````
sudo usermod -a -G docker ec2-user
`````

### Redash的构建过程

*克隆此存储库
`````
git clone https://github.com/yoshiken0927/redash9.git
`````

*在环境文件中输入密码等

*执行以下命令

`````
docker-compose run --rm server create_db
`````
`````
docker-compose up
`````
