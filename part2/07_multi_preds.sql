-- In-Memory Column Store query

Select  lo_orderkey, lo_custkey, lo_revenue
From    LINEORDER
Where    lo_custkey = 5641 
And      lo_shipmode = 'XXX AIR'
And      lo_orderpriority = '5-LOW';

-- Check the IM session statistics after the query 
