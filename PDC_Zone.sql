alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select * from user_tables where table_name like '%ZONE%';

select * from zonemap_data_raw_t;
select * from v$instance;

select sys_descr, eb.amount, e.* 
from item_t partition (P_R_03012019) i, event_t partition (P_R_03012019) e, 
purchased_product_t pp,product_t p, event_bal_impacts_t PARTITION (P_R_03012019) eb
where e.poid_id0=eb.obj_id0
and EB.OFFERING_OBJ_ID0=pp.poid_id0
and PP.product_OBJ_ID0=P.POID_ID0
and eb.resource_id=702
and e.ITEM_OBJ_ID0=i.poid_id0 
and i.account_obj_id0=105021630497;

select sys_descr, eb.amount, e.* 
from event_t PARTITION (P_R_03012019) e, purchased_product_t pp,product_t p, 
event_bal_impacts_t PARTITION (P_R_03012019) eb
where e.poid_id0=eb.obj_id0
and EB.OFFERING_OBJ_ID0=pp.poid_id0
and PP.product_OBJ_ID0=P.POID_ID0
and eb.resource_id=702
--and e.ITEM_OBJ_ID0=i.poid_id0 
and e.account_obj_id0=105021630497;

select sys_descr, eb.amount, unix2date(e.earned_start_t), unix2date(e.earned_end_t), e.* 
from event_t PARTITION (P_R_03012019) e, event_bal_impacts_t PARTITION (P_R_03012019) eb
where e.poid_id0=eb.obj_id0
and eb.resource_id=702
--and e.ITEM_OBJ_ID0=i.poid_id0 
and e.account_obj_id0=105021630497;

select e.sys_descr, e.poid_type, i.bill_obj_id0, sum(amount) a
--sys_descr, eb.amount, e.poid_type, e.item_obj_type, unix2date(start_t), e.* 
from event_t e, event_bal_impacts_t eb, item_t i
where e.poid_id0=eb.obj_id0
and eb.resource_id=702
and (e.poid_type like '/event/billing/%' or e.poid_type like '/event/delayed/%')
and e.ITEM_OBJ_ID0=i.poid_id0 
and e.account_obj_id0=105021630497 --105021630497
and i.bill_obj_id0 in (
select max(b.poid_id0) 
from bill_t b, invoice_t i
where b.account_obj_id0 = 105021630497--105021630497 --105002495987
and i.bill_obj_id0 = b.poid_id0
and i.poid_type = '/invoice'
)
group by e.sys_descr, e.poid_type, i.bill_obj_id0;

select i.poid_type, b.* 
from bill_t b, invoice_t i
where b.account_obj_id0 = 105002495987
and i.bill_obj_id0 = b.poid_id0
and i.poid_type = '/invoice'
order by b.created_t desc;

select count(*) --i.poid_type, b.* 
from bill_t b, invoice_t i -- 213044
where i.bill_obj_id0 = b.poid_id0
and i.poid_type = '/invoice'
and b.account_obj_id0 = i.account_obj_id0
order by b.created_t desc;

select count(*) from invoice_t where poid_type = '/invoice'; -- 213044

select * from invoice_t where account_obj_id0 = 105021630497;
select poid_type, count(*) from invoice_t group by poid_type;-- where bill_obj_id0 = 105023384716;
select * from invoice_t where poid_type = '/invoice';
select * from bill_t where account_obj_id0 = 105021630497;

select * from item_t;

select * from all_tables 
where owner = 'PDC' 
and table_name like '%RUM%'
and num_rows > 0
order by table_name; --table_name like '%ZONE%'

select * from pdc.CSSPEC_RUMNAMES order by 1;

select * from pdc.azonemodel where entityid in (120011,120429); -- models name 120429=LW_Voice_Zone_Model
select * from pdc.ZONERESULTCONFIGURATION where name = 'LOCAL';-- where entityid = 5706760;
3192006
5706760;

select * from pdc.zonemodelrpe where zonemodelid = 120429;
select * from pdc.ZONEMODELRPEBRANCH
where zonemodelrpe in (select entityid from pdc.zonemodelrpe where zonemodelid = 120429);
select * from pdc.standardzoneitem
where originprefix = '65' and destprefix = '65';
--120011
--120429
select * from pdc.standardzonemodel;
select * from pdc.geozonemodel;
