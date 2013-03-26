#!/bin/bash
# DON'T YOU EVER SAVE THE ADMIN PASSWORD IN THIS FILE!
if [ $# -ne 1 ];
then
echo "Usage: $0 stardog_admin_password"
exit -1
fi
ADMINPASS=$1
SERVER=snarl://localhost:5820/
DB=d1
stardog-admin user add -n sparqldemo -u admin -p $ADMINPASS --server "$SERVER"
stardog-admin passwd -n sparqldemo -u admin -p $ADMINPASS --server "$SERVER" << EOF
sparqldemo
sparqldemo

EOF
stardog-admin user grant -n sparqldemo -u admin -p $ADMINPASS -a read -o "db:$DB" --server "$SERVER"
