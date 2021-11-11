alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select a.serial_num, p.name, a.created, a.OWNER_ACCNT_ID, a.SERV_ACCT_ID, a.BILL_ACCNT_ID, a.BILL_PROFILE_ID
from s_asset a, s_prod_int p
where serial_num = '0132540380'
and a.status_cd = 'Active'
and a.prod_id = p.row_id;

select order_num, created + 8/24, X_ORDER_SUB_TYPE, STATUS_CD from s_order where ACCNT_ID = '1-14AJL800' order by created;

1-98822487576 7:10PM Promo Max Up Internet 2GB
1-98822405670 7:14PM Promo Max Up Internet 2GB

select i.service_num, p.name, i.ACTION_CD, i.created, p.type, p.PROD_CATG_CD, p.BILLING_TYPE_CD,
i.STATUS_CD, i.FULFLMNT_STATUS_CD, o.x_order_sub_type, p.part_num, i.X_MATERIAL_CD, i.PAR_ORDER_ITEM_ID, i.ASSET_INTEG_ID, 
o.X_SOURCE, o.X_SOURCE_NUM
from s_order o, s_order_item i, s_prod_int p
where o.row_id = i.order_id
and o.order_num = '1-98822487576' --'1-98822487576' -- '1-98822405670' 
and i.prod_id = p.row_id
--and (p.billing_type_cd = 'MainPlan' or p.prod_catg_cd = 'IR')
order by action_cd, created;
