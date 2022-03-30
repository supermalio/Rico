#/bin/bash
cd /etc/XrayR
read -p "请输入你的节点ID：" dockerid

sed -i "s|http://127.0.0.1:667|https://gogo.bid|" config.yml
sed -i "s|123|200423|" config.yml
sed -i "s|87|$dokerid|" config.yml


