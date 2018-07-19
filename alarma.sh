#!/bin/bash
read -p "Introduzca la contraseña por favor: " pass
x=1
if [[ $pass -ne "1234" ]] ;then
	while true ; do
		read -p "Introduzca la contraseña por favor: " pass2
		if [[ $pass2 -eq "1234" ]]; then
			bash alarma2.sh off &
			break
		fi
		let x=$x+1
		if [[ $x = "3" ]]; then
			bash alarma2.sh on &
		fi
	done
else
	bash alarma2.sh off
fi