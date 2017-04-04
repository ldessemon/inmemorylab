-- Buffer Cache query with the column store disables via a hint

SELECT /*+ NO_INMEMORY */ lo_orderkey, lo_revenue 
From LINEORDER 
Where  lo_revenue = (Select /*+ NO_INMEMORY */ min(lo_revenue)
                     From LINEORDER
                     Where lo_supplycost = (Select /*+ NO_INMEMORY */
                                              max(lo_supplycost) 
                                            From   LINEORDER 
                                            Where  lo_quantity > 10)
                     And lo_shipmode LIKE 'TRUCK%'
                     And    lo_discount between 2 and 5
                    );
