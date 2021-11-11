alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select partition_name, high_value, partition_position, num_rows, LAST_ANALYZED --, unix2date(high_value)
from user_tab_partitions where TABLE_NAME = 'EVENT_T';

select * from purchased_product_t
where created_t >= 1551542400
and created_t < 1551628800;

select to_char(unix2date(a.CREATED_T), 'DD'), a.* from account_t a
where a.created_t >= 1551628800  
and a.created_t < 1551715200;

select --to_char(to_date('01-Jan-1970', 'dd-Mon-YYYY')+numtodsinterval(a.created_t, 'SECOND') + 8/24, 'HH24') hour, count(*)
--unix2date(a.CREATED_T), to_date('01-Jan-1970', 'dd-Mon-YYYY')+numtodsinterval(a.created_t, 'SECOND')+8/24
--to_char(to_date('01-Jan-1970', 'dd-Mon-YYYY')+numtodsinterval(a.created_t, 'SECOND'), 'HH24') hour
p.name, p.descr, p.code, unix2date(a.CREATED_T), unix2date(a.purchase_start_t), unix2date(a.purchase_end_t), a.* 
from purchased_product_t a, product_t p
where a.PRODUCT_OBJ_ID0 = p.POID_ID0
and a.created_t >= 1551715200  
and a.created_t < 1551801600
--and p.descr like 'Base Plan Subscription|Base Plan%'
--group by to_char(to_date('01-Jan-1970', 'dd-Mon-YYYY')+numtodsinterval(a.created_t, 'SECOND')+8/24, 'HH24')
--order by hour;
order by a.created_t;

select e.ITEM_OBJ_TYPE, count(*) --unix2date(e.created_t), unix2date(e.start_t), unix2date(e.end_t), e.network_session_id, e.* 
from event_t e 
where created_t >= 1551628800
and created_t < 1551715200
group by e.ITEM_OBJ_TYPE;
--and e.ITEM_OBJ_TYPE in ('/item/data_usage', '/item/voice_usage', '/item/sms_usage'); 

select account_obj_id0, count(*) --unix2date(e.created_t), unix2date(e.start_t), unix2date(e.end_t), e.* 
from event_t e 
where created_t >= 1551666600 -- 4-Mar 10:30
and created_t < 1551670200 -- 4-Mar 11:30
and poid_type = '/event/billing/product/fee/cycle/cycle_forward_monthly'
group by e.ACCOUNT_OBJ_ID0
order by count(*) desc;
order by unix2date(e.created_t);
and item_obj_type = '/item/purchase_fee'; --is null;--= '/item/purchase_fee';

select * from SERVICE_ALIAS_LIST_T l, service_t s
where l.name = '87522782'
and l.OBJ_ID0 = s.POID_ID0;

-- CDR for an account
select unix2date(e.created_t), e.ACCOUNT_OBJ_ID0, e.name, e.program_name, e.sys_descr, e.* 
from event_t e 
where created_t >= to_epoch(to_date('06-Mar-2019', 'dd-Mon-YYYY'))
and created_t < to_epoch(to_date('07-Mar-2019', 'dd-Mon-YYYY'))
and (item_obj_type like '%voice_usage' or e.ITEM_OBJ_TYPE is null)
and e.ACCOUNT_OBJ_ID0 = 27394597
--and e.PROGRAM_NAME = 'Billing Group'
--and poid_type = '/event/billing/product/fee/cycle/cycle_forward_monthly'
--and e.ACCOUNT_OBJ_ID0 in (105021239153,105012276719,105016435868,105011083706,
--105017297684,105014337010,105012737679,105022848706,105006358152)
order by unix2date(e.created_t);

select column_name from user_tab_columns 
where table_name = 'EVENT_BAL_IMPACTS_T'
order by column_id;
select * from EVENT_BAL_IMPACTS_T 
where ACCOUNT_OBJ_ID0 = 27394597
--and ITEM_OBJ_ID0 = 315885397667132667
and ITEM_OBJ_TYPE = '/item/sms_usage'
order by OBJ_ID0, rec_id;

select unix2date(e.created_t), e.* from event_t e
where POID_ID0 in (17698371511628, 17698372774727, 17698374738606, 17698368762431, 17698368761919) --(17698369989713, 17698374505776, 17698373175009)
order by created_t;

select e1.POID_ID0, unix2date(e1.created_t), e1.ACCOUNT_OBJ_ID0, e1.name, e1.PROGRAM_NAME, e1.sys_descr unsub, e2.POID_ID0,
e2.name, e2.PROGRAM_NAME, unix2date(e2.created_t), e2.sys_descr sub
from event_t e1, event_t e2
where e1.created_t >= to_epoch(to_date('10-Mar-2019 13:30:00', 'dd-Mon-YYYY HH24:MI:SS'))
and e1.created_t < to_epoch(to_date('10-Mar-2019 13:50:00', 'dd-Mon-YYYY HH24:MI:SS'))
and (e1.item_obj_type not like '%usage' or e1.ITEM_OBJ_TYPE is null)
and e2.created_t >= to_epoch(to_date('10-Mar-2019 13:30:00', 'dd-Mon-YYYY HH24:MI:SS'))
and e2.created_t < to_epoch(to_date('10-Mar-2019 13:50:00', 'dd-Mon-YYYY HH24:MI:SS'))
and (e2.item_obj_type not like '%usage' or e2.ITEM_OBJ_TYPE is null)
and e1.ACCOUNT_OBJ_ID0 = e2.ACCOUNT_OBJ_ID0
and e1.program_name = 'Unsubscribe Add-on API'
and e1.poid_type = '/event/billing/product/action/modify'
and e1.SYS_DESCR like 'Base Plan Subscription|Bonus Data|%'
and e2.program_name = 'Deal Subscription API'
and e2.SYS_DESCR like 'Base Plan Subscription|Bonus Data|%'
and e2.POID_TYPE = '/event/billing/product/action/purchase'
and e2.created_t - e1.created_t < 5
and e2.created_t - e1.created_t >= 0
--and e1.ACCOUNT_OBJ_ID0 = 105010248203
order by e1.created_t, e2.created_t;

select POID_ID0, unix2date(created_t), ACCOUNT_OBJ_ID0, name, PROGRAM_NAME, sys_descr, ITEM_OBJ_TYPE, item_obj_id0, e.* 
from event_t e
where created_t >= to_epoch(to_date('06-Mar-2019 12:50:00', 'dd-Mon-YYYY HH24:MI:SS'))
and created_t < to_epoch(to_date('06-Mar-2019 13:00:00', 'dd-Mon-YYYY HH24:MI:SS'))
and (item_obj_type not like '%usage' or ITEM_OBJ_TYPE is null)
and ACCOUNT_OBJ_ID0 = 105010248203
and name = 'Billing Event Log'
and poid_type in ('/event/billing/product/action/modify', '/event/billing/product/action/purchase')
order by created_t;

select unix2date(e.created_t), e.ACCOUNT_OBJ_ID0, e.name, e.program_name, e.sys_descr, e.* 
from event_t e 
where created_t >= to_epoch(to_date('07-Mar-2019 00:50:00', 'dd-Mon-YYYY HH24:MI:SS'))
and created_t < to_epoch(to_date('07-Mar-2019 23:00:00', 'dd-Mon-YYYY HH24:MI:SS'))
and item_obj_type like '/item%settl%roaming'
--and e.ACCOUNT_OBJ_ID0 = 105014940361
--and e.PROGRAM_NAME = 'Billing Group'
--and poid_type = '/event/billing/product/fee/cycle/cycle_forward_monthly'
--and e.ACCOUNT_OBJ_ID0 in (105021239153,105012276719,105016435868,105011083706,
--105017297684,105014337010,105012737679,105022848706,105006358152)
order by unix2date(e.created_t);

select * from CONFIG_EVENT_MAP_T;
select * from user_tables where table_name like 'CFG%';
select * from CFG_CREDIT_PROFILE_T order by rec_id;
select * from config_t where poid_type like '%credit%';

select * from ACCOUNT_NAMEINFO_T where OBJ_ID0 = 105010248203;
select unix2date(created_t), a.* from account_t a where poid_id0 = 105010248203;

select unix2date(a.created_t), a.* from account_t a where POID_ID0 = 105937598918;

-- 2,318,636 -- 3 MAR
-- 3,216,198 -- 4 MAR 
-- 3,087,429 -- 4 MAR CDRs only

select to_epoch(to_date('06-Mar-2019 12:00:00', 'dd-Mon-YYYY HH24:MI:SS')) from dual;

1551456000 -- 2 March
1551542400 -- 3 March
1551628800 -- 4 March
1551715200 -- 5 March
1551801600 -- 6 March
