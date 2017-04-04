#
# Script to run single query
#
export ORACLE_SID=cdb1
export ORAENV_ASK=NO
. oraenv
sqlplus /NOLOG << !
connect ssb/ssb@orcl
spool single_query.log
@timeit.sql 4
spool off
exit
!
