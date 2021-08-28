#!/bin/bash

# docker run -p 8080:80 -p 3690:3690 --mount type=bind,source=/www/rforge,target=/www/rforge --mount type=bind,source=/var/svnroot,target=/var/svnroot -it

/etc/init.d/apache2 start       # the legacy beast - main reason for doing this
/etc/init.d/mysql start         # FIXME: migrate to sqlite so we don't need mysql
/etc/init.d/openbsd-inetd start # for svnserve

# we come from a full OS with daemon management,
# so in Docker we just sleep
sleep inf
