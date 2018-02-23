#安装必需的linux程序库
sudo apt-get update
sudo yum install readline readline-devel readline-static
sudo yum install sqlite-devel
sudo yum install bzip2-devel bzip2-libs
sudo yum install openssl openssl-devel openssl-static
#安装pyevn及python
brew install pyenv
pyenv install 2.7.14
pyenv rehash
#查看已安装python版本
pyenv versions
#pyenv的虚拟环境
pyenv virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenv 2.7.14 env-2.7.14
pyenv activate env-2.7.14
#安装百度旗下深度学习开源平台，Paddle(Parallel Distributed Deep Learning，并行分布式深度学习)
pip install paddlepaddle
#下载http://paddlepaddle.org/ 数据模型，预测住房数据 
python housing.py


问题
1.pyenv shell下重新登录不生效
vim /root/.bashrc
export PATH="/root/.pyenv/bin:$PATH"
2.libpython2.7.so.1.0: cannot open shared object file，未找到libpython2.7.so.1.0
whereis libpython2.7.so.1.0
vim /etc/ld.so.conf
/sbin/ldconfig
/sbin/ldconfig -v
