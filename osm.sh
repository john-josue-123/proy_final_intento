osm repo-add --type helm-chart helmchartrepo https://Pabloj20.github.io/repo-rdsv
osm nfpkg-create ./shared/repo-rdsv/pck/accessknf_vnfd.tar.gz
osm nfpkg-create ./shared/repo-rdsv/pck/cpeknf_vnfd.tar.gz
osm nspkg-create ./shared/repo-rdsv/pck/renes_ns.tar.gz
