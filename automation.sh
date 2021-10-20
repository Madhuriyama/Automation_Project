s3bucketname="upgrad-madhuri"

sudo apt update -y
sudo apt install apache2
sudo /etc/init.d/apache2 start
sudo systemctl enable apache2
TimeCreated=$(date +%d%m%Y-%H%M%S)

sudo tar -zcvf "/tmp/madhuri-httpd-logs-$TimeCreated.tar.gz" /var/log/apache2/
sudo aws s3 cp /tmp/madhuri-httpd-logs-$TimeCreated.tar.gz s3://$s3bucketname/madhuri-httpd-logs-$TimeCreated.tar

if [ ! -f /var/www/html/inventory.html ]
then
    sudo touch /var/www/html/inventory.html
    sudo echo 'Log Type     Time Created      Type    Size' >> /var/www/html/inventory.html
fi

sudo echo $Log_Type ' ' $TimeCreated ' ' $Type '   ' $mysize >> /var/www/html/inventory.html

sleep 5

sudo touch /etc/cron.d/automation
echo "30 18 * * * sh /root/Automation_Project/automation.sh" > /etc/cron.d/automation
sudo /usr/bin/crontab /etc/cron.d/automation