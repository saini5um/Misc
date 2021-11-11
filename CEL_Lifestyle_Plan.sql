alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select row_id, PART_NUM, created, name, type, PROD_TYPE_CD, BILLING_TYPE_CD, PROD_CD, PROD_CATG_CD 
from s_prod_int where upper(name) like '%LIFESTYLE%';

select * from s_prod_int where prod_catg_cd = 'Lifestyle';

-- Orders with Lifestyle Plan
select o.created + 8/24, o.order_num, i.PROD_ID, o.x_order_sub_type, o.x_source, i.STATUS_CD
from s_order o, s_order_item i
where o.created > to_date('01-July-2018', 'dd-Mon-YYYY') - 8/24
and o.created < to_date('01-Aug-2018', 'dd-Mon-YYYY') - 8/24
and o.row_id = i.ORDER_ID
and o.X_ORDER_SUB_TYPE in ('New Registration', 'Port In', 'Change Rate Plan')
and i.action_cd = 'Add'
and o.STATUS_CD = 'Complete'
and i.prod_id in ('1-2CGKCTF','1-2CGKCTR','1-2CGKCU3');

select o.X_ORDER_SUB_TYPE, count(*) --o.created + 8/24, o.order_num, i.PROD_ID, o.x_order_sub_type, o.x_source, i.STATUS_CD
from s_order o, s_order_item i
where o.created > to_date('01-Nov-2018', 'dd-Mon-YYYY') - 8/24
and o.created < to_date('01-Dec-2018', 'dd-Mon-YYYY') - 8/24
and o.row_id = i.ORDER_ID
and o.X_ORDER_SUB_TYPE in ('New Registration', 'Port In', 'Change Rate Plan')
and i.action_cd = 'Add'
and o.STATUS_CD = 'Complete'
and i.prod_id in ('1-2CGKCTF','1-2CGKCTR','1-2CGKCU3')
group by o.X_ORDER_SUB_TYPE;

select row_id, created, last_upd, PROD_ID, START_DT, END_DT, STATUS_CD, X_SERV_MOD_DATE, X_SUB_STATUS_CD 
from s_asset where SERIAL_NUM in ('0135008478', '01123693949') and STATUS_CD = 'Active';

select row_id, ROOT_ASSET_ID, PROMOTION_ID, PROM_ITEM_ID, PROD_ID 
from s_asset where last_upd > '01-Jan-2018'
and prod_id in ('1-2CGKCTF','1-2CGKCTR','1-2CGKCU3') and status_cd = 'Active';

-- MSISDN and customer with Given Plan
select s.CREATED, s.row_id, s.STATUS_CD, s.SERIAL_NUM, e.name, e.LOC, e.X_CUST_ID_TYPE
from s_asset s, s_asset a, s_org_ext e
where s.row_id = a.root_asset_id
and a.last_upd > '01-Jan-2018'
and a.prod_id in ('1-2CGKCTF','1-2CGKCTR','1-2CGKCU3') 
and a.status_cd = 'Active'
and s.status_cd = 'Active'
and a.OWNER_ACCNT_ID = e.ROW_ID;

select * from all_ind_columns
where table_owner = 'SIEBEL'
and table_name = 'S_ASSET'
order by index_name, column_position;

select * from all_tables where owner = 'SIEBEL' and TABLE_NAME like '%OCS%';

select * from cel_ocs_data;

select i.* from s_order o, s_order_item i
where o.row_id = i.order_id;