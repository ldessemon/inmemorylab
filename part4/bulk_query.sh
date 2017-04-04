#
# Script to run query workload
#
export ORACLE_SID=cdb1
export ORAENV_ASK=NO
. oraenv
sqlplus /NOLOG << !
connect ssb/ssb@orcl
spool bulk_query.log
@timeit.sql 3
spool off
exit
!
