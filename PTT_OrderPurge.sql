alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select * from om_order_header order by 1;
select * from om_order_header order by 1 desc;

select * from om_order_header where ord_state_id < 7;

-- Total Orders
select trunc(ord_creation_date) dt, count(*) total
from om_order_header
group by trunc(ord_creation_date)
order by 1;

-- Order Stats
select trunc(ord_creation_date) dt, sum(case when ord_state_id = 7 then 1 else 0 end) completed,
sum(case when ord_state_id = 1 then 1 else 0 end) notstarted, sum(case when ord_state_id = 4 then 1 else 0 end) progress, 
sum(case when ord_state_id = 3 then 1 else 0 end) cancel,
sum(case when ord_state_id > 7 then 1 else 0 end) failed, count(*) total
from om_order_header
group by trunc(ord_creation_date)
order by 1;

select * from om_order_id_for_purge;

select * from om_audit_purge_all;

select * from om_audit_purge_latest;

select * from om_purged_orders;

select * from user_tables where table_name like '%STATE%';

select * from om_task_state;
