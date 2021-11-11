alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select * from s_order where row_id = '1-3R8RF';
select * from s_order order by created desc; --where order_num = '1-6554002';
select row_id, created, last_upd, SERVICE_NUM, STATUS_CD, ACTION_CD, FULFLMNT_STATUS_CD 
from s_order_item where order_id = '1-3WH3M';

select row_id, created, SERIAL_NUM, STATUS_CD from s_asset where SERIAL_NUM in ('0193231178',
'0192947415','0196988293','09134376174','0134376578', '0134376614', '01119074373', '0196194980');
--0196988293

select o.order_num, o.created + 8/24, i.action_cd, i.service_num 
from s_order o, s_order_item i
where o.row_id = i.ORDER_ID
and o.STATUS_CD = 'Cancelled'
and i.SERVICE_NUM like 'M%';

select created + 8/24, o.* from s_order o order by created desc;

alter user posintusr identified by QfA4v3jFNnjK5B;
ALTER PROFILE default LIMIT PASSWORD_REUSE_MAX unlimited;
select USERNAME,PROFILE from dba_users where USERNAME='POSINTUSR';

ProcessName
SISOMBillingSubmitOrderWebService
Object Id 1-3SLXR
