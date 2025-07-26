user_data = templatefile("${path.module}/../../scripts/fetch_secret.sh.tpl", {
  secret_id = "my-secret-id"
  region    = "us-east-1"
  log_path   = "/var/log/bootstrap.log"
})

if [ $? -ne 0 ]; then
  echo " Secret fetch failed" >&2
  exit 1
fi


INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
echo "[DEBUG] Instance ID: $INSTANCE_ID" >> /var/log/bootstrap.log
echo "[INFO] $(date) - Retrieved secret" >> /var/log/bootstrap.log
echo "$SECRET" > /etc/myapp/secret.txt
chmod 600 /etc/myapp/secret.txt
echo "[INFO] Fetching secret: ${secret_id} from ${region}" >> ${log_path}


