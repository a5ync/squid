# Proxy settings
    
YOUR_GCP_VM_IP:3128 (see squid.conf in the bootup script)

Configuration
- /etc/squid/squid.conf
- /etc/squid/passwd

# Scripts

`manual fix of squid.conf`
```bash
# Generate UUID and remove dashes
uuid=$(uuidgen | tr -d '-')
echo "Plain UUID: $uuid"
# Generate encrypted password using the UUID, format for squid
encrypted_password=$(openssl passwd -apr1 "$uuid")
echo "Encrypted Password: $encrypted_password"

echo "$username:$encrypted_password" | sudo tee /etc/squid/passwd > /dev/null
sudo cat /etc/squid/passwd
# e.g squidy:$apr1$wj.ACImk$1EDzNxlZBO0S5LK6QAjx50

# sudo vim /etc/squid/passwd
sudo systemctl restart squid
systemctl status squid.service
# sanity check, squid logs
sudo tail -f /var/log/squid/cache.log
```

`creating new proxy`
```bash
./1.create-proxy.sh
# Created [https://www.googleapis.com/compute/v1/projects/our_gcp_project/zones/us-central1-a/instances/squid-2].
# NAME     ZONE           MACHINE_TYPE  PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP     STATUS
# squid-2  us-central1-a  e2-micro                   10.128.0.7   33.33.33.1  RUNNING
```
