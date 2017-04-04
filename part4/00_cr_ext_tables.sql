drop table etl_lo;

create table etl_lo parallel 2  as
(select /*+ parallel(2) */
   LO_ORDERKEY, LO_LINENUMBER, LO_CUSTKEY, LO_PARTKEY, LO_SUPPKEY, LO_ORDERDATE + 1 LO_ORDERDATE,
   LO_ORDERPRIORITY, LO_SHIPPRIORITY, LO_QUANTITY, LO_EXTENDEDPRICE, LO_ORDTOTALPRICE, LO_DISCOUNT, LO_REVENUE,
   LO_SUPPLYCOST, LO_TAX, LO_COMMITDATE+1 LO_COMMITDATE, LO_SHIPMODE 
from lineorder 
where lo_orderdate in
              (select *  from
                (select lo_orderdate from lineorder
                 group by lo_orderdate order by lo_orderdate desc
                 )
              where rownum <= 1
              )
      );

drop table etl_dd;

create table etl_dd as
              (select * from date_dim where d_datekey in
                      (select *  from
                              (select d_datekey from date_dim
                               group by d_datekey order by d_datekey desc)
                      where rownum <= 1)
);

update etl_dd  set d_datekey = d_datekey + 1;
commit;
select lo_orderdate, count(*) from etl_lo  group by lo_orderdate order by lo_orderdate desc;
