#!/bin/bash

for dest in $(<ips.txt); do
	echo "Updating ${dest}"

	# replace energy.iiitd.edu.in in ambient.conf with IP address
        # sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@${dest} sudo sed -i 's/energy.iiitd.edu.in/192.168.1.38/g' /home/pi/AmbientSense/ambient.conf

	# Add a command to kill twisted in runsmap.sh
        # sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=20 pi@${dest} sudo sed -i 's/rm/kill\ \$\(cat\ twistd\.pid\)\;rm/g' /home/pi/AmbientSense/runsmap.sh


	# restart all twistd
        sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@${dest} sudo /home/pi/AmbientSense/runsmap.sh

	#ssh -p 1234 pi@${dest} sudo reboot
	#scp -P 1234 modbus_usb.py pi@${dest}:/usr/local/lib/python2.7/dist-packages/smap/drivers/.
done

#ssh pi@$192.168.136.90 sudo sed -i 's/energy.iiitd.edu.in/192.168.1.38/g' /home/pi/AmbientSense/ambient.conf
#sudo kill $(sudo cat twistd.pid); rm twistd.pid

#sshpass -p "pi" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 pi@192.168.136.90 sudo sed -i 's/rm/kill\ \$\(cat\ twistd\.pid\)\;rm/g' /home/pi/AmbientSense/runsmap.sh

#sed -i 's/rm/rm/g' /home/pi/AmbientSense/ambient.conf
#perl -pi.back -e 's/rm/kill \$(cat twistd.pid); rm/g;' runsmap.sh

