-- In-Memory Column Store query

Select sum(lo_extendedprice * lo_discount) revenue
From   LINEORDER l, DATE_DIM d
Where  l.lo_orderdate = d.d_datekey
And    l.lo_discount between 2 and 3 
And    l.lo_quantity < 24
And    d.d_date='December 24, 1996';
