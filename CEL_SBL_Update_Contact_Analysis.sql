alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select o.row_id, t.name, o.created + 8/24, o.ORDER_NUM, o.X_ORDER_SUB_TYPE, o.X_SOURCE_NUM sap_so, o.STATUS_CD, o.X_SOURCE
from siebel.s_order o, siebel.s_order_type t
where o.created >= to_date('01-Apr-2017', 'dd-Mon-YYYY') - 8/24
and o.created < to_date('10-Apr-2017', 'dd-Mon-YYYY') - 8/24
and o.order_type_id = t.row_id
and o.X_ORDER_SUB_TYPE in ('New Registration')
and o.X_SOURCE = 'Flagship Store';

select t.name, 'Nov 2016', o.X_ORDER_SUB_TYPE, count(*)
from siebel.s_order o, siebel.s_order_type t
where o.created >= to_date('01-Nov-2016', 'dd-Mon-YYYY') - 8/24
and o.created < to_date('01-Dec-2016', 'dd-Mon-YYYY') - 8/24
and o.order_type_id = t.row_id
--and o.X_ORDER_SUB_TYPE in ('Port In', 'New Registration')
and o.X_SOURCE = 'Flagship Store'
group by t.name, 'Nov 2016', o.X_ORDER_SUB_TYPE;

select * from ALL_TAB_COLUMNS where table_name = 'S_ORG_EXT' and COLUMN_NAME like '%TYP%';

select e.name, e.LOC, e.X_NATIONALITY, e.OU_TYPE_CD, e.created, e.X_CUST_ID, e.X_CUST_ID_TYPE, e.X_CUST_TYPE, p.name, a.SERIAL_NUM
from s_org_ext e, s_asset a, s_prod_int p
where accnt_type_cd = 'Customer'
and e.row_id = a.OWNER_ACCNT_ID
and a.STATUS_CD = 'Active'
and a.SERIAL_NUM like '0%'
and e.name like 'MOHAMED%'
and a.PROD_ID = p.row_id;

select name, e.LOC, e.prtnr_flg, e.OU_NUM, e.OU_TYPE_CD, e.created, e.X_CUST_ID, e.X_CUST_ID_TYPE, e.X_CUST_TYPE, e.CUST_STAT_CD, e.ACCNT_TYPE_CD 
from s_org_ext e where name like 'PANKAJ%';

select count(1)
--name, row_id, e.LOC, e.OU_NUM, e.OU_TYPE_CD, e.created, e.X_CUST_ID, e.X_CUST_ID_TYPE, e.X_CUST_TYPE, e.CUST_STAT_CD, e.ACCNT_TYPE_CD 
from siebel.s_org_ext e 
where e.name like 'A%'
and e.X_CUST_ID_TYPE = 'Old NRIC'
and accnt_type_cd = 'Customer';

select * from all_ind_columns
where table_owner = 'SIEBEL'
and table_name = 'S_ORG_EXT'
--and column_name like '%NAME%'
order by index_name, column_position;

select s.created + 8/24, source_typ_cd, sr_type_cd, sr_area, sr_cat_Type_cd, sr_Sub_area, 
s.CST_CON_ID, s.CST_OU_ID, s.ROW_ID, e.OU_TYPE_CD, e.NAME, e.LOC, e.X_CUST_ID, e.X_CUST_ID_TYPE
from s_srv_req s, s_org_ext e
where s.created >= to_date('1-Sep-2017', 'dd-Mon-YYYY') - 8/24
and s.created < to_date('25-Sep-2017', 'dd-Mon-YYYY') - 8/24
and sr_cat_type_cd = 'Account Profile Management' and s.SOURCE_TYP_CD in ('BCO', 'Self Service', 'First', 'XPAX')
and sr_sub_area in ('Update Contact', 'Update Customer Account')
and s.CST_OU_ID = e.row_id;

select created + 8/24, source_typ_cd, sr_type_cd, sr_area, sr_cat_Type_cd, sr_Sub_area, 
s.CST_CON_ID, s.CST_OU_ID, s.ASSET_ID, s.BILLACCT_ID, s.*
from s_srv_req s
where created > to_date('1-May-2017', 'dd-Mon-YYYY') - 8/24
and created < to_date('1-Jun-2017', 'dd-Mon-YYYY') - 8/24
and source_typ_cd = 'Auto'
and sr_area <> 'Port Out Request';
  
select row_id, OU_TYPE_CD, PR_CON_ID, name, ou_num, loc from s_org_ext where row_id = '1-3PWU-1911';

select * from s_contact where row_id in ('1-3PIE-755', '1-USQHJ2V', '1-18BTHG2X');

select * from all_tables where owner = 'SIEBEL' and table_name like 'S_SRV%';

select * from SIEBEL.S_SRV_REQ_REL; --  where row_id = '1-1BK1TKXB';

select * from S_PARTY_PER where PARTY_ID = '1-3PWU-1911';

select a.SERIAL_NUM, a.created, a.OWNER_ACCNT_ID
From s_asset a, s_prod_int p
where a.SERIAL_NUM = '0135008478'
and a.prod_id = p.row_id
and a.STATUS_CD = 'Active';

select s.created + 8/24, s.row_id, source_typ_cd, sr_type_cd, sr_area, sr_cat_Type_cd, sr_Sub_area, 
s.CST_CON_ID, s.CST_OU_ID, s.ASSET_ID, s.BILLACCT_ID, x.*
from s_srv_req s, SIEBEL.S_SRV_REQ_X x
where s.CST_OU_ID = '1-3PWU-1911'
and s.row_id = x.row_id
order by s.created desc;

select X_ORDER_SUB_TYPE, X_SOURCE, o.* from s_order o where ACCNT_ID = '1-3PWU-1911' order by created desc;

