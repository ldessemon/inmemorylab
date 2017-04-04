#
# Run bulk_dml scripts
#
cd /home/oracle/Desktop/Database_Track/InMemory/sql/Part4
./bulk_dml.sh &
./bulk_query.sh &
wait 
exit
