select * from user_objects;

select object_type, count(*) 
from user_objects
group by object_type;

select constraint_type, count(*) 
from user_constraints
group by constraint_type;

select * from user_tables where table_name like '%PRTY%';

select * from dwr_prty;

select * from user_constraints where table_name = 'DWR_PRTY'
and constraint_type = 'R';
