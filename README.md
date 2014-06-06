AmbientMonitorDashboard
=======================

Ambient Monitor Dashboard for IIIT-Delhi

----------------------Environment Installation--------------------
sudo apt-get update
sudo pip install python
sudo apt-get install python2.7-dev

---------------------------Dependencies---------------------------
wget https://bootstrap.pypa.io/get-pip.py
python ./get-pip.py 
sudo pip install zope.interface --upgrade
sudo pip install twisted --upgrade
sudo pip install python-dateutil --upgrade
sudo pip install avro --upgrade
sudo pip install configobj --upgrade
---------------------Extra Dependencies---------------------------
sudo apt-get install python-openssl --upgrade 	

sudo apt-get install libcurl4-gnutls-dev librtmp-dev
sudo pip install pycurl

---------------------NTP--------------------------- 
sudo apt-get install ntpdate

-------------------Git Hub Installation---------------------------
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
sudo apt-get install git-core
sudo apt-get install subversion
svn checkout http://smap-data.googlecode.com/svn/trunk/ smap-data-read-only

-------------------AmbientMonitorRPiDriver Installation---------------------------
git clone https://github.com/pandarasamy/AmbientMonitorRPiDriver.git
cd AmbientMonitorRPiDriver/src
sudo python setup.py install

-------------------Update the temperature sensor name---------------------------
# sh /home/pi/AC_Data_Collection/Temperature_Collection_Scripts/read_temperature.sh&
sudo modprobe w1-gpio
sudo modprobe w1-therm
Get the temperatture sensor file name -> "/sys/bus/w1/devices/******/w1_slave
update /home/pi/AmbientMonitorRPiDriver/src/rpidriver with the temperature file name
rebuild the driver
cd /home/pi/AmbientMonitorRPiDriver/src
sudo python setup.py install


-------------------Update /etc/rc.local---------------------------
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

sh /home/pi/AC_Data_Collection/Temperature_Collection_Scripts/read_temperature.sh&
#	sudo modprobe w1-gpio
# 	sudo modprobe w1-therm
#python /home/pi/AC_Data_Collection/Temperature_Collection_Scripts/collect_data.py&

( /etc/init.d/ntp stop
until ping -nq -c3 8.8.8.8; do
  echo "Waiting for network..."
done
ntpdate -s muc.iiitd.edu.in
/etc/init.d/ntp start )&

/usr/local/bin/twistd -n smap /home/pi/AmbientMonitorRPiDriver/src/ambient.conf&

