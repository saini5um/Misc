alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from s_org_ext
where row_id in ('1-WJB427K','1-29L-4033','1-29L-4299','1-29L-4077','1-29L-3988','1-PA593UQ','1-T5C3TL5',
'1-29L-4333','1-29L-2578','1-29L-3088','1-12NYR0SF','1-12O09MYW');

select ox.* from S_ORG_EXT O, S_ORG_EXT_XM OX 
where O.ROW_ID = OX.PAR_ROW_ID
and o.row_id in ('1-WJB427K','1-29L-4033','1-29L-4299','1-29L-4077','1-29L-3988','1-PA593UQ','1-T5C3TL5',
'1-29L-4333','1-29L-2578','1-29L-3088','1-12NYR0SF','1-12O09MYW');

select P.* from S_ORG_EXT O, S_PARTY P 
where P.ROW_ID = O.PAR_ROW_ID 
and o.row_id in ('1-WJB427K','1-29L-4033','1-29L-4299','1-29L-4077','1-29L-3988','1-PA593UQ','1-T5C3TL5',
'1-29L-4333','1-29L-2578','1-29L-3088','1-12NYR0SF','1-12O09MYW');

select count(*) from S_PARTY_PER PP, S_PARTY P 
where P.ROW_ID = PP.PARTY_ID or P.ROW_ID=PP.PERSON_ID
and p.row_id in ('1-12NYR0SF','1-12O09MYW','1-29L-2578','1-29L-3088','1-WJB427K','1-29L-3988','1-29L-4033',
'1-29L-4077','1-29L-4299','1-29L-4333','1-PA593UQ','1-T5C3TL5');

select OB.*
from S_ORG_EXT O, S_ORG_BU OB 
where (OB.ORG_ID = O.ROW_ID OR 
OB.PAR_OU_ID = O.ROW_ID) 
and o.row_id in ('1-WJB427K','1-29L-4033','1-29L-4299','1-29L-4077','1-29L-3988','1-PA593UQ','1-T5C3TL5',
'1-29L-4333','1-29L-2578','1-29L-3088','1-12NYR0SF','1-12O09MYW');

select C.*
from S_CONTACT C, S_ORG_EXT O 
where (C.ROW_ID = O.PR_CON_ID or C.ROW_ID = O.FIN_RESP_CON_ID or C.ROW_ID = O.PR_BL_PER_ID or C.ROW_ID = O.PR_SHIP_PER_ID) 
and o.row_id in ('1-WJB427K','1-29L-4033','1-29L-4299','1-29L-4077','1-29L-3988','1-PA593UQ','1-T5C3TL5',
'1-29L-4333','1-29L-2578','1-29L-3088','1-12NYR0SF','1-12O09MYW');


select CB.* from S_CONTACT_BU CB, S_CONTACT C where CB.CONTACT_ID=C.ROW_ID
and c.row_id in ('1-LBNJ-561','1-12NZWATY','1-12O0OO37','1-289-2685','1-WJC4FVL','1-288-2757','1-28A-660','1-28A-3008',
'1-287-1012','1-287-1728','1-288-794','1-PA5UNF7','1-T5C3TN0');

select a.* 
from S_ORG_EXT O, S_ADDR_PER A 
where A.ROW_ID =O.PR_ADDR_ID 
and o.row_id in ('1-WJB427K','1-29L-4033','1-29L-4299','1-29L-4077','1-29L-3988','1-PA593UQ','1-T5C3TL5',
'1-29L-4333','1-29L-2578','1-29L-3088','1-12NYR0SF','1-12O09MYW');

select CA.* from S_CON_ADDR CA, S_CONTACT C 
where CA.CONTACT_ID=C.ROW_ID
and c.row_id in ('1-LBNJ-561','1-12NZWATY','1-12O0OO37','1-289-2685','1-WJC4FVL','1-288-2757','1-28A-660','1-28A-3008',
'1-287-1012','1-287-1728','1-288-794','1-PA5UNF7','1-T5C3TN0');

select CA.ADDR_PER_ID,AP.ROW_ID from S_CON_ADDR CA, S_ADDR_PER AP where CA.ADDR_PER_ID=AP.ROW_ID;

select * from s_org_terr;

select * from dba_tab_columns
where owner = 'SIEBEL'
and table_name = 'S_CON_ADDR'
order by column_id;