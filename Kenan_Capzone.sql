select * from customer_id_equip_map where external_id = '0136443905';

select parent_account_no from service where subscr_no = 11084295 and subscr_no_resets = 0;

select d.DESCRIPTION_TEXT, p.* 
from product p, product_elements e, descriptions d
where p.parent_subscr_no = 11084295 and p.parent_subscr_no_resets = 0
and p.element_id = e.element_id
and e.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and p.product_inactive_dt is null;

select * from cmf_balance where account_no = 152965440;

select * from cdr_unbilled where account_no = 152965440;

select sum(base_amt)/100 from cdr_data where account_no = 152965440
and subscr_no = 11084295 and subscr_no_resets = 0;

select CREDIT_THRESH from cmf where account_no = 152965440;

select * from charge_threshold where account_no = 152965440;

insert into charge_threshold_alarm
select profile_id, 152965440, 11084295, 0, 2003, alarm_status, upper_limit_percent, lower_limit_percent,
cutoff_start_dt, cutoff_end_dt, charge_limit, total_charge, currency_code, create_dt, chg_dt, chg_who, 27557662, 31, 
14641422, 31
from CHARGE_THRESHOLD_ALARM where account_no = 152961490;

select * from CHARGE_THRESHOLD_ALARM where account_no = 152965440;

select max(unique_id) from charge_threshold_alarm;

update charge_threshold_alarm set alarm_id = 2004 where account_no = 152961490;

update alarm_id = 2004;

select * from INTCREMENSYS.CELCOM_THS_THRESH_ALARM_IND where account_no = 152965440;

select * from user_tables where table_name like 'THS%';

select * from ths_received;

desc charge_threshold_alarm;

select * from USER_CONSTRAINTS where table_name = 'CHARGE_THRESHOLD_ALARM'
and constraint_type <> 'C';

select * from user_ind_columns where index_name = 'CHARGE_THRESHOLD_ALARM_PK';

select max(unique_id) from charge_threshold_alarm;

select 14631421 + 10000 from dual;

select * from user_sequences where sequence_name like '%SEQ%';

select * from seq_num where table_name like '%THS%';

