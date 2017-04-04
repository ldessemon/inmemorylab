-- Buffer Cache query with the column store disables via INMEMORY_QUERY parameter 

select /*+ NO_INMEMORY */
        lo_orderkey, lo_custkey, lo_revenue
from    LINEORDER
where   lo_orderkey = 5000000;

-- Compare the Elapsed time of the query In-Memory and in the buffer cache
