create or replace procedure tmp_get_cug_details is
v_asset_status varchar2(20);
v_asset_owner varchar2(20);
v_asset_bill varchar2(20);
v_cust_name varchar2(255);
v_ou_num varchar2(10);
v_payment varchar2(20);

cursor missing_cug is
select * from tmp_missing_cug;

begin

for cug_rec in missing_cug
loop 
begin
select status_cd, OWNER_ACCNT_ID, BILL_ACCNT_ID
into v_asset_status, v_asset_owner, v_asset_bill
from s_asset
where SERIAL_NUM = cug_rec.msisdn
and desc_text like '%Mobile%';

select name, ou_num
into v_cust_name, v_ou_num
from s_org_ext
where row_id = v_asset_bill;

select payment_type_cd into v_payment 
from s_inv_prof
where accnt_id = v_asset_bill
and nvl(STATUS_CD, 'Active') = 'Active';

update tmp_missing_cug set asset_status_cd = v_asset_status,
owner_accnt_id = v_asset_owner, bill_accnt_id = v_asset_bill,
name = v_cust_name, ou_num = v_ou_num, payment = v_payment
where msisdn = cug_rec.msisdn;

exception when others then
dbms_output.put_line('Failed with error for MSISDN'||cug_rec.msisdn);
end;
end loop;

end;
/