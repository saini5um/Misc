select /*+ INDEX ( S_SRV_REQ S_SRV_REQ_M53 ) */ s.row_id, sr_num, s.created, act_open_dt, act_close_dt, billacct_id, 
SOURCE_TYP_CD, ROOT_CAUSE_CD, resolution_cd, sr_area,
SR_CAT_TYPE_CD, SR_CATEGORY_CD, sr_stat_id, sr_sub_stat_id, sr_sub_area, sr_type_cd, CST_OU_ID, e.name, e.ACCNT_TYPE_CD, e.PR_BILL_PRFL_ID
From s_srv_req s, S_ORG_EXT e, s_inv_prof i
where act_open_dt > '01-Jan-2016'
and sr_area = 'Customer Profile'
--and sr_sub_area = 'Update Customer Account'
and s.CST_OU_ID = e.par_ou_id
and e.ACCNT_TYPE_CD = 'Billing'
and e.row_id = i.ACCNT_ID
and i.PAYMENT_TYPE_CD = 'Prepaid';

select master_ou_id, name, ACCNT_TYPE_CD, loc, ou_num, PAR_OU_ID,row_id from s_org_ext where name = 'MOHAMMAD RIZUAN BIN MAHAT';

select * from S_LST_OF_VAL where name like '%SR_AREA%';

select * from S_LST_OF_VAL_BU;

select 
1-ZQEHBQK
1-ZR1FKJE
1-ZR1H41V
1-ZTJ9MKB

select * from s_inv_prof where ACCNT_ID = '1-BI7-2925';

select * from s_srv_req_xm;

select * from user_ind_columns
where table_name = 'S_SRV_REQ'
and column_name like '%DT';

select * from user_ind_columns
where table_name = 'S_SRV_REQ'
and index_name = 'S_SRV_REQ_M53';

select t.name, o.X_ORDER_SUB_TYPE, p.name, i.action_cd, p.PAYMNT_TYPE_CD, o.* 
from s_order o, s_order_type t, s_order_item i, s_prod_int p
where o.order_type_id = t.row_id
and o.created > '01-Mar-2016'
and t.name = 'Modify'
and x_order_sub_type = 'Change Rate Plan'
and o.row_id = i.order_id
and i.PROD_ID = p.row_id
and ;

select ord.order_num, (to_timestamp(to_char(ord.created,'dd-mon-yyyy hh24:mi:ss'),'dd-mon-yyyy hh24:mi:ss') +8/24) as order_date, 
ord.x_order_sub_type, ord.status_cd, ord.x_source_num, otm.service_num,otm.action_cd, prd.name as product_name, prd.part_num,
prdprom.name as prom_name, prdprom.paymnt_type_cd--, ast.status_cd, ast.x_sub_status_cd
from s_order ord, s_order_item otm, s_prod_int prd, s_prod_int prdprom--, s_asset ast
where
ord.x_order_sub_type = 'Change Rate Plan' and
ord.status_cd = 'Complete' and
otm.order_id = ord.row_id and
otm.action_cd not in ('Update') and
--ast.integration_id = otm.asset_integ_id and
prdprom.row_id = otm.promotion_id and
prd.row_id = otm.prod_id and
prd.type = 'Service' and
prd.x_validation_fld is null and
ord.created >= to_date('1-MAR-2016 16:00:00','dd-mon-yyyy hh24:mi:ss');
order by ord.order_num;


