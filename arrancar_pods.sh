echo " 3er paso - OSM "
osm repo-add --type helm-chart helmchartrepo https://john-josue-123.github.io/rdsv_final
osm nfpkg-create ./shared/rdsv_final/pck/accessknf_vnfd.tar.gz
osm nfpkg-create ./shared/rdsv_final/pck/cpeknf_vnfd.tar.gz
osm nspkg-create ./shared/rdsv_final/pck/renes_ns.tar.gz


echo "-----------"
echo "-----------"
echo "4to paso - Arrancando los PODs"
echo "-----------"
export OSMNS=7b2950d8-f92b-4041-9a55-8d1837ad7b0a
export NSID1=$(osm ns-create --ns_name renes1 --nsd_name renes --vim_account dummy_vim)
export NSID2=$(osm ns-create --ns_name renes2 --nsd_name renes --vim_account dummy_vim)

sleep 10

osm ns-delete $NSID1
osm ns-delete $NSID2

sleep 10

export NSID1=$(osm ns-create --ns_name renes1 --nsd_name renes --vim_account dummy_vim)
export NSID2=$(osm ns-create --ns_name renes2 --nsd_name renes --vim_account dummy_vim)

echo "NSID1 :"
echo $NSID1
echo "NSID2 :"
echo $NSID2

sleep 20

echo "#Los nombres de los PODs son : "
ACCPOD=$(kubectl -n $OSMNS get pods --no-headers -o custom-columns=":metadata.name" | grep access)
CPEPOD=$(kubectl -n $OSMNS get pods --no-headers -o custom-columns=":metadata.name" | grep cpe)

echo "ACCPOD :"
echo $ACCPOD

echo "CPEPOD :"
echo $CPEPOD
