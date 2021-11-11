select table_name, tablespace_name, num_rows, last_analyzed 
from user_tables 
where table_name like '%SPEC%'
order by num_rows desc;

select * from servicespecification;
select * from serviceconfigref;

select * from user_constraints
where constraint_type = 'R'
and table_name like 'SERVICE%';

select * from service where name like '%TM%'; -- 43650013, 45150020
select * from serviceconfigurationversion where service in (43650013, 45150020);
select specification, count(*)
from service group by specification;

select * from service_char;
select * from servicespecification;
select * from serviceconsumer;
select * from serviceassignment;

select * from SERVICECONFIGURATIONITEM where configuration = 99225001;
select * from SERVICECONFIGITEM_CHAR;-- where charowner = 99225002;

select * from specification where entityid = 69150022;
select * from characteristicspecification;

select * from specification where entityid in(
14779357,
69150022,
5025486,
5026124,
5026906,
240600906,
233175073);


