alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select unix2date(e.created_t), e.ACCOUNT_OBJ_ID0, e.name, e.program_name, e.sys_descr, e.* 
from event_t e 
where created_t >= to_epoch(to_date('06-Mar-2019 12:00:00', 'dd-Mon-YYYY HH24:MI:SS'))
and created_t < to_epoch(to_date('06-Mar-2019 13:00:00', 'dd-Mon-YYYY HH24:MI:SS'))
and (item_obj_type not like '%usage' or e.ITEM_OBJ_TYPE is null)
--and upper(sys_descr) like '%BOOST%'
and e.ACCOUNT_OBJ_ID0 = 105007643556
--and e.PROGRAM_NAME = 'Billing Group'
--and poid_type = '/event/billing/product/fee/cycle/cycle_forward_monthly'
--and e.ACCOUNT_OBJ_ID0 in (105021239153,105012276719,105016435868,105011083706,
--105017297684,105014337010,105012737679,105022848706,105006358152)
order by unix2date(e.created_t);

select e1.POID_ID0, unix2date(e1.created_t), e1.ACCOUNT_OBJ_ID0, e1.name, e1.PROGRAM_NAME, e1.sys_descr unsub, e2.POID_ID0,
e2.name, e2.PROGRAM_NAME, unix2date(e2.created_t), e2.sys_descr sub
from event_t e1, event_t e2
where e1.created_t >= to_epoch(to_date('06-Mar-2019 13:30:00', 'dd-Mon-YYYY HH24:MI:SS'))
and e1.created_t < to_epoch(to_date('06-Mar-2019 13:50:00', 'dd-Mon-YYYY HH24:MI:SS'))
and (e1.item_obj_type not like '%usage' or e1.ITEM_OBJ_TYPE is null)
and e2.created_t >= to_epoch(to_date('06-Mar-2019 13:30:00', 'dd-Mon-YYYY HH24:MI:SS'))
and e2.created_t < to_epoch(to_date('06-Mar-2019 13:50:00', 'dd-Mon-YYYY HH24:MI:SS'))
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
