select row_id, created, sr_num, resolution_cd, root_cause_cd, SOURCE_TYP_CD, sr_area, sr_sub_area, sr_cat_type_cd, sr_category_cd
from s_srv_req
where sr_num = '1-88640832799';

select row_id, created, sr_num, resolution_cd, root_cause_cd, SOURCE_TYP_CD, sr_area, sr_cat_type_cd, sr_category_cd 
from s_srv_req
where created > '17-Sep-2016'
and SR_CAT_TYPE_CD = 'Customer Request'
and SR_AREA = 'Query PUK';
--and SR_CATEGORY_CD = 'Query PUK';

select a.row_id, a.created, p.name, a.serial_num, a.status_cd 
from s_asset a, s_prod_int p
where a.prod_id = p.row_id
and a.root_asset_id = '1-USQY22C';
--where SERIAL_NUM = '0135008478'
--and STATUS_CD = 'Active'; -- 1-USQY22C

select * from S_ASSET_XA where ASSET_ID = '1-USQY24L';
