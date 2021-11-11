alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select * from om_parameter;

select * from user_tab_subpartitions
where table_name = 'OM_ORDER_HEADER'
order by partition_name, partition_position;

select * from user_tables
where table_name like 'OM%CART%';

select * from om_cartridge
where status = 'VALID';

select * from om_order_header order by 1 desc;

select ord_creation_date, ord_start_date, ord_completion_date, (ord_completion_date - ord_start_date)*24*60 
from om_order_header
where ord_state_id = 7
and ord_creation_date > sysdate - 7;

select avg((ord_completion_date - ord_start_date)*24*60) 
from om_order_header
where ord_state_id = 7
and cartridge_id = 1062 -- TOM 1066=SOM
and ord_creation_date > sysdate - 7;

select order_seq_id, ord_state_id, ord_creation_date, ord_start_date, ord_completion_date, sysdate - ord_start_date 
from om_order_header
order by 1 desc;

select * from om_state;
3	Cancelled
4	Progress
7	Completed
9	Failed?
10	Failed to start or Internal Error

select * from OM_STATE_CATEGORY;

select sysdate - 1 from dual;

select count(1) from om_order_header where ord_creation_date > sysdate - 1;