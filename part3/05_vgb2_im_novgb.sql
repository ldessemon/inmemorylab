-- In-Memory Column Store query WITHOUT vector group by


SELECT /*+ NO_VECTOR_TRANSFORM parallel(2)  */ 
           d.d_year, c.c_nation, sum(lo_revenue - lo_supplycost) profit
           From      LINEORDER l, DATE_DIM d, PART p, SUPPLIER s, CUSTOMER C
           Where    l.lo_orderdate = d.d_datekey
           And        l.lo_partkey       = p.p_partkey
           And        l.lo_suppkey      = s.s_suppkey
           And        l.lo_custkey        = c.c_custkey
           And        s.s_region            = 'AMERICA'
           Group by d.d_year, c.c_nation
           Order by d.d_year, c.c_nation;


-- Compare the elapsed time for the query with and without vector group by 
