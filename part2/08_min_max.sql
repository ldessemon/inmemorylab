-- In-Memory Column Store query

Select max(lo_supplycost) most_expensive_bluk_order
  From LINEORDER
 Where lo_quantity > 52;

-- Check all of the IM session statistics  after we run the query
