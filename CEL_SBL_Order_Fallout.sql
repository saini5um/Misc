alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select o.row_id, o.created + 8/24, o.last_upd + 8/24, t.NAME, order_num, X_ORDER_SUB_TYPE, X_SOURCE, STATUS_CD, 
FULFLMNT_STATUS_CD, comments, EAI_ERROR_TEXT 
from s_order o, s_order_type t 
where o.created > '04-Oct-2017'
and o.created < '05-Oct-2017'
and o.ORDER_TYPE_ID = t.row_id
and t.name = 'Modify'
and o.FULFLMNT_STATUS_CD = 'Failed'
and o.X_ORDER_SUB_TYPE = 'Change Rate Plan';

select to_char(o.created + 8/24, 'dd-Mon-YYYY'), STATUS_CD, FULFLMNT_STATUS_CD, count(*) 
from s_order o, s_order_type t 
where o.created >= to_date('01-Dec-2017', 'dd-Mon-YYYY') - 8/24
and o.created < to_date('31-Dec-2017', 'dd-Mon-YYYY') - 8/24
and o.ORDER_TYPE_ID = t.row_id
and t.name = 'Modify'
and o.X_ORDER_SUB_TYPE = 'Change Rate Plan'
and status_cd not in ('Pending', 'Open', 'Rejected', 'Pending Payment', 'Failed')
group by to_char(o.created + 8/24, 'dd-Mon-YYYY'), STATUS_CD, FULFLMNT_STATUS_CD;

select sr_num, SR_TYPE_CD, sr_area, sr_cat_Type_cd, sr_Sub_area, s.PR_SYMPTOM_CD, desc_text, s.* 
from s_srv_req s
where SR_CAT_TYPE_CD = 'Order Failure'
and created > '04-Oct-2017'
and created < '05-Oct-2017'
and sr_sub_area is not null;

select p.name, i.SERVICE_NUM, i.ACTION_CD, i.* from s_order o, s_order_item i, s_prod_int p
where o.row_id = i.ORDER_ID
and o.ORDER_NUM = '1-103245919293'
and i.prod_id = p.ROW_ID;
Sales Order:1-103245919293 # 1 for Account MUHAMAD ZIA BIN UMER failed at 2017-10-04T05:14:52Z