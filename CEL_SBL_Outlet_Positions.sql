alter user TCS_V00900X identified by F$xlnxln12 replace ORC#bmcs017;
alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from s_org_ext where row_id = '1-WJ8BHAE';



-- Outlets for 10006 --
SELECT
      T5.CONFLICT_ID,
      T5.LAST_UPD,
      T5.CREATED,
      T5.LAST_UPD_BY,
      T5.CREATED_BY,
      T5.MODIFICATION_NUM,
      T5.ROW_ID,
      T5.ROW_ID,
      T19.PR_POSTN_ID,
      T19.PR_SHIP_ADDR_ID,
      T19.PR_INDUST_ID,
      T19.PR_SHIP_PER_ID,
      T19.PR_SYN_ID,
      T19.REGION,
      T19.PR_PRTNR_TIER_ID,
      T15.ROW_ID,
      T19.CMPT_FLG,
      T19.BASE_CURCY_CD,
      T19.HIST_SLS_CURCY_CD,
      T19.PR_COMPETITOR_ID,
      T19.PR_MGR_POSTN_ID,
      T19.PR_PRTNR_OU_ID,
      T17.ZIPCODE,
      T19.PR_LABOR_RATE_ID,
      T19.BU_ID,
      T19.INT_ORG_FLG,
      T5.PARTY_TYPE_CD,
      T5.NAME,
      T19.PTNTL_SLS_CURCY_CD,
      T19.OU_TYPE_CD,
      T19.PRTNR_FLG,
      T18.PR_EXPERTISE_ID,
      T16.INTEGRATION_ID,
      T16.OWN_INST_ID,
      T5.ROOT_PARTY_FLG,
      T19.PO_PAY_CURCY_CD,
      T4.NAME,
      T9.X_PARTNER_ID,
      T9.ATTRIB_63,
      T19.CUST_STAT_CD,
      T2.ATTRIB_36,
      T2.ATTRIB_37,
      T19.PRTNR_ORG_INT_ID,
      T19.PR_PRTNR_PROG_ID,
      T2.X_PARTNER_ID,
      T2.X_CAT_ID,
      T19.CURR_PRI_LST_ID,
      T19.PR_REP_SYS_FLG,
      T19.PR_REP_MANL_FLG,
      T19.PR_REP_ASGN_TYPE,
      T19.PR_BL_ADDR_ID,
      T19.X_PG_AUTO_THRESHOLD,
      T19.X_BIOMETRIC_MYKAD,
      T19.PR_CON_ID,
      T7.X_SAP_ID,
      T1.NAME,
      T2.X_DE_ID,
      T19.X_NAME,
      T19.DIVISION,
      T19.PAR_OU_ID,
      T19.CLIENT_FLG,
      T8.BU_FLG,
      T8.NAME,
      T19.PAR_DIVN_ID,
      T5.PAR_PARTY_ID,
      T19.PAR_BU_ID,
      T19.ACCNT_TYPE_CD,
      T12.NAME,
      T19.PR_PRTNR_TYPE_ID,
      T19.FACILITY_FLG,
      T19.INVSTR_FLG,
      T19.MASTER_OU_ID,
      T19.SRV_PROVDR_FLG,
      T13.ROW_ID,
      T11.ROW_ID,
      T19.NAME,
      T2.ATTRIB_63,
      T19.PR_BL_PER_ID,
      T19.PR_PTSHP_MKTSEG_ID,
      T19.PR_ORG_TRGT_MKT_ID,
      T19.REFERENCE_CUST_FLG,
      T19.PR_REP_DNRM_FLG,
      T19.PR_ADDR_ID,
      T19.EXPERTISE_CD,
      T19.LOC,
      T3.ROW_STATUS,
      T14.LOGIN,
      T19.ROW_ID,
      T19.PAR_ROW_ID,
      T19.MODIFICATION_NUM,
      T19.CREATED_BY,
      T19.LAST_UPD_BY,
      T19.CREATED,
      T19.LAST_UPD,
      T19.CONFLICT_ID,
      T19.PAR_ROW_ID,
      T18.ROW_ID,
      T18.PAR_ROW_ID,
      T18.MODIFICATION_NUM,
      T18.CREATED_BY,
      T18.LAST_UPD_BY,
      T18.CREATED,
      T18.LAST_UPD,
      T18.CONFLICT_ID,
      T18.PAR_ROW_ID,
      T8.ROW_ID,
      T8.PAR_ROW_ID,
      T8.MODIFICATION_NUM,
      T8.CREATED_BY,
      T8.LAST_UPD_BY,
      T8.CREATED,
      T8.LAST_UPD,
      T8.CONFLICT_ID,
      T8.PAR_ROW_ID,
      T2.ROW_ID,
      T2.PAR_ROW_ID,
      T2.MODIFICATION_NUM,
      T2.CREATED_BY,
      T2.LAST_UPD_BY,
      T2.CREATED,
      T2.LAST_UPD,
      T2.CONFLICT_ID,
      T2.PAR_ROW_ID,
      T16.ROW_ID,
      T16.PAR_ROW_ID,
      T16.MODIFICATION_NUM,
      T16.CREATED_BY,
      T16.LAST_UPD_BY,
      T16.CREATED,
      T16.LAST_UPD,
      T16.CONFLICT_ID,
      T16.PAR_ROW_ID,
      T3.ROW_ID,
      T10.ROW_ID
   FROM 
       SIEBEL.S_MKT_SEG T1,
       SIEBEL.S_ORG_EXT_X T2,
       SIEBEL.S_ACCNT_POSTN T3,
       SIEBEL.S_ORG_EXT T4,
       SIEBEL.S_PARTY T5,
       SIEBEL.S_POSTN T6,
       SIEBEL.S_ORG_EXT_X T7,
       SIEBEL.S_BU T8,
       SIEBEL.S_ORG_EXT_X T9,
       SIEBEL.S_PARTY T10,
       SIEBEL.S_POSTN T11,
       SIEBEL.S_ORG_EXT T12,
       SIEBEL.S_POSTN T13,
       SIEBEL.S_USER T14,
       SIEBEL.S_POSTN T15,
       SIEBEL.S_ORG_EXT_SS T16,
       SIEBEL.S_ADDR_PER T17,
       SIEBEL.S_ORG_PRTNR T18,
       SIEBEL.S_ORG_EXT T19
   WHERE 
      T5.ROW_ID = T13.OU_ID (+) AND T13.POSTN_TYPE_CD (+) = 'Sales Representative' AND
      T5.ROW_ID = T11.OU_ID (+) AND T11.POSTN_TYPE_CD (+) = 'Supervisor' AND
      T5.ROW_ID = T15.OU_ID (+) AND T15.POSTN_TYPE_CD (+) = 'Installer' AND
      T2.X_DE_ID = T1.ROW_ID (+) AND
      T19.PAR_BU_ID = T12.PAR_ROW_ID (+) AND
      T5.PAR_PARTY_ID = T4.PAR_ROW_ID (+) AND
      T19.PAR_OU_ID = T7.ROW_ID (+) AND
      T19.PR_ADDR_PER_ID = T17.ROW_ID (+) AND
      T19.PRTNR_ORG_INT_ID = T9.PAR_ROW_ID (+) AND
      T5.ROW_ID = T19.PAR_ROW_ID AND
      T5.ROW_ID = T18.PAR_ROW_ID (+) AND
      T5.ROW_ID = T8.PAR_ROW_ID (+) AND
      T5.ROW_ID = T2.PAR_ROW_ID AND
      T5.ROW_ID = T16.PAR_ROW_ID (+) AND
      T19.PR_POSTN_ID = T3.POSITION_ID AND T19.ROW_ID = T3.OU_EXT_ID AND
      T3.POSITION_ID = T10.ROW_ID AND
      T3.POSITION_ID = T6.PAR_ROW_ID (+) AND
      T6.PR_EMP_ID = T14.PAR_ROW_ID (+) AND
      (T19.PRTNR_FLG = 'Y') AND (T19.NAME like 'BCC%10006%') AND
     (T2.ATTRIB_63 in('10006'))
   ORDER BY
      T19.PRTNR_FLG, T19.X_NAME, T19.LOC;
      
select row_id, created, name, T19.OU_NUM, T19.OU_TYPE_CD, T19.EXPERTISE_CD, T19.PR_POSTN_ID 
from s_org_ext T19 where PRTNR_FLG = 'Y' and name like 'BCC%10006%'; -- 1-29L-4299

-- positions applet (Outlet Search) creating PRM Data     
SELECT
      T5.CONFLICT_ID,
      T5.LAST_UPD,
      T5.CREATED,
      T5.LAST_UPD_BY,
      T5.CREATED_BY,
      T5.MODIFICATION_NUM,
      T5.ROW_ID,
      T14.NAME,
      T7.NAME,
      T14.DESC_TEXT,
      T14.PR_EMP_ID,
      T14.PR_TERR_ID,
      T4.LOGIN,
      T1.PR_EMP_ID,
      T5.ROOT_PARTY_FLG,
      T7.BASE_CURCY_CD,
      T14.CMPNS_CURCY_CD,
      T14.CP_PLAN_LVL_NUM,
      T6.LAST_NAME,
      T6.FST_NAME,
      T6.NICK_NAME,
      T5.NAME,
      T5.PARTY_TYPE_CD,
      T14.BU_ID,
      T13.NAME,
      T14.COMPENSATABLE_FLG,
      T14.PGROUP_ID,
      T14.ROW_ID POS_ROW_ID,
      T14.PR_POSTN_ADDR_ID,
      T14.BL_PROD_ID,
      T7.X_NAME,
      T11.X_PARTNER_ID,
      T7.EXPERTISE_CD,
      T11.ATTRIB_57,
      T14.X_CTT_SR_IDENTIFIER,
      T5.PAR_PARTY_ID,
      T14.OU_ID,
      T8.FST_NAME,
      T10.LOGIN,
      T8.LAST_NAME,
      T12.ADDR,
      T14.ROW_ID,
      T14.PAR_ROW_ID,
      T14.MODIFICATION_NUM,
      T14.CREATED_BY,
      T14.LAST_UPD_BY,
      T14.CREATED,
      T14.LAST_UPD,
      T14.CONFLICT_ID,
      T14.PAR_ROW_ID,
      T9.ROW_ID,
      T2.ROW_ID,
      T3.ROW_ID, -- null
      T12.ROW_ID -- null
   FROM 
       SIEBEL.S_POSTN T1, SIEBEL.S_PARTY T2, SIEBEL.S_CON_ADDR T3, SIEBEL.S_USER T4, SIEBEL.S_PARTY T5, SIEBEL.S_CONTACT T6,
       SIEBEL.S_ORG_EXT T7, SIEBEL.S_CONTACT T8, SIEBEL.S_PARTY_PER T9, SIEBEL.S_USER T10, SIEBEL.S_ORG_EXT_X T11,
       SIEBEL.S_ADDR_PER T12, SIEBEL.S_BU T13, SIEBEL.S_POSTN T14
   WHERE 
      T14.PR_EMP_ID = T4.PAR_ROW_ID (+) AND
      T14.BU_ID = T13.PAR_ROW_ID (+) AND
      T14.OU_ID = T11.PAR_ROW_ID (+) AND
      T5.PAR_PARTY_ID = T1.PAR_ROW_ID (+) AND
      T14.PR_EMP_ID = T6.PAR_ROW_ID (+) AND
      T14.OU_ID = T7.PAR_ROW_ID AND
      T5.ROW_ID = T14.PAR_ROW_ID AND
      T14.PR_EMP_ID = T9.PERSON_ID (+) AND T14.ROW_ID = T9.PARTY_ID (+) AND
      T14.PR_EMP_ID = T2.ROW_ID (+) AND
      T14.PR_EMP_ID = T8.PAR_ROW_ID (+) AND
      T14.PR_EMP_ID = T10.PAR_ROW_ID (+) AND
      T14.PR_POSTN_ADDR_ID = T3.ADDR_PER_ID (+) AND T14.OU_ID = T3.ACCNT_ID (+) AND
      T14.PR_POSTN_ADDR_ID = T12.ROW_ID (+) AND
      (T14.POSTN_TYPE_CD in ('Supervisor') AND T7.PAR_OU_ID = '1-WJ8BHAE')
      AND T14.OU_ID = '1-WJB427K'
   ORDER BY
      T14.NAME;

select * from s_party where par_party_id in ('1-WJCHW75','1-WJCHW70','1-WJCHW72');
select * from s_org_ext where par_ou_id = '1-WJ8BHAE';
select * from s_org_ext where row_id = '1-WJ8BHAE';

select * from s_org_ext_x where row_id = '1-WJ8BHAE';
select * from s_user where row_id = '1-WTQIL28';
select * from SIEBEL.S_CONTACT_BU where CONTACT_ID = '1-WTQIL28';


select t.* from s_postn p, s_party t
where p.row_id in ('1-XYXQ7E7','1-XZ201OT','1-XZ1YPOH','1-XZ1YPPE','1-XZ1XDUJ','1-XZ1XDVG','1-XZ1XDWD','1-XZ1XDXQ','1-XZ1XDZN',
'1-XZ1XE10','1-XZ1XE2Q','1-XZ1XE5F','1-XZ1YIV2','1-XZ1YIUL','1-XZ1YIU4','1-XZ1YITN','1-XZ1YIT6','1-XZ1YISP','1-XZ1YIS5',
'1-XZ2D0LF','1-XZ2D0KY','1-XZ2D0KE','1-WJCHW72','1-1CIU93IR')
and p.par_row_id = t.row_id;

select * from s_user where row_id = '1-WTQIL28'; --login = 'S007103764';
select * from s_contact where row_id = '1-WTQIL28'; --1-1OLFT
select * from s_party where row_id = '1-WTQIL28';
select * from s_party_per where person_id = '1-WTQIL28';
select * from s_emp_per where row_id = '1-WTQIL28';
select * from s_postn where PR_EMP_ID = '1-WTQIL28';
select * from s_con_addr where ACCNT_ID = '1-WJB427K';

select row_id, created, par_row_id, bu_id, ou_id, name, postn_type_cd, PR_EMP_ID, PR_POSTN_ADDR_ID, PR_POSTN_ID
from s_postn 
where name like 'BCC10006%'; --'CKL47948%';

select * from s_accnt_postn t3 where t3.ou_ext_id = '1-29L-4033';

select * from dba_tab_columns
where owner = 'SIEBEL'
and table_name = 'S_ORG_EXT'
and column_name like '%STAT%';

select o.row_id, o.created, o.name, expertise_cd, CUST_STAT_CD, x.attrib_58, attrib_59, attrib_63, attrib_36, attrib_37, x_cat_id,
x_partner_id, x_sap_cus_cd, x_sap_id, x_sap_plant_id, x_cesc, x_product_type, x.x_segment_grp
from s_org_ext o, S_ORG_EXT_X x 
where prtnr_flg = 'Y'
and expertise_cd = 'Ordinary Dealer'
and name like 'SWK5%'
and o.row_id = x.row_id;