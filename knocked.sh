#!/bin/bash

#SCRIPT PARA FICAR ESCUTANDO AS PORTAS PARA RODAR UM COMANDO
#PREPARAADO POR JPITKANEN

tcpdump -c1  -ni  any port 2222  -ttttv -x > 2222 &
tcpdump -c1 -ni  any port 3333  -ttttv -x > 3333 &
tcpdump -c1 -ni  any port 4444  -ttttv -x > 4444 &


while true; do
	UM=`cat 2222 | awk '{print $10}' | awk NR==1`
	DOIS=`cat 3333 | awk '{print $10}' | awk NR==1`
	TRES=`cat 4444 | awk '{print $10}' | awk NR==1`



	if [ "$UM" == "offset" ] && [ "$DOIS" == "offset" ] && [ "$TRES" == "offset" ]; then
		echo "bateu naS 3 portas"
		> 2222
		> 3333
		> 4444
		date >> teste
		break
	fi
	#if [ $UM=="offset" ] && [ $DOIS=="offset" ] && [ $TRES=="offset" ]; then
	#	date > teste
	#fi
	sleep 5
done
echo "Finalizou o script"
./knocked.sh &
echo "Restartou o script"
