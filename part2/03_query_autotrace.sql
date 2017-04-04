-- In-Memory Column Store query

Select  max(lo_ordtotalprice) most_expensive_order From LINEORDER;

-- Buffer Cache query with the column store disables via INMEMORY_QUERY parameter 

Select /*+ NO_INMEMORY */ max(lo_ordtotalprice) most_expensive_order From LINEORDER;