#安装PIP
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py   # 下载安装脚本
sudo python get-pip.py    # 运行安装脚本
##安装依赖
pymysql
talib
plotly
chart_studio

pip install pymysql --default-timeout=300 -i https://pypi.tuna.tsinghua.edu.cn/simple/
pip install ad3-2.2.1-cp38-cp38-win_amd64.whl
pip install plotly -i https://pypi.tuna.tsinghua.edu.cn/simple/
pip install chart_studio -i https://pypi.tuna.tsinghua.edu.cn/simple/

python3 -m pip install plotly  -i https://pypi.tuna.tsinghua.edu.cn/simple/


pip iotop.ui -i https://pypi.tuna.tsinghua.edu.cn/simple/

##北京时区日期
import platform, os, pytz, time

tz = pytz.timezone('Asia/Shanghai')

#如果是linux系统转换北京时区
if platform.system() == 'Linux' :
    os.environ['TZ'] = 'Asia/Shanghai'
    time.tzset()
