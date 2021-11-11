select * from all_tables where owner like 'FLAG%' and table_name like 'COS%ORD%'
and num_rows > 0;

select * from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST
where sbl_order_id = '1-1KDO2QZ1';

select sbl_status, count(*) --UPDATED_BY, count(*) 
from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST
where order_status = 'IN PROGRESS'
group by sbl_status;
--order by order_date;

select * --sbl_status,  --UPDATED_BY, count(*) 
from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST
where order_status = 'IN PROGRESS'
and sbl_status = 'Pending' --is null
and SBL_CONSIGNMENT_NUM = 'MNP' --is null
--group by ordertype;
order by order_date desc;

select ordertype, min(order_date), max(order_date), count(*) --sbl_status,  --UPDATED_BY, count(*) 
from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST
where order_status = 'IN PROGRESS'
and sbl_status is null --= 'Pending' --is null
and SBL_CONSIGNMENT_NUM is null --= 'Pending' --is null
and ORDERTYPE = 'MNP'
group by ordertype;

select * from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST
where sbl_order_number in ('1-92070252640', '1-72443516911', '1-73464272467', '1-99970437686');

update FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST set sbl_status = 'Pending', SBL_CONSIGNMENT_NUM = 'Pending'
where order_status = 'IN PROGRESS'
and sbl_status is null;

update FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST 
set sbl_status = 'Pending', SBL_CONSIGNMENT_NUM = ordertype, ordertype = null
where order_status = 'IN PROGRESS'
and sbl_status is null and ordertype = 'MNP';

select order_status, count(*) 
from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST
group by order_status;

select count(*) from FLAGSHIPSTOREPROD_PROD.COS_ORDER_MST where SBL_CONSIGNMENT_NUM = 'Pending';