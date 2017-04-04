-- In-Memory Column Store query

Select lo_orderkey, lo_revenue  
From   LINEORDER 
Where  lo_revenue = (Select min(lo_revenue) 
                     From LINEORDER 
                     Where lo_supplycost = (Select max(lo_supplycost) 
                                            From  LINEORDER
                                            Where lo_quantity > 10)
                     And lo_shipmode LIKE 'TRUCK%'
                     And lo_discount between 2 and 5
                    );

-- Check the IM session statistics after executing the in-memory query
