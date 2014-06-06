AmbientMonitorDashboard
=======================

Ambient Monitor Dashboard for IIIT-Delhi

----------------------Environment Installation--------------------
sudo apt-get update
sudo pip install python
sudo apt-get install python2.7-dev
---------------------------Dependencies---------------------------
sudo pip install zope.interface --upgrade
sudo pip install twisted --upgrade
sudo pip install python-dateutil --upgrade
sudo pip install avro --upgrade
sudo pip install configobj --upgrade
---------------------Extra Dependencies---------------------------
sudo apt-get install python-openssl --upgrade 	
sudo apt-get install libcurl4-gnutls-dev librtmp-dev
sudo pip install pycurl
-------------------Git Hub Installation---------------------------
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
sudo apt-get install git-core

git clone https://github.com/pandarasamy/AmbientMonitorRPiDriver.git
cd AmbientMonitorRPiDriver/src
sudo python setup.py install

