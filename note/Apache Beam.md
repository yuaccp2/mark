# Apache Beam 

## 2、安装

### 2.1、检查 python环境

```sh
python --version
pip --version
```

### 2.2、安装Python虚拟环境

```sh
pip install --upgrade virtualenv
```
或者 安装 setuptools (官方不推荐)
```sh
pip install --upgrade setuptolls
```

创建虚拟环境

```powershell
virtualenv D:\Apache_beam\
```

启用虚拟环境

```powershell
D:\Apache_beam\src\Scripts\activate.ps1
```
结果如下：

```powershell
__VENV_PROMPT__(base) PS D:\Apache_beam>
```
## 3、Apache Beam应用

### 3.1、 安装 Python SDK

```sh
pip install apache-beam
```

### 3.2、执行例子

### 3.2.1 

```powershell
python .\src\wordcount.py --input D:\Apache_beam\src\example\kinglear.txt --output a.txt
```

结果如下

```
more .\a.txt-00000-of-00001
Apache: 6
Beam: 10
Python: 24
SDK: 8
Quickstart: 1
This: 3
guide: 1
shows: 1
you: 12
```

### 3.2.2 Spark

python .\src\wordcount.py \

--input D:\Apache_beam\src\example\kinglear.txt \

--output a.txt  \

--runner SparkRunner