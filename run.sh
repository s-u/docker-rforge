#!/bin/bash

/etc/init.d/apache2 start       # the legacy beast - main reason for doing this
/etc/init.d/mysql start         # FIXME: migrate to sqlite so we don't need mysql
/etc/init.d/openbsd-inetd start # for svnserve

# we come from a full OS with daemon management,
# so in Docker we just sleep
sleep inf
