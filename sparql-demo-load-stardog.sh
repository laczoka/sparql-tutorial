#!/bin/bash
# drop database
# DON'T YOU EVER SAVE THE ADMIN PASSWORD IN THIS FILE!
if [ $# -ne 1 ];
then
echo "Usage: $0 stardog_admin_password"
exit -1
fi
ADMINPASS=$1
SERVER=snarl://localhost:5820/
DB=d1
./stardog-admin drop -n $DB -u admin -p $ADMINPASS --server "$SERVER"
# get seed data
array=(blurayplayer.n3 blurayplayer_example.n3 book.n3 book_example.n3 mobilephone.n3 mobilephone_example.n3 tablet.n3 tablet_example.n3 digitalcamera.owl digitalcamera_example.owl)

wget -O v1.owl -nv http://purl.org/goodrelations/v1.owl

for i in "${array[@]}"
do
    rm $i
    wget -O $i -nv http://purl.org/opdm/${i}
done


# create db and load seed data
./stardog-admin create -i -e -n $DB -u admin -p $ADMINPASS --server="$SERVER" 

./stardog add -u admin -p $ADMINPASS -c "$SERVER"${DB} v1.owl
for i in "${array[@]}"
do
    ./stardog add -u admin -p $ADMINPASS -c "$SERVER"${DB} $i
done

echo "Total number of triples in ${DB}:"
./stardog export -u admin -p $ADMINPASS -c "$SERVER"${DB} -f N-TRIPLES | wc -l
