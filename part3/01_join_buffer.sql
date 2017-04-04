-- Buffer Cache query with the column store disables via the inmemory_query parameter

SELECT /*+ NO_INMEMORY */
       SUM(lo_extendedprice * lo_discount) revenue 
FROM   lineorder l, 
       date_dim d 
WHERE  l.lo_orderdate = d.d_datekey 
AND    l.lo_discount BETWEEN 2 AND 3 
AND    l.lo_quantity < 24 
AND    d.d_date='December 24, 1996'; 
 
-- Compare the elapsed time of the in-memory query to the buffer cache query
