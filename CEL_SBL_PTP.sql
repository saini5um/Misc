alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select row_id, created, e.* from s_evt_act e
where e.created > '30-Sep-2016';

select * from user_tables where table_name like 'S%SRV%';

select * from s_srv_req_x where row_id = '1-15JF8LB1';

select row_id, created, sr_num, r.ASSET_ID, r.BILLACCT_ID, r.CST_OU_ID, r.CST_CON_ID, sr_type_cd, r.RESOLUTION_CD, r.ROOT_CAUSE_CD, 
r.SOURCE_TYP_CD, sr_area, sr_category_cd, r.SR_CAT_TYPE_CD, r.SR_SUB_AREA, r.SR_SUBTYPE_CD, r.SR_STAT_ID, r.SR_SUB_STAT_ID,
r.DESC_TEXT from s_srv_req r
where r.created > '29-Sep-2016'
and r.SR_CAT_TYPE_CD = 'Customer Request'
and sr_area = 'Promise To Pay'
and cst_ou_id = '1-8WG6-977';

select name from s_org_ext where row_id = '1-8WG6-977';

select o.row_id, o.created, t.name, o.ORDER_CAT_CD, o.X_ORDER_SUB_TYPE, o.STATUS_CD 
from s_order o, s_order_type t
where o.ACCNT_ID = '1-8WG6-977'
and o.ORDER_TYPE_ID = t.ROW_ID
order by o.created desc;

select ROOT_ASSET_ID 
from s_asset where SERIAL_NUM = '0132595420'
and status_cd = 'Active';

select p.name, p.part_num, a.serial_num, a.row_id, a.START_DT, a.END_DT, a.STATUS_CD
from s_asset a, s_prod_int p
where a.prod_id = p.row_id
and a.root_asset_id = '1-65LG-1605'
and a.status_cd = 'Active';

