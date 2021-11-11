alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'DD-Mon-YYYY HH24:MI:SS';

select t.name, o.X_ORDER_SUB_TYPE, o.created + 8/24, o.row_id, o.ORDER_NUM, o.X_SOURCE, o.X_SOURCE_NUM, o.X_DNO, o.STATUS_CD, 
o.EAI_ERROR_TEXT, o.EAI_EXPRT_STAT_CD
from s_order o, S_ORDER_TYPE t
where o.ORDER_TYPE_ID = t.ROW_ID
and o.created > to_date('9-Mar-2017 09:00:00', 'dd-Mon-YYYY HH24:MI:SS') - 8/24
and t.name = 'New Install'
and x_order_sub_type = 'Port In'
and o.x_source like 'Flag%'
order by o.created;

select p.name, p.part_num, i.X_MATERIAL_CD, i.SERVICE_NUM, e.name, i.STATUS_CD, i.X_CONSIGNMENT_NUM, i.CREATED+8/24,i.LAST_UPD + 8/24, i.STATUS_DT + 8/24
from s_order o, s_order_item i, s_prod_int p, s_org_ext e
where o.row_id = i.ORDER_ID
and i.PROD_ID = p.row_id
and o.ACCNT_ID = e.ROW_ID
and o.order_num = '1-97197968500'; --1-97033559330 1-97027831261

select a.created + 8/24, a.LAST_UPD + 8/24, a.TODO_CD, a.name, a.EVT_STAT_CD 
from s_evt_act a, s_order o
where o.row_id = a.ORDER_ID
and o.ORDER_NUM = '1-97020169203';

select * from SIEBEL.CX_CEL_MNP_DATA
where x_par_order_id = '1-18KR9XK2';

select * from SIEBEL.CX_CEL_MNP_ACT;

desc siebel.cx_subsidy;
select p.name, cx.row_id, x_subsidy_amt,cx.X_OUTLET_TYPE from siebel.cx_subsidy cx, s_prod_int p where
cx.X_SUB_PROD_ID=p.row_id
and p.part_num='MDR4710'
and cx.X_ANY_PLAN_FLG='N'
and X_STATUS='Active';

update siebel.cx_subsidy set X_SUBSIDY_AMT='188.68'
where row_id='1-1873EMGB';