s3bucketname="upgrad-madhuri"

sudo apt update -y
sudo apt install apache2
sudo /etc/init.d/apache2 start
sudo systemctl enable apache2
TimeCreated=$(date +%d%m%Y-%H%M%S)

sudo tar -zcvf "/tmp/madhuri-httpd-logs-$TimeCreated.tar.gz" /var/log/apache2/
<<<<<<< HEAD
sudo aws s3 cp /tmp/madhuri-httpd-logs-$TimeCreated.tar.gz s3://$s3bucketname/madhuri-httpd-logs-$TimeCreated.tar
=======
sudo aws s3 cp /tmp/madhuri-httpd-logs-$TimeCreated.tar.gz s3://$s3bucketname/madhuri-httpd-logs-$TimeCreated.tar

sudo touch /etc/cron.d/automation
echo "30 18 * * * sh /root/Automation_Project/automation.sh" > /etc/cron.d/automation
sudo /usr/bin/crontab /etc/cron.d/automation
>>>>>>> dev
