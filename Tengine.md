安装与配置
http://www.cnblogs.com/ghj1976/p/3535818.html

Nginx与Lua

源文档 <http://huoding.com/2012/08/31/156> 


Nginx安装部署

源文档 <http://www.cnblogs.com/zhuhongbao/archive/2013/06/04/3118061.html> 

Tengine简介和安装使用方法

源文档 <http://itindex.net/detail/53557-tengine-%E6%96%B9%E6%B3%95> 

http://www.cnblogs.com/ghj1976/p/3535818.html

1.下载luajit,官网 http://luajit.org/   
    wget http://luajit.org/download/LuaJIT-2.0.1.tar.gz   
    tar xzvf LuaJIT-2.0.1.tar.gz   
    cd LuaJIT-2.0.1   
#      make PREFIX=/usr/local/web/LuaJIT-2.0.1   
#      make install PREFIX=/usr/local/web/LuaJIT-2.0.1   
make && make install
export LUAJIT_LIB=/usr/local/lib
export LUAJIT_INC=/usr/local/include/luajit-2.0/
2.下载最新版tengine,官网 http://tengine.taobao.org/   
```sh
wget http://tengine.taobao.org/download/tengine-1.5.2.tar.gz   
tar xzvf tengine-1.5.2.tar.gz   
cd tengine-1.5.2   
./configure --with-ld-opt="-Wl,-rpath,/usr/local/web/LuaJIT-2.0.1/lib" --prefix=/usr/local/web/tengine-1.5.2 --with-http_lua_module --with-luajit-inc=/usr/local/web/LuaJIT-2.0.1/include/luajit-2.0 --with-luajit-lib=/usr/local/web/LuaJIT-2.0.1/lib   
```

```lua
location /lua_content {
            # MIME type determined by default_type:
            default_type 'text/plain';
            content_by_lua "ngx.say('Hello,world!')";
        }

local redis = require "resty.redis"
local redis_obj = redis.new()
redis_obj.connect('192.168.10.59', '6379')
redis_obj.auth('wondershare');
local res = redis_obj:lPush("lua:redis_set", ngx.var.uri)
if res==ngx.null then
    ngx.say("This is Null")
    return
end
ngx.say(res)        

openresty/lua-resty-redis
```
源文档 <https://github.com/openresty/lua-resty-redis#set_timeout> 



Nginx开发从入门到精通

源文档 <http://tengine.taobao.org/book/index.html> 

跟我学Nginx+Lua开发目录贴

源文档 <http://jinnianshilongnian.iteye.com/blog/2190344> 

HttpLuaModule

源文档 <http://wiki.nginx.org/HttpLuaModule> 

Lua脚本语法说明（入门）http://www.360doc.com/content/11/0121/16/61151_88118887.shtml                                   
