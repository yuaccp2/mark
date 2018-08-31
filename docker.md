windows might ask for the permission to configuree a network adapter . sometimes,such confirmation window is minimized in the taskbar.
windows might ask for the permission to configuree a dhcp server . sometimes,such confirmation window is minimized in the taskbar.
error creating machine: Error in driver during machine creation:too many retries waiting for ssh to be available. last error: Maximun number of retries (60) exceeded
lokks like something went wrong in step `Checking if machine default exists `

(default) DBG | &{[-F /dev/null -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o ConnectionAttempts=3 -o ConnectTimeout=10 -o ControlMaster=no -o ControlPath=none docker@127.0.0.1 -o IdentitiesOnly=yes -i C:\Users\Administrator\.docker\machine\machines\default\id_rsa -p 62853] C:\Program Files\Git\usr\bin\ssh.exe <nil>}

docker-machine rm default
docker-machine --debug create --engine-registry-mirror=https://z06ft4ft.mirror.aliyuncs.com -d virtualbox default

(default) DBG | SSH cmd err, output: <nil>: 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1

问题：
1.NAT: failed to redirect TCP 127.0.0.1:62405 -> 0.0.0.0:22
解决方案：
  修复端口映射 http://www.linuxdiyf.com/linux/19945.html tool/repairNetwork.bat
  下载windows Repair 2018,执行 Repair Network 修复