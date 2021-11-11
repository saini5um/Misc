alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from user_objects;

select * from all_db_links 
where db_link = 'BRMPROD';

select * from tv;

create table tt as select * from all_tables where owner = 'APEX_030200';
create materialized view tv 
refresh on demand
as select * from tt;

create materialized view testv
refresh on demand as
select * from all_tables 
where owner like 'APEX_030200%';

create materialized view MV_account_details 
refresh on demand
as
-- Account Details, CA profile, BA profile, Porting Details, Credit Limit, billing_details
-- ALL_ACCOUNT_DETAILS, BA_BILLING_DETAILS, SA_CREDIT_LIMIT_DETAILS, CA_PROF_DETAILS, BA_PROF_DETAILS, SA_PROF_DETAILS: 6 Tables
select n.first_name, n.first_name ||' '||n.last_name acc_name, n.email_addr, lca.date_of_birth, n.address, n.zip, n.city,
n.state, n.country, lca.ic_type, DECODE(lca.IC_TYPE,'FIN',4,'NRIC',1) CODE, lca.order_id, lba.token_info, lba.token_short_code,
lba.card_pay_type, lba.card_bank_name, lba.referral_code, lba.last_digits, CASE
			WHEN LENGTH(lsa.PORTING_NUMBER) > 1
			THEN 'TRUE'
 			ELSE 'FALSE'
		END AS CUSTOMER_PORTED, lsa.auto_boost, lsa.order_date, DECODE(B.BILLING_SEGMENT, 0, 'Default') BILL_CYCLE_NAME,
b.actg_cycle_dom, b.actg_last_t, sa.poid_id0 sapoid, sa.aac_serial_num, 
ca.poid_id0 capoid, ba.poid_id0 bapoid, ca.account_no canum, sa.account_no sanum, ba.account_no banum, cp.credit_limit credit_limit
from account_t sa, account_t ca, account_t ba, profile_t cap, profile_t bap, profile_t sap, PROFILE_LW_CA_ACCOUNT_T lca,
PROFILE_LW_BA_ACCOUNT_T lba, PROFILE_LW_SA_ACCOUNT_T lsa, account_nameinfo_t n, billinfo_t b, bal_grp_t b, bal_grp_bals_t bb, 
cfg_credit_profile_t cp 
where ca.poid_id0 = SUBSTR ( sa.LINEAGE, ( INSTR (sa.LINEAGE, ':', 1, 1) + 1 ), 
				( ( INSTR (sa.LINEAGE, '/', 1, 2) - ( INSTR (sa.LINEAGE, ':', 1, 1)+ 1 ) ) ) )
and ba.poid_id0 = SUBSTR ( sa.LINEAGE, ( INSTR (sa.LINEAGE, ':', 1, 2) + 1 ), 
				( ( INSTR (sa.LINEAGE, '/', 1, 3) - ( INSTR (sa.LINEAGE, ':', 1, 2)+ 1 ) ) ) )
and sa.aac_serial_num = 'SA'
and ca.aac_serial_num = 'CA'
and ba.aac_serial_num = 'BA'
and cap.account_obj_id0 = ca.poid_id0
and cap.poid_type = '/profile/lw_ca_account'
and bap.account_obj_id0 = ba.poid_id0
and bap.poid_type = '/profile/lw_ba_account'
and sap.account_obj_id0 = sa.poid_id0
and sap.poid_type = '/profile/lw_sa_account'
and lca.obj_id0 = cap.poid_id0
and lba.obj_id0 = bap.poid_id0
and lsa.obj_id0 = sap.poid_id0
and n.obj_id0 = cap.account_obj_id0
and b.account_obj_id0 = ba.poid_id0
and b.account_obj_id0 = sa.poid_id0
AND B.POID_ID0          = Bb.OBJ_ID0
AND Bb.CREDIT_PROFILE   = CP.REC_ID 
AND Bb.REC_ID           = '2000028';

select n.first_name, n.first_name ||' '||n.last_name acc_name, n.email_addr, lca.date_of_birth, n.address, n.zip, n.city,
n.state, n.country, lca.ic_type, DECODE(lca.IC_TYPE,'FIN',4,'NRIC',1) CODE, lca.order_id, lba.token_info, lba.token_short_code,
lba.card_pay_type, lba.card_bank_name, lba.referral_code, lba.last_digits, CASE
			WHEN LENGTH(lsa.PORTING_NUMBER) > 1
			THEN 'TRUE'
 			ELSE 'FALSE'
		END AS CUSTOMER_PORTED, lsa.auto_boost, lsa.order_date, DECODE(B.BILLING_SEGMENT, 0, 'Default') BILL_CYCLE_NAME,
b.actg_cycle_dom, b.actg_last_t, sa.poid_id0 sapoid, sa.aac_serial_num, 
ca.poid_id0 capoid, ba.poid_id0 bapoid, ca.account_no canum, sa.account_no sanum, ba.account_no banum,
(select cp.credit_limit from bal_grp_t b, bal_grp_bals_t bb, cfg_credit_profile_t cp
where b.account_obj_id0 = sa.poid_id0
AND B.POID_ID0          = Bb.OBJ_ID0
AND Bb.CREDIT_PROFILE   = CP.REC_ID 
AND Bb.REC_ID           = '2000028') credit_limit
from account_t sa, account_t ca, account_t ba, profile_t cap, profile_t bap, profile_t sap, PROFILE_LW_CA_ACCOUNT_T lca,
PROFILE_LW_BA_ACCOUNT_T lba, PROFILE_LW_SA_ACCOUNT_T lsa, account_nameinfo_t n, billinfo_t b 
where ca.poid_id0 = SUBSTR ( sa.LINEAGE, ( INSTR (sa.LINEAGE, ':', 1, 1) + 1 ), 
				( ( INSTR (sa.LINEAGE, '/', 1, 2) - ( INSTR (sa.LINEAGE, ':', 1, 1)+ 1 ) ) ) )
and ba.poid_id0 = SUBSTR ( sa.LINEAGE, ( INSTR (sa.LINEAGE, ':', 1, 2) + 1 ), 
				( ( INSTR (sa.LINEAGE, '/', 1, 3) - ( INSTR (sa.LINEAGE, ':', 1, 2)+ 1 ) ) ) )
and sa.aac_serial_num = 'SA'
and ca.aac_serial_num = 'CA'
and ba.aac_serial_num = 'BA'
and cap.account_obj_id0 = ca.poid_id0
and cap.poid_type = '/profile/lw_ca_account'
and bap.account_obj_id0 = ba.poid_id0
and bap.poid_type = '/profile/lw_ba_account'
and sap.account_obj_id0 = sa.poid_id0
and sap.poid_type = '/profile/lw_sa_account'
and lca.obj_id0 = cap.poid_id0
and lba.obj_id0 = bap.poid_id0
and lsa.obj_id0 = sap.poid_id0
and n.obj_id0 = cap.account_obj_id0
and b.account_obj_id0 = ba.poid_id0;

SELECT B.ACCOUNT_OBJ_ID0, b.poid_type, CP.CREDIT_LIMIT
FROM BAL_GRP_T B, BAL_GRP_BALS_T BL, CFG_CREDIT_PROFILE_T CP
WHERE B.ACCOUNT_OBJ_ID0 = 105007427311
AND B.POID_ID0          = BL.OBJ_ID0
AND BL.CREDIT_PROFILE   = CP.REC_ID (+) 
AND (BL.REC_ID          = '1000301'
OR BL.REC_ID is null);
    
select * from bal_grp_t where ACCOUNT_OBJ_ID0 = 105007427311;
select * from bal_grp_bals_t b, cfg_credit_profile_t c
where b.obj_id0 = 105007423983
and b.credit_profile = c.rec_id;
and rec_id = '1000301';


SELECT DISTINCT 
		SERVA1.POID_ID0 AS SA_POID, serva1.aac_serial_num, 
		SUBSTR ( SERVA1.LINEAGE, ( INSTR (SERVA1.LINEAGE, ':', 1, 1) + 1 ), 
				( ( INSTR (SERVA1.LINEAGE, '/', 1, 2) - ( INSTR (SERVA1.LINEAGE, ':', 1, 1)+ 1 ) ) ) ) AS CA_POID,
		SUBSTR ( SERVA1.LINEAGE, ( INSTR (SERVA1.LINEAGE, ':', 1, 2) + 1 ), 
				( ( INSTR (SERVA1.LINEAGE, '/', 1, 3) - ( INSTR (SERVA1.LINEAGE, ':', 1, 2)+ 1 ) ) ) ) AS BA_POID,
		(SELECT ACCOUNT_NO
		 FROM 
			ACCOUNT_T
		WHERE 
			POID_ID0 = SUBSTR ( SERVA1.LINEAGE, ( INSTR (SERVA1.LINEAGE, ':', 1, 1) + 1 ), 
			( ( INSTR (SERVA1.LINEAGE, '/', 1, 2) - ( INSTR (SERVA1.LINEAGE, ':', 1, 1)+ 1 ) ) ) )) AS CA_ACCOUNT_NO,
		(SELECT ACCOUNT_NO
		 FROM 
			ACCOUNT_T
		 WHERE 
			POID_ID0 = SUBSTR ( SERVA1.LINEAGE, ( INSTR (SERVA1.LINEAGE, ':', 1, 2) + 1 ), 
			( ( INSTR (SERVA1.LINEAGE, '/', 1, 3) - ( INSTR (SERVA1.LINEAGE, ':', 1, 2)+ 1 ) ) ) )) AS BA_ACCOUNT_NO,
  		SERVA1.ACCOUNT_NO AS SA_ACCOUNT_NO,
		(SELECT POID_ID0
		 FROM 
			PROFILE_T
		 WHERE 
			POID_TYPE     = '/profile/lw_ca_account'
			AND ACCOUNT_OBJ_ID0 = SUBSTR ( SERVA1.LINEAGE, ( INSTR (SERVA1.LINEAGE, ':', 1, 1) + 1 ), 
			( ( INSTR (SERVA1.LINEAGE, '/', 1, 2) - ( INSTR (SERVA1.LINEAGE, ':', 1, 1)+ 1 ) ) ) )
			AND ROWNUM  =1) AS CA_PROF_POID,
		(SELECT POID_ID0
		 FROM 
			PROFILE_T
		WHERE 
			POID_TYPE  = '/profile/lw_ba_account'
			AND ACCOUNT_OBJ_ID0 = SUBSTR ( SERVA1.LINEAGE, ( INSTR (SERVA1.LINEAGE, ':', 1, 2) + 1 ), 
			( ( INSTR (SERVA1.LINEAGE, '/', 1, 3) - ( INSTR (SERVA1.LINEAGE, ':', 1, 2)+ 1 ) ) ) )
			AND ROWNUM =1) AS BA_PROF_POID,
		P.POID_ID0 AS SA_PROF_POID,
    SERVA1.CREATED_T JOIN_DATE
	FROM 
		ACCOUNT_T SERVA1,
		PROFILE_T P
	WHERE 
		SERVA1.POID_ID0 = P.ACCOUNT_OBJ_ID0
        and serva1.poid_id0 = 105007427311
		AND P.POID_TYPE = '/profile/lw_sa_account';
        
SELECT DISTINCT
    ACC.SA_POID,ACC.SA_ACCOUNT_NO,
    DECODE ( SERVICELIST.STATUS, 10100, 'ACTIVE', 10102, 'INACTIVE', 10103, 'TERMINATED' ) SERV_STATUS,
    SERVICELIST.EFFECTIVE_T,
    SERVICELIST.MOD_T,
    DEVICE1.ID1,
    DEVICE1.STATE ,
    DEVICE.SIM AS SIM,
    DEVICE.IMSI AS IMSI
    FROM
    SERVICE_ALIAS_LIST_T@BRMPROD SAL,
    (SELECT
            D.DEVICE_ID                             AS SIM,
            D.STATE_ID                              AS STATE,
            DA.IMSI                                 AS IMSI,
            D.POID_TYPE                             AS TYPE,
            DS.SERVICE_OBJ_ID0                      AS DSERVICEPOID
    FROM
            DEVICE_T@BRMPROD D,
            DEVICE_SIM_T@BRMPROD DA,
            DEVICE_SERVICES_T@BRMPROD DS
    WHERE
            D.POID_ID0= DA.OBJ_ID0
            AND D.POID_TYPE = '/device/sim'
            AND D.POID_ID0 = DS.OBJ_ID0
            AND DS.OBJ_ID0 = DA.OBJ_ID0
    ) DEVICE,
    (SELECT
            S.ACCOUNT_OBJ_ID0,
            S.STATUS,
            CASE
                    WHEN S.STATUS = 10103
                    THEN S.MOD_T
                    ELSE 0
                    END AS MOD_T,
            S.EFFECTIVE_T,
            S.POID_ID0
     FROM
            SERVICE_T@BRMPROD S,
            ALL_ACCOUNT_DETAILS ACC
     WHERE
            ACC.SA_POID=S.ACCOUNT_OBJ_ID0
            AND S.POID_TYPE = '/service/telco/gsm/telephony'
) SERVICELIST ,
(SELECT
            D.DEVICE_ID                             AS ID1,
            D.STATE_ID                              AS STATE,
            DS.SERVICE_OBJ_ID0                      AS DSERVICEPOID
    FROM
            DEVICE_T@BRMPROD D,
            DEVICE_SERVICES_T@BRMPROD DS
    WHERE
            D.POID_TYPE = '/device/num'
            AND D.POID_ID0 = DS.OBJ_ID0
 ) DEVICE1,
ALL_ACCOUNT_DETAILS ACC
WHERE
        SERVICELIST.ACCOUNT_OBJ_ID0             = ACC.SA_POID
        AND SAL.OBJ_ID0 (+)                     = SERVICELIST.POID_ID0
        AND DEVICE.DSERVICEPOID(+)              = SERVICELIST.POID_ID0 
        AND DEVICE1.DSERVICEPOID(+)              = SERVICELIST.POID_ID0;

select * from account_t@brmprod where poid_id0 = 104997442141;
select * from profile_t@brmprod where poid_type = '/profile/lw_sa_account';
select * from user_ind_columns@brmprod
where table_name = 'ACCOUNT_T';

select * from profile_t where poid_type = '/profile/lw_ca_account';
select * from account_t where poid_id0 = 104996643518;

grant select on all_account_details to kirk;
grant select on customer_details_final to kirk;
grant select on CREDIT_DEBIT_DETAILS to kirk;
grant select on CUSTOMER_BILL_DETAILS to kirk;
grant select on SA_INVENTORY_DETAILS to kirk;
grant select on SA_INVALID_DETAILS to kirk;
grant select on SA_EXTRA_DETAILS to kirk;
grant select on SA_COMPONENT_DETAILS to kirk;