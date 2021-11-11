select UNIX2DATE(created_t), a.* 
from account_t a 
where created_t > to_epoch(to_date('06-Mar-2019 12:00:00', 'dd-Mon-YYYY HH24:MI:SS'))
and a.AAC_SERIAL_NUM = 'SA';

select * from account_t where account_no = 'LW101129813';
select * from account_t where POID_ID0 in (106013676973, 106013679213, 106013679341);

select * from service_t
where ACCOUNT_OBJ_ID0 = 106013679341;

/0.0.0.1:106013676973/0.0.0.1:106013679213/0.0.0.1:106013679341/

-- purchased products for an account
select l.name plan, d.name deal, p.name product, unix2date(t.created_t), unix2date(t.mod_t), t.* 
from PURCHASED_PRODUCT_T t, product_t p, deal_t d, plan_t l 
where t.ACCOUNT_OBJ_ID0 = 105009731608
and t.PRODUCT_OBJ_ID0 = p.POID_ID0
and t.DEAL_OBJ_ID0 = d.POID_ID0 (+)
and t.PLAN_OBJ_ID0 = l.POID_ID0 (+)
order by t.CREATED_T;

-- purchased discounts for an account
select l.name plan, d.name deal, p.name product, t.* 
from PURCHASED_DISCOUNT_T t, product_t p, deal_t d, plan_t l 
where t.ACCOUNT_OBJ_ID0 = 106013679341
and t.discount_OBJ_ID0 = p.POID_ID0
and t.DEAL_OBJ_ID0 = d.POID_ID0 (+)
and t.PLAN_OBJ_ID0 = l.POID_ID0 (+)
order by t.CREATED_T;

select * from bal_grp_t where ACCOUNT_OBJ_ID0 = 106013679341;

select b.*, c.name 
from BAL_GRP_BALS_T b, CONFIG_BEID_BALANCES_T c
where b.obj_id0 = 106013679597
and b.REC_ID = c.REC_ID
order by c.name;

select * from CONFIG_BEID_BALANCES_T where rec;

select * from BAL_GRP_SUB_BALS_T where obj_id0 = 106013679597;

select * from PURCHASED_PRODUCT_CYCLE_FEES_T;
select * from CONFIG_CUSTOMER_SEGMENT_T;
select * from PURCHASED_PRODUCT_T;
select * from profile_t;
select * from UNIQUE_ACCT_NO_T;
select * from account_phones_t;
select * from AU_BAL_GRP_BALS_T where obj_id0 = 106013679597;
select * from CONFIG_GLID_T;

-- resources provisioned for a plan and limits
select p.name, c.name, l.* 
from plan_limit_t l, plan_t p, CONFIG_BEID_BALANCES_T c 
where l.obj_id0 = 4128078
and l.OBJ_ID0 = p.POID_ID0
and l.REC_ID = c.REC_ID
order by c.name;

select l.name plan, d.name deal, p.name product, unix2date(t.created_t), unix2date(t.mod_t), UNIX2DATE(t.effective_t), 
unix2date(t.cycle_start_t), unix2date(t.cycle_end_t), unix2date(t.purchase_start_t), unix2date(t.purchase_end_t), 
unix2date(t.usage_start_t), unix2date(t.usage_end_t), unix2date(t.instantiated_t), t.* 
from PURCHASED_PRODUCT_T t, product_t p, deal_t d, plan_t l 
where t.ACCOUNT_OBJ_ID0 = 105017375992 --105009731608
and t.PRODUCT_OBJ_ID0 = p.POID_ID0
and t.DEAL_OBJ_ID0 = d.POID_ID0 (+)
and t.PLAN_OBJ_ID0 = l.POID_ID0 (+)
--and p.name like 'Bonus%'
and (t.created_t > TO_EPOCH(to_date('10-MAR-2019 00:00:00', 'dd-MON-YYYY HH24:MI:SS'))
or t.MOD_T > TO_EPOCH(to_date('10-MAR-2019 00:00:00', 'dd-MON-YYYY HH24:MI:SS')))
order by t.CREATED_T;

select p.name, unix2date(t.created_t), unix2date(t.mod_t), t.* 
from AU_PURCHASED_PRODUCT_T t, product_t p
where t.ACCOUNT_OBJ_ID0 = 105017375992
and t.PRODUCT_OBJ_ID0 = p.POID_ID0
order by t.created_t;
