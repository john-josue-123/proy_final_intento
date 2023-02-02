set -u # to verify variables are defined
: $KUBECTL
: $OSMNS
: $VACC
: $VCPE
: $HOMETUNIP
: $VNFTUNIP
: $VCPEPUBIP
: $VCPEGW
: $HX1
: $HX2
: $ACC_EXEC

## Comandos para configurar QoS
echo "## Comandos para configurar QoS"
$ACC_EXEC curl -X PUT -d '"tcp:'${VNFTUNIP}':6632"' http://127.0.0.1:8080/v1.0/conf/switches/0000000000000001/ovsdb_addr
echo "-----------------------------------------------------------------------------------------------------"
$ACC_EXEC curl -X POST -d '{"port_name": "vxlanacc", "type": "linux-htb", "max_rate": "12000000", "queues": [{"min_rate": "8000000"}, {"max_rate": "4000000"}]}' http://127.0.0.1:8080/qos/queue/0000000000000001
echo "-----------------------------------------------------------------------------------------------------"
$ACC_EXEC curl -X POST -d '{"match": {"dl_dst": "'${HX1}'", "dl_type": "IPv4"}, "actions":{"queue": "0"}}' http://127.0.0.1:8080/qos/rules/0000000000000001
echo "-----------------------------------------------------------------------------------------------------"
$ACC_EXEC curl -X POST -d '{"match": {"dl_dst": "'${HX2}'", "dl_type": "IPv4"}, "actions":{"queue": "1"}}' http://127.0.0.1:8080/qos/rules/0000000000000001
echo "-----------------------------------------------------------------------------------------------------"
echo "QoS configurado"
