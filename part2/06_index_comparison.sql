set timing on;

-- Execute the In-Memory query as baseline

Select  /* Without index */ lo_orderkey, lo_custkey, lo_revenue
From    LINEORDER
Where   lo_orderkey = 5000000;

--  Enable the use of invisible indexes

alter session set optimizer_use_invisible_indexes=true;

-- Execute the query again include a new comment to ensure a hard parse

Select  /* With index */ lo_orderkey, lo_custkey, lo_revenue
From    LINEORDER
Where   lo_orderkey = 5000000;

-- Compare the Elasped time of the query In-Memory and in the index access 

alter session set optimizer_use_invisible_indexes=false;
