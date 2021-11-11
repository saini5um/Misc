alter user TCS_V00900X identified by 'E$plmplm3';

select * from OSB_SOAINFRA.EAI_AUDIT_LOG;

select * from OSB_SOAINFRA.EAI_BIZ_EVENT_CONFIG; -- where EVENT_NAME='CustomerRetrieveENT';

select * from all_ind_columns
where index_owner = 'OSB_SOAINFRA'
and table_owner = 'OSB_SOAINFRA'
and table_name = 'EAI_AUDIT_LOG'
order by index_name, COLUMN_POSITION;

select * from OSB_SOAINFRA.EAI_AUDIT_LOG 
where AUDIT_DATE_TIME >= to_date('26-Apr-2017 12:58:00', 'dd-Mon-YYYY HH24:MI:SS')
and AUDIT_DATE_TIME <= to_date('26-Apr-2017 13:00:00', 'dd-Mon-YYYY HH24:MI:SS')
and event_name = 'CustomerRetrieveENT'
and audit_type = 'WsResponse' 
and payload like '%Err40090%'; --'%770411999999%';

select * from OSB_SOAINFRA.EAI_AUDIT_LOG
where int_msg_id = 'EAI00000004390211318';

select count(*) from OSB_SOAINFRA.EAI_AUDIT_LOG where AUDIT_DATE_TIME >= '13-Apr-2017' and AUDIT_DATE_TIME < '14-Apr-2017';
-- 5916110
select count(*) from OSB_SOAINFRA.EAI_AUDIT_LOG where AUDIT_DATE_TIME >= '11-Apr-2017' and AUDIT_DATE_TIME < '12-Apr-2017';
-- 8243775: 12 April, 8509332: 11 April
