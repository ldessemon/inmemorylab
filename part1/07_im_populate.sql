SELECT /*+ full(d) */ count(*) FROM date_dim d; 
SELECT /*+ full(s) */ count(*) FROM supplier s; 
SELECT /*+ full(p) */ count(*) FROM part p; 
SELECT /*+ full(c) */ count(*) FROM customer c; 
SELECT /*+ full(lo) */ count(*) FROM lineorder lo; 
