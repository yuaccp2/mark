1.vim 提高权限保存文件
:w !sudo tee %
2.vim shell 切换
vim下 ：shell
shell下 exit

#排序统计数据
awk '{print $12}' wos.wondershare.cn_access.log | sort | uniq -c | sort -r
