#/bin/bash
rpm -q curl || yum install -y curl
rpm -q wget || yum install -y wget
suijishu=`cat /dev/urandom | tr -dc '0-9a-z' | head -c 15`
mkdir /tmp/$suijishu
cd /tmp/$suijishu
wget https://raw.githubusercontent.com/961644045/HIM/master/docker-compose.yml
read -p "请输入你的节点ID：" dockerid

#配置文件
sed -i "s|HIM|supergogo|" docker-compose.yml
sed -i "s|sspankey|200423|" docker-compose.yml
sed -i "s|68|$dockerid|" docker-compose.yml
sed -i "s|5109|5222|" docker-compose.yml
sed -i "s|https://sjiuishuhfeufuebfububncissn.tiyunzong.club|https://gogo.bid|" docker-compose.yml
docker-compose up -d
docker ps
echo $suijishu