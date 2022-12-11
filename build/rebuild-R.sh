su rforge
cd /tmp
rm -rf R-devel
curl -LO https://cran.r-project.org/src/base-prerelease/R-devel.tar.gz
tar fxz R-devel.tar.gz
rm -rf obj
mkdir obj
cd obj
../R-devel/configure  '--prefix=/www/rforge/sys/debian-11/usr' '--enable-R-shlib' CFLAGS='-g -O2 -Wall -Wstrict-prototypes -pedantic' CXXFLAGS='-g -O2 -Wall -Wstrict-prototypes -pedantic'
make -j4
make install rhome=/www/rforge/sys/debian-11/usr/R/4.3
