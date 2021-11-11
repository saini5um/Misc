alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select o.x_order_sub_type, o.x_source, o.created + 8/24, p.name, i.action_cd, t.name, o.ORDER_NUM
from s_order o, s_order_type t, s_order_item i, s_prod_int p
where o.created > to_date('25-Apr-2017', 'dd-Mon-YYYY') - 8/24
and o.created < to_date('26-Apr-2017', 'dd-Mon-YYYY') - 8/24
and o.ORDER_TYPE_ID = t.row_id
and t.name = 'Modify'
and o.x_order_sub_type = 'Change Rate Plan'
and o.row_id = i.order_id
and i.prod_id = p.row_id
and i.prod_id = '1-GBUS2L';
and x_source = 'Contact Centre';

select i.service_num, p.name, i.ACTION_CD, i.created, p.type, p.PROD_CATG_CD, p.BILLING_TYPE_CD,
i.STATUS_CD, i.FULFLMNT_STATUS_CD, o.x_order_sub_type, p.part_num, i.X_MATERIAL_CD, i.PAR_ORDER_ITEM_ID, i.ASSET_INTEG_ID, 
o.X_SOURCE, o.X_SOURCE_NUM
from s_order o, s_order_item i, s_prod_int p
where o.row_id = i.order_id
and o.order_num = '1-98734405714' 
and i.prod_id = p.row_id
and (p.billing_type_cd = 'MainPlan' or p.prod_catg_cd = 'IR')
order by action_cd, created;

select row_id, created, name, PART_NUM from s_prod_int where upper(name) like '%ROAM%';


