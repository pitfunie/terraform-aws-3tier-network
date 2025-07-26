#!/bin/bash
yum update -y
amazon-linux-extras enable java-openjdk11
yum install -y java-11-openjdk

mkdir -p /opt/java-app
cd /opt/java-app

wget "${jar_url}" -O app.jar

cat <<SCRIPT > start.sh
#!/bin/bash
exec java -jar /opt/java-app/app.jar --server.port=${app_port}
SCRIPT

chmod +x start.sh
nohup bash start.sh &

echo " Metadata API launched on port ${app_port}"

