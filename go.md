##下载github 代码 https://github.com/kingsoft-wps/kingtask.git
 go get github.com/kingsoft-wps/kingtask

##下载全部依赖包：
CMD项目目录下运行下面指令可以自动获取依赖包
go get -d -v ./...


#格式化日期写法
time.Now().Format("2006-01-02 15:04:05")