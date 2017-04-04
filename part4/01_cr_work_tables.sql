drop table tmp;
 
create table tmp (step_num number,
query_num timestamp,
result number);

-- This script creates the results table for our DML testing

drop table lesson4_results purge;

create table lesson4_results(
step_num number,
query_num number,
result number);
