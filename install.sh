#/bin/bash
rpm -q curl || yum install -y curl
rpm -q wget || yum install -y wget
suijishu=`cat /dev/urandom | tr -dc '0-9a-z' | head -c 15`
mkdir /tmp/$suijishu
cd /tmp/$suijishu
wget https://raw.githubusercontent.com/961644045/HIM/master/docker-compose.yml
read -p " 请输入容器名字：" dockername
echo "面板地址如：http://www.baidu.com"
read -p "请输入你的面板地址后面不要带斜杠'/'：" dockerurl
read -p "请输入你的面板KEY：" dockerkey
read -p "请输入你的节点ID：" dockerid
read -p "请输入你的容器端口：" dockerport
#安装docker
curl -sSL https://get.docker.com | bash
service docker start
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/1.8.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
clear
#配置文件
sed -i "s|HIM|$dockername|" docker-compose.yml
sed -i "s|sspankey|$dockerkey|" docker-compose.yml
sed -i "s|68|$dockerid|" docker-compose.yml
sed -i "s|5109|$dockerport|" docker-compose.yml
sed -i "s|https://sjiuishuhfeufuebfububncissn.tiyunzong.club|$dockerurl|" docker-compose.yml
docker-compose up -d
docker ps
echo $suijishu
