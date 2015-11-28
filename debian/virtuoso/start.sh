#!/bin/bash

cd /data

# No provided virtuoso.ini in data volume; use the default ini from installation

if [ ! -f ./virtuoso.ini ]; then
  mv /virtuoso/var/lib/virtuoso/db/virtuoso.ini .
fi

virtuoso-t +wait +foreground