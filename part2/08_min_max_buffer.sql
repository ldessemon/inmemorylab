-- Buffer Cache query with the column store disables via the parameter inmemory_query

SELECT /*+ NO_INMEMORY */
       max(lo_supplycost) most_expensive_bluk_order
  From LINEORDER
 Where lo_quantity > 52;
