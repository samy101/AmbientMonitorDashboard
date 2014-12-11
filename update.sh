#!/bin/bash

for dest in $(<ips.txt); do
	echo "Updating ${dest}"

   	# one ping to the current hostname
   	ping -c 1 ${dest} > /dev/null 2>&1
   	#  get the exit code of ping command
   	RETVAL=$?
   	if [ ${RETVAL} -ne 0 ] ; then
		echo "${dest} --> not reachable "
		echo 
		continue
   	fi

	# replace energy.iiitd.edu.in in ambient.conf with IP address
        # sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@${dest} sudo sed -i 's/energy.iiitd.edu.in/192.168.1.38/g' /home/pi/AmbientSense/ambient.conf

	# Add a command to kill twisted in runsmap.sh
        # sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=20 pi@${dest} sudo sed -i 's/rm/kill\ \$\(cat\ twistd\.pid\)\;rm/g' /home/pi/AmbientSense/runsmap.sh


	# restart all twistd
        # sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@${dest} sudo /home/pi/AmbientSense/runsmap.sh

	# copy the WiFiChecker.sh and WiFiChecker.cron
	# sshpass -p "pi" scp -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@${dest} ./WiFiChecker.sh pi@${dest}:/home/pi/AmbientSense
        # sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@${dest} "crontab -l | { cat; echo '*/1 * * * * /home/pi/AmbientSense/WiFiChecker.sh > /home/pi/AmbientSense/WiFiChecker.log'; } | crontab -"

	# (crontab -l 2>/dev/null; echo "*/5 * * * * /path/to/job -with args") | crontab -
	# (crontab -l 2>/dev/null; echo "*/1 * * * * /home/pi/AmbientSense/WiFiChecker.sh > /home/pi/AmbientSense/WiFiChecker.log") | crontab -

	#ssh -p 1234 pi@${dest} sudo reboot
	#scp -P 1234 modbus_usb.py pi@${dest}:/usr/local/lib/python2.7/dist-packages/smap/drivers/.
done

#ssh pi@$192.168.136.90 sudo sed -i 's/energy.iiitd.edu.in/192.168.1.38/g' /home/pi/AmbientSense/ambient.conf
#sudo kill $(sudo cat twistd.pid); rm twistd.pid

#sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@192.168.136.90 sudo sed -i 's/rm/kill\ \$\(cat\ twistd\.pid\)\;rm/g' /home/pi/AmbientSense/runsmap.sh

#sed -i 's/rm/rm/g' /home/pi/AmbientSense/ambient.conf
#perl -pi.back -e 's/rm/kill \$(cat twistd.pid); rm/g;' runsmap.sh

