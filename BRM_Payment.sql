select * from item_t order by created_t desc;

select * from item_t where poid_type like '/item/pay%'
order by created_t desc;

select * from account_t where poid_id0 = 295019631;

select * from account_nameinfo_t where obj_id0 = 295019631;

select * from billinfo_t
where account_obj_id0 = 295019631
and account_obj_type = '/account';

select * from payinfo_t
where account_obj_id0 = 295019631
and account_obj_type = '/account';

select * from bal_info_t; -- no rows
select * from bal_grp_t
where account_obj_id0 = 295019631
and account_obj_type = '/account'; -- 295019375 Account level bal group

select * from bal_grp_bals_t -- is this is total balance?
where obj_id0 = 295019375;

select * from bal_grp_sub_bals_t -- this is the total due for the account in currency units
where obj_id0 = 295019375;

select bill_no, current_total, due_t, end_t, name, previous_total, start_t, due, adjusted, disputed, total_due, recvd, closed_t
from bill_t -- has the invoice level balance and updates due, 
where account_obj_id0 = 295019631
and account_obj_type = '/account'
order by start_t desc;

select * from bill_t
where account_obj_id0 = 295019631
and account_obj_type = '/account'
order by created_t desc;

select 2592000/(60*60*24) from dual;

select * from user_tables where table_name like '%PAY%_T';

select * from EVENT_BILLING_PAYMENT_CASH_T; -- has the receipt number
select * from EVENT_BILLING_PAYMENT_T; -- has the overall payment transaction

select * from EVENT_BILL_BP_T;

select * from item_t
where account_obj_id0 = 295019631
and account_obj_type = '/account'
order by created_t desc;

select count(*) from user_tables;

