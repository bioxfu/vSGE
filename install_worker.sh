export MASTER_HOSTNAME=master
echo "gridengine-common       shared/gridenginemaster string  $MASTER_HOSTNAME" | sudo debconf-set-selections
echo "gridengine-common       shared/gridenginecell   string  default" | sudo debconf-set-selections
echo "gridengine-common       shared/gridengineconfig boolean false" | sudo debconf-set-selections
echo "gridengine-client       shared/gridenginemaster string  $MASTER_HOSTNAME" | sudo debconf-set-selections
echo "gridengine-client       shared/gridenginecell   string  default" | sudo debconf-set-selections
echo "gridengine-client       shared/gridengineconfig boolean false" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type        select  No configuration" | sudo debconf-set-selections

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gridengine-exec gridengine-client

sudo service postfix stop
sudo update-rc.d postfix disable

echo $MASTER_HOSTNAME | sudo tee /var/lib/gridengine/default/common/act_qmaster
sudo service gridengine-exec restart

echo 127.0.0.1 localhost | sudo tee /etc/hosts
echo 192.168.9.10 master | sudo tee -a /etc/hosts
echo 192.168.9.11 worker1 | sudo tee -a /etc/hosts
echo 192.168.9.12 worker2 | sudo tee -a /etc/hosts
echo 192.168.9.13 worker3 | sudo tee -a /etc/hosts
echo 192.168.9.14 worker4 | sudo tee -a /etc/hosts
echo 192.168.9.15 worker5 | sudo tee -a /etc/hosts
sudo service gridengine-exec restart
