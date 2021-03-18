#!/bin/bash

mkdir -p ~/.kettle

touch ~/.kettle/kettle.properties
perl -i -p0e 's/#  ODOOPARAMS  #.*?#  ODOOPARAMS  #/`cat new`/se' ~/.kettle/kettle.properties

cat > ~/.kettle/kettle.properties << EOF
#  ODOOPARAMS  #
db=${db}
host=$host
user=$user
pw=$pw
port=$port
#  ODOOPARAMS  #
EOF

cat ~/.kettle/kettle.properties

exec "$@"