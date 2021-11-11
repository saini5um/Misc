alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select ast.serial_num "MSISDN", ast.last_upd "Update_Date", ast.status_cd, ast.X_SUB_STATUS_CD, prd.name, ast.start_dt, 
e.name cust_name, e.loc NRIC, e.x_cust_id_type
from s_asset ast, s_prod_int prd, s_org_ext e
where prd.row_id = ast.prod_id
and ast.par_asset_id is null
and prd.type='Service'
and prd.x_validation_fld is null
and ast.status_cd = 'Active'
and ast.owner_accnt_id = e.row_id
and e.x_cust_id_type = 'New NRIC'
and ast.SERIAL_NUM like '01%'
and prd.name = 'RTP Voice Service'
order by ast.start_dt;
--and ast.serial_num in ('01119893382', '0196712385');
and ast.START_DT >= to_date('11/02/2018 00:00:00', 'dd/mm/yyyy hh24:mi:ss') - 1/3 
and ast.START_DT < to_date('12/02/2018 00:00:00', 'dd/mm/yyyy hh24:mi:ss') - 1/3;

