select * from user_tables 
where table_name like '%LINE%T';

select * from journal_t;
select * from cfg_credit_profile_t;

select * from user_tab_columns
where column_name like 'LINE%' --table_name = 'PURCHASED_PRODUCT_T'
order by column_id;

select unix2date(b.created_t), b.* 
From bill_t b where b.POID_ID0 = 315375148763293490;
select unix2date(b.created_t), b.* 
From bill_t b where b.account_obj_id0 = 29548411081;
select * from invoice_t;

select count(*) from ACCOUNT_T; -- 730,751
select count(*) from bal_grp_t; -- 730,751
select * from account_T where POID_ID0 = 105007469212;
select * from BILLINFO_T where ACCOUNT_OBJ_ID0 = 105007469212;
select * from bal_grp_t where ACCOUNT_OBJ_ID0 = 105007469212; -- 105007470236
select * from BAL_GRP_BALS_T where obj_id0 = 105007470236;
select UNIX2DATE(valid_from), unix2date(valid_to), b.* from BAL_GRP_SUB_BALS_T b where OBJ_ID0 = 105007470236;

select count(*)--poid_id0, POID_TYPE, LINEAGE, substr(lineage, 10, length(to_char(poid_id0))) 
from account_t
where poid_id0 = substr(lineage, 10, length(to_char(poid_id0)));

select poid_id0, POID_TYPE, LINEAGE, substr(lineage, 10, length(to_char(poid_id0))) 
from account_t
where poid_id0 = substr(lineage, 10, length(to_char(poid_id0)));

select * from service_t where ACCOUNT_OBJ_ID0 in (106355187261,106355233801,106355235295,
106355236112,106355335352,106355335824,106355336276); --104997442141; -- CA 105004025872; --BA 105006326285; -- SA

select * from account_t where lineage like '%104997442141%';

select * from BAL_GRP_SUB_BALS_T where OBJ_ID0 = 105007470236;


select p.name, p.descr, p.code, unix2date(a.purchase_start_t), unix2date(a.purchase_end_t), a.* 
from purchased_product_t a, product_t p
where a.PRODUCT_OBJ_ID0 = p.POID_ID0
and a.created_t >= 1551628800
and a.created_t < 1551715200;

-- sub balances under an account
select t.name, t.DESCR, c.name,unix2date(s.valid_from), unix2date(s.valid_to), s.current_bal, s.next_bal, s.delayed_bal, s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, PURCHASED_PRODUCT_T p, product_t t, CONFIG_BEID_BALANCES_T c
where g.ACCOUNT_OBJ_ID0 = 27394597
and g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.GRANTOR_OBJ_ID0 = p.POID_ID0
and s.GRANTOR_OBJ_TYPE = '/purchased_product'
and p.PRODUCT_OBJ_ID0 = t.POID_ID0
and s.REC_ID2 = c.rec_id
and c.name like '%Sms%';

-- resource counters under an account
select g.ACCOUNT_OBJ_ID0, count(*)--r.NAME, r.BEID_STR_CODE, count(*) --unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r --, PURCHASED_PRODUCT_T p, product_t t
where g.ACCOUNT_OBJ_ID0 in (105501434213, 105518971920, 105518972040, 105505466192, 105525135962, 105516623695, 105512890179, 
105515767732, 105514858878, 105512887819)
and g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id
group by g.account_obj_id0;
--group by r.name, r.BEID_STR_CODE;
--and s.GRANTOR_OBJ_ID0 = p.POID_ID0
--and s.GRANTOR_OBJ_TYPE = '/purchased_product'
--and p.PRODUCT_OBJ_ID0 = t.POID_ID0;

-- resource counters under an account
select g.ACCOUNT_OBJ_ID0, r.NAME, r.BEID_STR_CODE, unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r --, PURCHASED_PRODUCT_T p, product_t t
where g.ACCOUNT_OBJ_ID0 = 105006203219 --in (105501434213, 105518971920, 105518972040, 105505466192, 105525135962, 105516623695, 105512890179, 
--105515767732, 105514858878, 105512887819)
and g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id;
group by g.account_obj_id0;

select g.ACCOUNT_OBJ_ID0, count(*)--r.NAME, r.BEID_STR_CODE, count(*) --unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r --, PURCHASED_PRODUCT_T p, product_t t
where g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id
group by g.account_obj_id0
having count(*) > 30
order by count(*) desc;

select avg(cnt) from (
select g.ACCOUNT_OBJ_ID0, count(*) cnt--r.NAME, r.BEID_STR_CODE, count(*) --unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r, account_t a --, PURCHASED_PRODUCT_T p, product_t t
where g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id
and g.account_obj_id0 = a.POID_ID0
and a.AAC_SERIAL_NUM = 'SA'
group by g.account_obj_id0);
order by count(*) desc;

select count(*), min(cnt), avg(cnt), max(cnt) from (
select g.ACCOUNT_OBJ_ID0, count(unique r.name) cnt--r.NAME, r.BEID_STR_CODE, count(*) --unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r, account_t a --, PURCHASED_PRODUCT_T p, product_t t
where g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id
and g.account_obj_id0 = a.POID_ID0
and a.AAC_SERIAL_NUM = 'SA'
and exists ( select 1 from purchased_product_t p
where p.account_obj_id0 = a.poid_id0 
and p.plan_obj_id0 = 4126222
and p.status = 1)
and a.status = 10100
group by g.account_obj_id0);

select g.ACCOUNT_OBJ_ID0, unix2date(a.created_t), count(unique r.name) cnt--r.NAME, r.BEID_STR_CODE, count(*) --unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r, account_t a --, PURCHASED_PRODUCT_T p, product_t t
where g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id
and g.account_obj_id0 = a.POID_ID0
and a.AAC_SERIAL_NUM = 'SA'
and exists ( select 1 from purchased_product_t p
where p.account_obj_id0 = a.poid_id0 and p.plan_obj_id0 = 4128078)
and a.created_t > to_epoch(to_date('01-Mar-2019', 'dd-Mon-YYYY'))
group by g.account_obj_id0, unix2date(a.created_t)
having count(unique r.name) < 10;

select unix2date(created_t), a.STATUS, n.* 
from account_t a, ACCOUNT_NAMEINFO_T n 
where POID_ID0 in (106355187261,106355233801,106355235295,
106355236112,106355335352,106355335824,106355336276)
and a.POID_ID0 = n.OBJ_ID0;

select * from purchased_product_t;
select * from plan_t;
select t.name, p.* from purchased_product_t p, plan_t t
where p.ACCOUNT_OBJ_ID0 = 105515767732
and p.PLAN_OBJ_ID0 = t.poid_id0;

select * from CONFIG_BEID_BALANCES_T
where rec_id in (2000025,2000093,5000025,5000093);
5000093

select * from config_t where poid_type = '/config/beid';

select date2unix(sysdate) from dual;

-- Services under an account
select * from service_t where POID_ID0 in (105017713599, 105017718688, 105017716976); --(105007906775, 105007906483, 105007903155);
select * from SERVICE_ALIAS_LIST_T where name = '87538502'; --'92391251';
select * From service_t where ACCOUNT_OBJ_ID0 = 105017714647 and ACCOUNT_OBJ_TYPE = '/account';

-- account details
select * from account_t where poid_id0 = 105007469212;
select * from payinfo_t where ACCOUNT_OBJ_ID0 = 105007469212;
select * from ACCOUNT_NAMEINFO_T where obj_id0 = 105007469212;

select * from PURCHASED_PRODUCT_T where POID_ID0 = 105006291640; -- account 105006286009
select * from user_tables where table_name = 'PURCHASED_PRODUCT_T';
-- products purchased for account
select p.name, p.descr, p.code, unix2date(a.purchase_start_t), unix2date(a.purchase_end_t), a.* 
from purchased_product_t a, product_t p
where a.PRODUCT_OBJ_ID0 = p.POID_ID0
and a.ACCOUNT_OBJ_ID0 = 105017714647
order by a.POID_ID0;

-- Products & Discounts Purchased by Account
select a.ACCOUNT_NO, TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(bt.ACTG_LAST_T, 'SECOND')),'DD-MM-YYYY') as CURRENT_CYCLE,
sum(p.QUANTITY) TOTAL_PURCHASED_PROD,
sum(d.QUANTITY) TOTAL_PURCHASED_DISC
from ACCOUNT_T a, BILLINFO_T bt, PURCHASED_PRODUCT_T p, PURCHASED_DISCOUNT_T d
where a.POID_ID0=bt.ACCOUNT_OBJ_ID0
and a.POID_ID0=p.ACCOUNT_OBJ_ID0
and a.poid_id0=d.ACCOUNT_OBJ_ID0
and p.PLAN_OBJ_ID0='0'
and d.PLAN_OBJ_ID0='0'
and p.PURCHASE_START_T >= bt.ACTG_LAST_T
and p.PURCHASE_START_T <= bt.ACTG_NEXT_T
and d.PURCHASE_START_T >= bt.actg_last_t
and d.purchase_start_t <= bt.ACTG_NEXT_T
GROUP BY a.ACCOUNT_NO, TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(bt.ACTG_LAST_T, 'SECOND')),'DD-MM-YYYY')
ORDER BY TOTAL_PURCHASED_PROD DESC, TOTAL_PURCHASED_DISC;

select current_cycle, min(total_purchased_prod), avg(total_purchased_prod), max(total_purchased_prod), count(*) from (
select a.ACCOUNT_NO, TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(bt.ACTG_LAST_T, 'SECOND')),'DD-MM-YYYY') as CURRENT_CYCLE,
sum(p.quantity) TOTAL_PURCHASED_PROD
from ACCOUNT_T a, BILLINFO_T bt, PURCHASED_PRODUCT_T p --, PURCHASED_DISCOUNT_T d
where a.POID_ID0=bt.ACCOUNT_OBJ_ID0
and a.POID_ID0=p.ACCOUNT_OBJ_ID0
--and a.poid_id0=d.ACCOUNT_OBJ_ID0
and p.PLAN_OBJ_ID0='0'
--and d.PLAN_OBJ_ID0='0'
and p.PURCHASE_START_T >= bt.ACTG_LAST_T
and p.PURCHASE_START_T <= bt.ACTG_NEXT_T
and bt.ACTG_LAST_T >= to_epoch(to_date('01-Feb-2019', 'dd-Mon-YYYY'))
GROUP BY a.ACCOUNT_NO, TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(bt.ACTG_LAST_T, 'SECOND')),'DD-MM-YYYY')
)
group by current_cycle;
ORDER BY account_no, current_cycle;

select TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(created_t, 'SECOND')),'DD-MM-YYYY'), count(*) 
from PURCHASED_PRODUCT_T
where created_t > to_epoch(to_date('01-Mar-2019', 'dd-Mon-YYYY'))
and PLAN_OBJ_ID0 = 0
group by TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(created_t, 'SECOND')),'DD-MM-YYYY');

select TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(created_t, 'SECOND')),'DD-MM-YYYY'), count(*) 
from PURCHASED_DISCOUNT_T
where created_t > to_epoch(to_date('01-Mar-2019', 'dd-Mon-YYYY'))
and PLAN_OBJ_ID0 = 0
group by TO_CHAR(TRUNC(TO_DATE('01-JAN-1970')+ NUMTODSINTERVAL(created_t, 'SECOND')),'DD-MM-YYYY');

select count(*) from product_t; -- where POID_ID0 = 161053115;
select * from product_t;

select * from user_ind_columns
where table_name = 'PURCHASED_PRODUCT_T' 
order by index_name, column_position;

select * from user_tab_columns where column_name = 'CREDIT_PROFILE';
select * from credit_limit_pr;
select * from all_credit_limits;
select * from au_bal_grp_bals_t;
