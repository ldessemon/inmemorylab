set pages 9999
set lines 150
--
col no_dml     format 0.999;
col bulk_dml   format 0.999;
col single_dml format 0.999;
--
Select s1.result as no_dml, s2.result as bulk_dml, s3.result as single_dml 
From   (select result, query_num from lesson4_results where step_num=2) s1, 
       (select result, query_num from lesson4_results where step_num=3) s2,
       (select result, query_num from lesson4_results where step_num=4) s3
Where  s1.query_num=s2.query_num
AND    s1.query_num=s3.query_num;
