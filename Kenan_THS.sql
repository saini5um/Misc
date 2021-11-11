alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select bill_lname, bill_fname, DATE_ACTIVE, DATE_CREATED, CREDIT_RATING, CREDIT_THRESH, 
account_category, mkt_code, vip_code, bill_period from cmf where account_no = 181044100;

select * from all_tables where owner = 'ARBOR'
and table_name like '%THRESH%';

select * from THRESHOLD_PROFILE_OVERRIDES where account_no = 181044100;

select * from cdr_ths_static_exclusion;

select * from cdr_threshold where account_no = 181044100 order by cutoff_end_dt desc;

select * From VIP_CODE_VALUES where language_code = 1;

select description_text, p.BILLING_ACTIVE_DT, p.BILLING_INACTIVE_DT 
from product p, product_elements e, descriptions d
where parent_account_no = 181044100
and parent_subscr_no = 15601193
and parent_subscr_no_resets = 0
and p.element_id = e.ELEMENT_ID
and e.DESCRIPTION_CODE = d.description_code
and d.language_code = 1;

select d.DESCRIPTION_TEXT, c.AMOUNT, u.trans_dt, u.rate_dt 
from cdr_unbilled u, cdr_data c, usage_types t, descriptions d
where u.account_no = 181044100 and c.subscr_no = 15601193 and c.subscr_no_resets = 0
and u.msg_id = c.MSG_ID
and u.msg_id2 = c.MSG_ID2
and u.msg_id_serv = c.MSG_ID_SERV
and u.SPLIT_ROW_NUM = c.SPLIT_ROW_NUM
and c.TYPE_ID_USG = t.TYPE_ID_USG
and t.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1
order by c.TRANS_DT;