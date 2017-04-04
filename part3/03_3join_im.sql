-- In-Memory Column Store query

Select   /*+ parallel(2)*/ d.d_year, p.p_brand1, sum(lo_revenue) rev 
From     lineorder l, 
         date_dim d, 
         part p, 
         supplier s 
Where    l.lo_orderdate = d.d_datekey
And      l.lo_partkey   = p.p_partkey
And      l.lo_suppkey   = s.s_suppkey
And      p.p_category     = 'MFGR#12'
And      s.s_region     = 'AMERICA' 
AND      d.d_year     = 1997 
Group by d.d_year, p.p_brand1; 
