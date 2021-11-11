alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from PROFILE_LW_SA_ACCOUNT_T;
select * from service_alias_list_t a, service_t s
where a.obj_id0 = s.poid_id0
and s.poid_type = '/service/telco/gsm/telephony';

select * from service_alias_list_t where obj_id0 = 105007086033; -- 87421314
select * from device_t;
select d.device_id, d.source, a.name, a.rec_id, d.* 
from device_services_t s, device_t d, service_alias_list_t a
where s.service_obj_type = '/service/telco/gsm/telephony'
and s.obj_id0 = d.poid_id0
and d.source = 'MOBILE'
and s.service_obj_id0 = a.obj_id0
and a.rec_id in (0, 2) and s.service_obj_id0 = 105007086033;
and d.device_id <> a.name;

select * from service_t;
select * from event_t;

select * from gv$instance;

-- CDR for an account
select unix2date(e.created_t), e.ACCOUNT_OBJ_ID0, e.name, e.program_name, e.sys_descr, e.* 
from event_t e 
where created_t >= to_epoch(to_date('18-Mar-2019', 'dd-Mon-YYYY'))
and created_t < to_epoch(to_date('22-Mar-2019', 'dd-Mon-YYYY'))
and (item_obj_type like '%voice_usage' or e.ITEM_OBJ_TYPE is null)
and e.ACCOUNT_OBJ_ID0 = 105019735953
--and e.PROGRAM_NAME = 'Billing Group'
--and poid_type = '/event/billing/product/fee/cycle/cycle_forward_monthly'
--and e.ACCOUNT_OBJ_ID0 in (105021239153,105012276719,105016435868,105011083706,
--105017297684,105014337010,105012737679,105022848706,105006358152)
order by unix2date(e.created_t);

select unix2date(e.created_t), unix2date(start_t), unix2date(end_t), unit, tod_mode, timezone_mode, timezone_id, rated_timezone_id,
timezone_adj_start_t, timezone_adj_end_t, e.ACCOUNT_OBJ_ID0, e.name, e.program_name, e.sys_descr, e.* 
from event_t e 
where created_t >= to_epoch(to_date('28-Mar-2019', 'dd-Mon-YYYY'))
and created_t < to_epoch(to_date('29-Mar-2019', 'dd-Mon-YYYY'))
and poid_type = '/event/delayed/session/telco/gsm/roaming'
--and descr like 'TAP%'
and timezone_id <> '+0800'
and item_obj_type = '/item/voice_usage';

select * from account_nameinfo_t where obj_id0 = 105019735953;
select * from service_alias_list_t where name = '87793915';
select * from service_t where poid_id0 = 105019734617;

select * from user_tables where table_name like '%ACCTS%T';
select * from user_tab_columns where table_name = 'EVENT_SESSION_TLCS_T';

select column_name 
from all_tab_columns where table_name = 'USER_TAB_COLUMNS'
order by column_id;
select * from user_tab_columns order by table_name, column_id;

select * from config_t where poid_type like '%delay%';

select * from EVENT_DLYD_SESSION_TLCO_GSM_T
where obj_id0 in (1469229117044394555,
1469229117044567265,
1469229117045084816,
1469229117045084817);
select * from event_session_tlcs_t;

select * from EVENT_DLYD_SESSION_TLCO_GPRS_T;

-- Journal Ledger Report
select * from LEDGER_REPORT_ACCTS_T
where obj_id0 in (--107854023821,
107854349904, 107850140681) --, -- 1
--107853695961) -- 2
order by gl_id, 1;
select unix2date(created_t), l.* from ledger_report_t l order by 1 desc;

select * from event_t where poid_id0 = 1468806902320461867;
select unix2date(created_t), j.* 
from journal_t j
where created_t < to_epoch(to_date('01-Apr-2019', 'dd-Mon-YYYY'))
and account_obj_id0 = 105007135601;

select count(*) from journal_t; -- 2,327,403
select count(*) from journal_t -- 592,683
where created_t > to_epoch(to_date('01-Apr-2019', 'dd-Mon-YYYY'));

select 28.0374 + 1.9626 from dual;
