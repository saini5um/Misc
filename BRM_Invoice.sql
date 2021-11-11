select unix2date(b.created_t), unix2date(b.start_t), unix2date(b.end_t), unix2date(b.due_t), b.* 
from bill_t b where ACCOUNT_OBJ_ID0 = 105017714647 order by POID_ID0;

select actg_cycle_dom, unix2date(actg_last_t), unix2date(actg_next_t), unix2date(actg_future_t), unix2date(b.last_bill_t), b.* 
from billinfo_t b where ACCOUNT_OBJ_ID0 = 105017714647;

Last Bill: 315867805444983855
Next Bill: 315885397655939467
What Bill: 315885397655937419 = suspense

select * from invoice_t;
select * from service_alias_list_t where name = '87422593';--'87793915';
select * from service_t where POID_ID0 in (105016430589,105016428467,105016426611); --(105019733833,105019734617,105019732697);

select * from event_t;

-- CDRs for an account
select unix2date(e.created_t), unix2date(e.start_t), unix2date(e.end_t), e.network_session_id, e.* 
from event_t e, item_t i, bill_t b
where e.ACCOUNT_OBJ_ID0 = 105016429181 --105008786504
and e.ITEM_OBJ_TYPE in ('/item/data_usage', '/item/voice_usage', '/item/sms_usage')
and e.ITEM_OBJ_ID0 = i.POID_ID0
and i.BILL_OBJ_ID0 = b.POID_ID0;

select unix2date(created_t), e.* from event_t partition (P_R_04012019) e;

alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select partition_name, high_value, partition_position, num_rows, LAST_ANALYZED --, unix2date(high_value)
from user_tab_partitions where TABLE_NAME = 'EVENT_T';

P_R_04012019 - 409,025 as of '04-Mar-2019 04:04:26'
P_R_04012019 - 478,315 as of '05-Mar-2019 05:07:08'

select 478315 - 409025 from dual; -- 69,290





select * from user_ind_columns where table_name = 'EVENT_T'
order by index_name, column_position;

select * from USER_TAB_PARTITIONS where table_name = 'EVENT_T';
select * from user_part_key_columns where name = 'EVENT_T';

-- CDRs in bill
select unix2date(e.created_t), unix2date(e.start_t), unix2date(e.end_t), e.network_session_id, i.* 
from event_t e, item_t i, bill_t b
where e.SERVICE_OBJ_ID0 in (105017713599, 105017718688, 105017716976)
and e.ITEM_OBJ_TYPE = '/item/data_usage'
and e.ITEM_OBJ_ID0 = i.POID_ID0
and i.BILL_OBJ_ID0 = b.POID_ID0;

select * from user_ind_columns
where table_name = 'EVENT_T'
order by index_name, column_position;

