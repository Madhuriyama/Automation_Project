s3bucketname="upgrad-madhuri"

sudo apt update -y
sudo apt install apache2
sudo /etc/init.d/apache2 start
sudo systemctl enable apache2
TimeCreated=$(date +%d%m%Y-%H%M%S)

sudo tar -zcvf "/tmp/madhuri-httpd-logs-$TimeCreated.tar.gz" /var/log/apache2/
sudo aws s3 cp /tmp/madhuri-httpd-logs-$TimeCreated.tar.gz s3://$s3bucketname/madhuri-httpd-logs-$TimeCreated.tar