-- Display the list of IM session statstics 

SELECT display_name 
FROM   v$statname 
WHERE  display_name LIKE 'IM%';
