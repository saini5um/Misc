alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select row_id, created, name, loc, x_cust_id_type, X_SEGMENT_CD, x_segment_grp, X_SEGMENT_SU_GRP 
from s_org_ext 
where X_CUST_ID_TYPE = 'New NRIC'
and loc is not null
and x_segment_cd = '10'
and expertise_cd is null;

select row_id, created, order_num, x_order_sub_type, x_source, x_source_num, x_reservat
from s_order where x_source_num = 'P20181016138648547';

select row_id, created, name, part_num, type, prod_type_cd, PROMO_TYPE_CD, billing_type_cd, desc_text, 
fulflmnt_item_code, pg_owner_type_cd, x_validation_fld
from s_prod_int p
where --type like '%Member%'
order by created;
and name like '%Promotion%';

select * from all_tab_columns
where table_name = 'S_ORDER_ITEM'
and column_name like 'X_R%';
