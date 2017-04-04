-- Buffer Cache query with the column store disables via INMEMORY_QUERY parameter 

select /*+ NO_INMEMORY */ max(lo_ordtotalprice) most_expensive_order from LINEORDER;
