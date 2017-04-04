--  Execute the query against the buffer cache

Select  /*+ NO_INMEMORY */ lo_orderkey, lo_custkey, lo_revenue
From    LINEORDER
Where    lo_custkey = 5641 
And      lo_shipmode = 'XXX AIR'
And      lo_orderpriority = '5-LOW';
