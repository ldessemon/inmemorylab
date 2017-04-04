SELECT v.owner, v.segment_name name, v.populate_status status
FROM   v$im_segments v;
