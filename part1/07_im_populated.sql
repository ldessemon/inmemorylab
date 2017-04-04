SELECT v.owner, v.segment_name name, 
       v.populate_status status, v.bytes_not_populated
FROM   v$im_segments v;
