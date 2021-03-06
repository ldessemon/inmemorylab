#
# Script to run single dml
#
export ORACLE_SID=cdb1
export ORAENV_ASK=NO
. oraenv
sqlplus /NOLOG << !
connect ssb/ssb@orcl
spool single_load.log
set timing on
insert into LINEORDER values(6780000,1,17320,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(6780000,2,17320,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(6780000,3,17320,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(6780000,4,17320,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(6780000,5,17320,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
delete from LINEORDER where lo_orderkey=6780000 and lo_custkey=17320;
commit;
update customer set c_city='MOSCOW' where c_city='RUSSIA   8';
commit;
insert into LINEORDER values(5550000,1,17320,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(5550000,2,17320,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(5550000,3,17320,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(5550000,4,17320,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(5550000,5,17320,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
delete from LINEORDER where lo_orderkey=5550000 and lo_custkey=17320;
commit;
update customer set c_city='RUSSIA   8' where c_city='MOSCOW';
commit;
insert into LINEORDER values(2220000,1,19744,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(2220000,2,19744,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(2220000,3,19744,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(2220000,4,19744,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
insert into LINEORDER values(2220000,5,19744,57388,570,19980803,'4-NOT SPECI','0',3,4708830,21063791,4,4520476,80722,8,19981002,'AIR');
commit;
delete from LINEORDER where lo_orderkey=2220000 and lo_custkey=19744;
commit;
commit;
insert into LINEORDER values(4440000,1,19687,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(4440000,2,19687,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(4440000,3,19687,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(4440000,4,19687,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
insert into LINEORDER values(4440000,5,19687,57388,570,19980803,'3-MEDIUM','0',3,4708830,21063791,4,4520476,80722,8,19981002,'SHIP');
commit;
update customer set c_city='RUSSIA   8' where c_city='MOSCOW';
commit;
spool off
exit
!
