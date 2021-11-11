alter session set current_schema = siebel;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from s_org_ext;

select a.row_id, a.created, a.serial_num, p.name, o.name, o.loc, o.X_CUST_ID_TYPE
from s_asset a, s_prod_int p, s_org_ext o
where a.prod_id = p.row_id
and a.STATUS_CD = 'Inactive'
and a.SERIAL_NUM like '01%'
and a.OWNER_ACCNT_ID = o.row_id; -- 0104048894

alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
alter session set current_schema = siebel;

select t.name, o.created, o.x_order_sub_type, o.x_source, o.x_source_num, o.X_OUTLET_ID, length(x_outlet_id)
from siebel.s_order o, siebel.s_order_type t 
where o.order_type_id = t.row_id
order by created desc;

select * from s_org_ext
where prtnr_flg = 'Y';

accnt_type_cd, expertise_cd, ou_type_cd, prtnr_type_cd, region, x_name, 
