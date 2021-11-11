alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'DD-Mon-YYYY HH24:MI:SS';

select * from siebel.s_order;

select * from all_tab_columns where owner = 'SIEBEL'
and table_name like 'S_%'
and column_name like '%OUTL%';

select row_id, created, name, expertise_cd, loc, MASTER_OU_ID, ou_num, x_name, PAR_OU_ID, PAR_BU_ID, PRTNR_ORG_INT_ID, 
PRTNR_FLG, PRTNR_CTGRY_CD, PRTNR_TYPE_CD, region
from s_org_ext where name like '%50035%'
and int_org_flg = 'Y' and prtnr_flg = 'Y';
and ou_num = 'BCC10000KUL';

select * from s_org_ext where row_id = '1-28P-3478'; -- CELCOM RETAIL SDN BHD

select row_id, created, name, expertise_cd, loc, MASTER_OU_ID, ou_num, x_name, PAR_OU_ID, PAR_BU_ID, PRTNR_ORG_INT_ID, 
PRTNR_FLG, PRTNR_CTGRY_CD, PRTNR_TYPE_CD, region
from s_org_ext where par_ou_id = '1-28P-3478' -- like 'BCC%'
and int_org_flg = 'Y' and prtnr_flg = 'Y';

ROW_ID = 1-29L-4033
MASTER_OU_ID = 1-MN90-832
PAR_OU_ID = 1-28P-3478
PAR_BU_ID = 1-29L-4033
PRTNR_ORG_INT_ID = 1-2DL-15

select * from s_org_ext where row_id = '1-2DL-15';
