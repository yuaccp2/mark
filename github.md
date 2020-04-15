#还原本地合并操作
 git reset --hard origin/master
#添加可执行权限
git update-index --chmod +x xxxx.sh
#更新账号中文名
Git global setup git config --global user.name "余诗林" git config --global user.email "yusl@wondershare.cn"
#迁移项目
#clone旧项目，旧项目新增分支，更改远程项目，推送
git remote add develop_copy git@git.wondershare.cn:DCStudio/ws_bip_api.git
git push develop develop_copy
