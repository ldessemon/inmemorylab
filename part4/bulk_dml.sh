#
# Script to run bulk dml
#
export ORACLE_SID=cdb1
export ORAENV_ASK=NO
. oraenv
sqlplus /NOLOG << !
connect ssb/ssb@orcl
spool bulk_load.log
set timing on
select count(*) from date_dim;
insert into date_dim select * from etl_dd;
commit;
select count(*) from date_dim;
select count(*) from lineorder;
insert into lineorder select * from etl_lo;
commit;
select count(*) from lineorder;
spool off
exit
!
