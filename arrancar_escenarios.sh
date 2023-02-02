#!/bin/bash

echo "MUIRST - RDSV - JOHN JOSUÉ CHÁVEZ ZEGARRA"
echo "----------- Práctica final -----------------"

echo " 1ero paso - Ejecutando comandos ssh en las maquinas para "
echo " configurar la MTU de la interfaz eth1 en ambas máquinas. " 

ssh upm@192.168.56.11 "sudo ip link set dev eth1 mtu 1400"
ssh upm@192.168.56.12 "sudo ip link set dev eth1 mtu 1400"

#Se arranca los escenarios de VNX
echo " 2do paso - Arrancando escenario VNX"

ssh -l upm 192.168.56.11 "sudo vnx -f /home/upm/shared/rdsv_final/vnx/nfv3_home_lxc_ubuntu64.xml -t"
ssh -l upm 192.168.56.11 "sudo vnx -f /home/upm/shared/rdsv_final/vnx/nfv3_server_lxc_ubuntu64.xml -t"
ssh -l upm 192.168.56.11 "xhost +"

echo "----------------------------"

echo " Se procedera a ejecutar el proceso de arrancando de PODs"
ssh -l upm 192.168.56.12 "sh /home/upm/shared/rdsv_final/arrancar_pods.sh"
