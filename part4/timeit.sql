set serveroutput on;
declare
  l_begtime timestamp(6);
  l_endtime timestamp(6);
  l_total   number;
  i         PLS_INTEGER;
  l_pid     number := &1;
  --
  TYPE timing_typ IS TABLE OF NUMBER
    INDEX BY PLS_INTEGER;
  sql_timing timing_typ;
  i_time    PLS_INTEGER := 1;
  --
  procedure timeit(
    sql_stmt varchar2)
  is
  begin
    l_begtime := SYSTIMESTAMP;
    --
    execute immediate sql_stmt into l_total;
    -- 
    l_endtime := SYSTIMESTAMP;
    --
    sql_timing(i_time) := to_number( EXTRACT (SECOND FROM ( l_endtime - l_begtime ) ) );
    i_time := i_time + 1;
  end;
begin
  --
  -- QUERY 0 
  --
  timeit('Select max(lo_ordtotalprice) most_expensive_order From LINEORDER where lo_commitdate=19960520');
  timeit('Select max(lo_ordtotalprice) most_expensive_order From LINEORDER where lo_commitdate=19950520');
  timeit('Select max(lo_ordtotalprice) most_expensive_order from LINEORDER where lo_commitdate=19940520');
  timeit('Select max(lo_ordtotalprice) most_expensive_order From LINEORDER where lo_commitdate=19930520');
  timeit('Select max(lo_ordtotalprice) most_expensive_order From LINEORDER where lo_commitdate=19920520');
  --
  -- QUERY TYPE 1
  --
  timeit('Select max(lo_custkey) From LINEORDER Where lo_orderkey = 5000000');
  timeit('Select max(lo_custkey) From LINEORDER Where lo_orderkey = 500000');
  timeit('Select max(lo_custkey) From LINEORDER Where lo_orderkey = 50000');
  timeit('Select max(lo_custkey) From LINEORDER Where lo_orderkey = 5000');
  timeit('Select max(lo_custkey) From LINEORDER Where lo_orderkey = 500');
  --
  -- QUERY TYPE 2
  --
  timeit('Select sum(lo_quantity) from LINEORDER where lo_orderkey = 1');
  timeit('Select sum(lo_quantity) from LINEORDER where lo_orderkey = 10');
  timeit('Select sum(lo_quantity) from LINEORDER where lo_orderkey = 100');
  timeit('Select sum(lo_quantity) from LINEORDER where lo_orderkey = 1000');
  timeit('Select sum(lo_quantity) from LINEORDER where lo_orderkey = 10000');
  --
  -- QUERY TYPE 3
  --
  timeit('select sum(lo_quantity) from LINEORDER');
  timeit('select count(*) from ( select sum(lo_quantity), sum(lo_discount) from LINEORDER)');
  timeit('select count(*) from ( select /*+ parallel(2) */ sum(lo_quantity), sum(lo_discount), sum(lo_tax) from LINEORDER)');
  timeit('select count(*) from ( select /*+ parallel(2) */ sum(lo_quantity), sum(lo_discount), sum(lo_tax), sum(lo_revenue) from LINEORDER)');
  timeit('select count(*) from ( select /*+ parallel(2) */ sum(lo_quantity), sum(lo_discount), sum(lo_tax), sum(lo_revenue), sum(lo_supplycost) from LINEORDER)');
  --
  -- QUERY TYPE 4
  --
  timeit('select sum(lo_quantity) from LINEORDER where lo_orderdate=19930527');
  timeit('select count(*) from ( select sum(lo_quantity), sum(lo_discount) from LINEORDER where lo_orderdate=19930527)');
  timeit('select count(*) from ( select sum(lo_quantity), sum(lo_discount), sum(lo_tax) from LINEORDER where lo_orderdate=19930527)');
  timeit('select count(*) from ( select /*+ parallel(2) */ sum(lo_quantity), sum(lo_discount), sum(lo_tax), sum(lo_revenue) from LINEORDER where lo_orderdate=19930527)');
  timeit('select count(*) from ( select /*+ parallel(2) */ sum(lo_quantity), sum(lo_discount), sum(lo_tax), sum(lo_revenue), sum(lo_supplycost) from LINEORDER where lo_orderdate=19930527)');
  --
  -- QUERY TYPE 5
  --
  timeit('Select /*+ parallel(2) */ sum(lo_extendedprice * lo_discount) revenue From LINEORDER l, DATE_DIM d
    Where l.lo_orderdate = d.d_datekey And l.lo_discount between 2 and 3 And l.lo_quantity < 24
    And d.d_year = 1996');
  timeit('Select /*+ parallel(2) */ sum(lo_extendedprice * lo_discount) revenue From LINEORDER l, DATE_DIM d
    Where l.lo_orderdate = d.d_datekey And l.lo_discount between 5 and 7 And l.lo_quantity < 26
    And d.d_weeknuminyear = 6 And d.d_year = 1994');
  timeit('Select /*+ parallel(2) */ sum(lo_extendedprice * lo_discount) revenue From LINEORDER l, DATE_DIM d
    Where l.lo_orderdate = d.d_datekey And l.lo_discount between 2 and 3 And l.lo_quantity < 24
    And d.d_yearmonthnum = 199401 And d.d_year = 1996');
  --
  -- QUERY TYPE 6
  --
  timeit('select count(*) from ( Select /*+ parallel(2) */ /*+ parallel(2) */ p.p_name, sum(l.lo_revenue) From LINEORDER l, DATE_DIM d, PART p
    Where l.lo_orderdate = d.d_datekey And l.lo_partkey = p.p_partkey And p.p_name = ''baby blue''
    And d.d_year = 1996 group by p.p_name )'); 
  timeit('select count(*) from ( Select /*+ parallel(2) */ p.p_name, sum(l.lo_revenue) From LINEORDER l, DATE_DIM d, PART p
    Where l.lo_orderdate = d.d_datekey And l.lo_partkey = p.p_partkey And p.p_name = ''bright pink''
    And d.d_year = 1994 Group by p.p_name )'); 
  timeit('select count(*) from ( Select /*+ parallel(2) */ p.p_name, sum(l.lo_revenue) From LINEORDER l, DATE_DIM d, PART p
    Where l.lo_orderdate = d.d_datekey And l.lo_partkey = p.p_partkey And p.p_name = ''hot lavender''
    And d.d_year = 1998 Group by p.p_name )'); 
  --
  -- QUERY TYPE 7
  --
  timeit('select count(*) from ( Select /*+ parallel(2) */ d.d_year, p.p_brand1, sum(lo_revenue) rev
    From LINEORDER l, DATE_DIM d, PART p, SUPPLIER s Where l.lo_orderdate = d.d_datekey
    And l.lo_partkey = p.p_partkey And l.lo_suppkey = s.s_suppkey And s.s_region = ''AMERICA'' 
    Group by d.d_year, p.p_brand1 )'); 
  --
  -- List out the timings for each query
  --
  for i in sql_timing.FIRST .. sql_timing.LAST loop
    dbms_output.put_line('Elapsed time: ' || sql_timing(i));
  end loop;
  --
  -- Insert timings into tmp table
  --
  forall i in sql_timing.FIRST .. sql_timing.LAST
    insert into tmp values(l_pid, systimestamp, sql_timing(i));
  commit;
  --
  -- Insert results
  --
  insert into lesson4_results select step_num, rownum, result from tmp order by query_num;
  commit;
  execute immediate 'truncate table tmp';
end;
/
