-- This query compares the actual size of the tables on disk to the size in the 
-- In-Memory Column Store, inorder to calculate the compression ratio
--
SELECT v.owner, v.segment_name,  
       v.bytes                   orig_size, 
       v.inmemory_size           in_mem_size, 
       ROUND(v.bytes / v.inmemory_size, 2) comp_ratio 
FROM   v$im_segments v
ORDER BY 4; 
