-- In-Memory Column Store query

Select   /*+ parallel(2) */ p.p_name, sum(l.lo_revenue)
From     LINEORDER l, DATE_DIM d, PART p
Where    l.lo_orderdate = d.d_datekey
And      l.lo_partkey   = p.p_partkey
And      p.p_name       = 'hot lavender'
And      d.d_year = 1996
And      d.d_month = 'December'
Group by p.p_name; 
