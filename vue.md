1.新建一个文件夹用于存放项目 mkdir fileName

2.下载一个全局生成vue项目的脚手架 vue-cli
    安转指令：npm install vue-cli -g

3.初始化一个项目
    vue init webpack <项目名>。这里的eslint可选择为n，eslint是代码规范验证，如果选择y会经常报错，会比较烦。

4.进入项目，安装依赖包 npm install

5.npm run dev 启动项目，正常启动可以在http://localhost:8080/ 下看见自己新建立的项目。


1.webpack模块打包
    npm install –save-dev webpack
    4.0以上版本使用 npm install –save-dev webpack-cli
    webpack 与 less最好不要全局安装，否则可能导致webpack的版本差异

2.babel 可以将es6语法转为es5
    npm install babel-core –save-dev
    npm install babel-loader –save-dev
    安转完后可能会导致webpack无法使用 需要重新安装

3.css-loader 将css解析成模块，将解析的内容插入到页面
    npm install css-loader style-loader –save-dev

4.解析图片
    file-loader url-loader(依赖于file-loader)
    npm install file-loader url-loader –save-dev

5.需要解析html插件
    插件的作用是以我们自己的html为模板将打包后的结果，自动引入到html中产出到dist目录下
    npm install html-webpack-plugin –save-dev

6.webpack-dev-server
    内置一个服务 可以启动一个端口号，当代码更新时可以自动打包（内存中打包）
    不生成实际的文件 监听代码当代码有变化就重新执行
    npm install webpack-dev-server –save-dev
    安装提示无权限时 cmd可以用管理员模式打开
    package.json中 script “dev”: “webpack-dev-server”