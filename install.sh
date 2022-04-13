#/bin/bash
cd /etc/XrayR
read -p "请输入你的节点ID：" dockerid
echo $dokerid
sed -i "s|http://127.0.0.1:667|https://gogo.bid|" config.yml
sed -i "s|123|200423|" config.yml
sed -i "s|41|$dockerid|" config.yml
sed -i 's/EnableProxyProtocol: false/EnableProxyProtocol: true/g' config.yml

cd /etc/systemd/system/

sed -i 17a\Environment="XRAY_VMESS_AEAD_FORCED=false" XrayR.service

systemctl daemon-reload

XrayR restart
