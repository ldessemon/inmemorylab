-- In-Memory Column Store query

Select  lo_orderkey, lo_custkey, lo_revenue
From    LINEORDER
Where   lo_orderkey = 5000000;
