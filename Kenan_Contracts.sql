select * from cmf order by account_no desc;

select d.DESCRIPTION_TEXT, p.* 
from product_elements p, descriptions d
where p.description_code = d.description_code
and d.language_code = 1;

select d.DESCRIPTION_TEXT, n.* 
from nrc_trans_descr n, descriptions d
where n.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like 'EARLY CONTRACT TERMINATION%';

select description_text, n.TRACKING_ID, n.type_id_nrc, n.BILLING_ACCOUNT_NO, n.PARENT_SUBSCR_NO, n.EFFECTIVE_DATE, n.RATE/100, n.CHG_WHO
from nrc n, nrc_trans_descr t, descriptions d
where effective_date > '01-Jan-2018'
and n.type_id_nrc = t.TYPE_ID_NRC
and t.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%PENALTY%'
and n.RATE > 0;

select description_text, n.TYPE_ID_NRC, to_char(n.EFFECTIVE_DATE, 'MON-YYYY'), count(*)
from nrc n, nrc_trans_descr t, descriptions d
where effective_date > '01-Jan-2018'
and n.type_id_nrc = t.TYPE_ID_NRC
and t.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%TERMINATION%' -- '%PENALTY%'
and n.RATE > 0
group by description_text, n.type_id_nrc, to_char(n.EFFECTIVE_DATE, 'MON-YYYY');


select c.CONTRACT_TYPE, d.DESCRIPTION_TEXT, n.RATE, c.START_DT, c.END_DT, c.PREV_END_DT, n.EFFECTIVE_DATE, 
p.DURATION, e.EXTERNAL_ID, e.ACTIVE_DATE, e.INACTIVE_DATE, c.PARENT_ACCOUNT_NO, months_between(c.end_dt, c.start_dt)
--description_text, n.TYPE_ID_NRC, to_char(n.EFFECTIVE_DATE, 'MON-YYYY'), count(*)
from nrc n, nrc_trans_descr t, descriptions d, CUSTOMER_CONTRACT c, contract_types p, CUSTOMER_ID_EQUIP_MAP e
where effective_date > '01-Jan-2018'
and n.type_id_nrc = t.TYPE_ID_NRC
and t.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and c.PARENT_SUBSCR_NO = e.SUBSCR_NO
and c.PARENT_SUBSCR_NO_RESETS = e.SUBSCR_NO_RESETS
and e.EXTERNAL_ID_TYPE = 1
and (e.INACTIVE_DATE is null or e.INACTIVE_DATE > c.END_DT + 15)
and n.RATE > 0
and n.CONTRACT_TRACKING_ID = c.TRACKING_ID
and n.contract_tracking_id_serv = c.TRACKING_ID_SERV
and c.contract_type = p.contract_type
and p.CONTRACT_CATEGORY = 7
and p.COMMITMENT_TYPE_ID_NRC = n.TYPE_ID_NRC
and c.END_DT < sysdate
and months_between(c.end_dt, c.start_dt) > 18
and upper(description_text) not like 'CANCEL%';

-- 200 cases per month

type_id_nrc = 200036, 92117
contract_types = 93348, 200073

select d1.description_text, c.ACTIVE_DATE, n.type_id_nrc, d2.description_text 
from CONTRACT_TYPES c, DESCRIPTIONS d1, NRC_TRANS_DESCR n, descriptions d2
where c.CONTRACT_category = 7
and d1.DESCRIPTION_Code = c.DESCRIPTION_CODE
and d1.LANGUAGE_CODE = 1
and c.COMMITMENT_TYPE_ID_NRC = n.TYPE_ID_NRC
and n.DESCRIPTION_CODE = d2.DESCRIPTION_CODE
and d2.LANGUAGE_CODE = 1
order by c.ACTIVE_DATE;

select description_text, c.* 
from contract_types c, descriptions d
where c.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1
and c.contract_category = 7
and c.TERMINATION_TYPE_ID_NRC in (200036, 92117);

select * from PACKAGE_COMPONENT_MEMBERS;
