alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'DD-Mon-YYYY HH24:MI:SS';

select a.created, a.row_id, a.ROOT_ASSET_ID, OWNER_ACCNT_ID, BILL_ACCNT_ID, BILL_PROFILE_ID, a.STATUS_CD, SERIAL_NUM, p.name
from s_asset a, s_prod_int p
where serial_num = '0192938623' --'0132540380'
and a.prod_id = p.row_id
and a.STATUS_CD = 'Active';

select a.created, a.row_id, a.ROOT_ASSET_ID, OWNER_ACCNT_ID, BILL_ACCNT_ID, BILL_PROFILE_ID, a.STATUS_CD, SERIAL_NUM, p.name
from s_asset a, s_prod_int p
where a.ROOT_ASSET_ID = '1-14HWHJHR'
and a.prod_id = p.row_id
and a.STATUS_CD = 'Active';

select o.created + 8/24, t.name, o.STATUS_CD, X_ORDER_SUB_TYPE, x_source, o.* 
from s_order o, s_order_type t
where ACCNT_ID = '1-CQS-2487'
and o.ORDER_TYPE_ID = t.row_id
order by 1;

select * from SIEBEL.S_SRV_REQ where OWNER_OU_ID = '1-I5TR-785';

select created, name, PROD_CATG_CD, type, PROD_TYPE_CD, BILLING_TYPE_CD from s_prod_int
where upper(name) like '%ROAM%';

select * from s_org_ext where loc like '770411199999%';

SELECT * FROM (SELECT DISTINCT T1.ROW_ID AS CustomerRowId,
                T1.LOC AS CustomerID,
                T1.X_CUST_ID_TYPE AS CustomerIDType,
                T7.OU_NUM AS KENANAccountID,
                T9.ROW_ID AS BillingProfileID,
                T8.OU_NUM AS MasterAccountNumber,
                T1.X_DOB AS DateofBirth,
                T1.X_GENDER AS Gender,
                T1.X_MOTHER_MAIDEN_NAME AS MotherMaidenName,
                T1.NAME AS Name,
                T1.X_NATIONALITY AS Nationality,
                T1.X_RACE AS Race,
                T1.X_PER_TITLE AS Salutation,
                T7.X_SEGMENT_CD AS SegmentCode,
                T1.X_SEGMENT_GRP AS SegmentGroup,
                T1.X_SEGMENT_SU_GRP AS SegmentSubGroup,
                T7.X_CUST_TYPE AS Type,
                T7.X_VIP_CD AS VIPCode,
                T7.X_CREDIT_TREATMENT_CD AS CreditTreatmentCode,
                T4.BILL_ACCNT_ID AS AssetBillingAccountRowId,
                T7.CUST_STAT_CD as BillingAccountStatus,
                T7.BRIEFING_LAYOUT as BillingType,
                T4.PROMOTION_ID AS PromotionId,
                (SELECT DISTINCT
                    T12.X_VALIDATION_FLD 
                FROM
                    SIEBEL.S_ASSET T11,
                    SIEBEL.S_PROD_INT T12,
                    SIEBEL.S_VOD T13,
                    SIEBEL.S_ISS_OBJ_DEF T14,
                    SIEBEL.S_VOD T15
                WHERE
                        T4.ROW_ID = T11.ROOT_ASSET_ID
                    AND T11.PROD_ID = T12.ROW_ID
                    AND T12.CFG_MODEL_ID = T13.OBJECT_NUM
                    AND T13.ROW_ID = T14.VOD_ID
                    AND T14.PAR_VOD_ID = T15.OBJECT_NUM
                    AND T11.STATUS_CD IN ('Active', 'Suspended')
                    AND T15.VOD_NAME IN ('Main Plan ICC','Data Main Plan ICC'))AS Prin_Sup_Indicator,
                CASE 
                  WHEN SPI.TYPE ='Device' AND SPI.PART_NUM NOT IN ('FD00010','FD00020','FD00030')
                  THEN (SELECT OLI.SERIAL_NUM
                        FROM SIEBEL.S_ASSET OLI, SIEBEL.S_PROD_INT OLIPROD
                        WHERE
                        T4.ROW_ID = OLI.PAR_ASSET_ID
                        AND OLI.PROD_ID = OLIPROD.ROW_ID
                        AND OLIPROD.TYPE ='Device'
                        AND OLI.status_cd <> 'Inactive') 
                  WHEN SPI.PART_NUM IN ('FD00010','FD00020','FD00030')
                  THEN T4.SERIAL_NUM
                  ELSE (SELECT 
                        DEVICE.SERIAL_NUM
                        FROM
                        SIEBEL.S_ASSET MAINPLAN,
                        SIEBEL.S_PROD_INT PRODSERVICE, 
                        SIEBEL.S_PROD_INT PRODPLAN,
                        SIEBEL.S_ASSET DEVICE,
                        SIEBEl.S_PROD_INT PRODDEVICE
                        WHERE 
                        MAINPLAN.ROOT_ASSET_ID = T4.ROW_ID
                        AND T4.PROD_ID = PRODSERVICE.ROW_ID
                        AND PRODSERVICE.TYPE = 'Service'
                        AND MAINPLAN.PROD_ID = PRODPLAN.ROW_ID
                        AND DEVICE.PROD_ID = PRODDEVICE.ROW_ID
                        AND MAINPLAN.ROOT_ASSET_ID = T4.ROW_ID
                        AND DEVICE.PAR_ASSET_ID = MAINPLAN.ROW_ID
                        AND MAINPLAN.STATUS_CD <> 'Inactive'
                        AND DEVICE.STATUS_CD <> 'Inactive'
                        AND PRODPLAN.TYPE = 'Device'
                        AND PRODDEVICE.TYPE ='Device')
                END AS AssetImei,
                CASE 
                  WHEN SPI.PART_NUM IN ('FD00010','FD00020','FD00030')
                  THEN 
                  (SELECT XA.CHAR_VAL
                        FROM SIEBEL.S_ASSET_XA XA
                        WHERE XA.ATTR_NAME = 'MODEL'
                        AND XA.ASSET_ID = T4.ROW_ID)
                  WHEN SPI.TYPE ='Device' AND SPI.PART_NUM NOT IN ('FD00010','FD00020','FD00030')
                  THEN
                  (SELECT XA.CHAR_VAL

                        FROM SIEBEL.S_ASSET_XA XA, SIEBEL.S_ASSET MAINPLAN,SIEBEL.S_PROD_INT PRODSERVICE, SIEBEL.S_PROD_INT PRODPLAN
                        WHERE XA.ATTR_NAME = 'MODEL'
                        AND XA.ASSET_ID = MAINPLAN.ROW_ID
                        AND MAINPLAN.ROOT_ASSET_ID = T4.ROW_ID
                        AND T4.PROD_ID = PRODSERVICE.ROW_ID
                        AND PRODSERVICE.TYPE IN ('Device')
                        AND MAINPLAN.PROD_ID = PRODPLAN.ROW_ID
                        AND MAINPLAN.STATUS_CD <> 'Inactive'
                        AND PRODPLAN.TYPE = 'Device')
                  ELSE 
                  (SELECT XA.CHAR_VAL

                        FROM SIEBEL.S_ASSET_XA XA, SIEBEL.S_ASSET MAINPLAN,SIEBEL.S_PROD_INT PRODSERVICE, SIEBEL.S_PROD_INT PRODPLAN,
                        SIEBEL.S_ASSET PAR_ASSET,SIEBEL.S_ASSET PAR_PAR_ASSET,SIEBEL.S_PROD_INT PAR_PAR_ASSET_PROD
                        WHERE XA.ATTR_NAME = 'MODEL'
                        AND XA.ASSET_ID = MAINPLAN.ROW_ID
                        AND MAINPLAN.ROOT_ASSET_ID = T4.ROW_ID
                        AND T4.PROD_ID = PRODSERVICE.ROW_ID
                        AND PRODSERVICE.TYPE IN ('Service')
                        AND MAINPLAN.PAR_ASSET_ID=PAR_ASSET.ROW_ID
                        AND PAR_ASSET.PAR_ASSET_ID=PAR_PAR_ASSET.ROW_ID
                        AND PAR_PAR_ASSET.PROD_ID= PAR_PAR_ASSET_PROD.ROW_ID
                        AND PAR_ASSET.STATUS_CD <> 'Inactive'
                        AND PAR_PAR_ASSET.STATUS_CD <> 'Inactive'
                        AND PAR_PAR_ASSET_PROD.FULFLMNT_ITEM_CODE NOT IN ('New Phone VAS ICC','New Phone ICC')
                        AND MAINPLAN.PROD_ID = PRODPLAN.ROW_ID
                        AND MAINPLAN.STATUS_CD <> 'Inactive'
                        AND PRODPLAN.TYPE = 'Device')END AS AssetModel,
                SPI.NAME as Product,
                SPI.TYPE as ProductType,
                (SELECT FABRIC_CD 
                FROM SIEBEL.S_PROD_INT ISS
                WHERE T4.PROMOTION_ID = ISS.ROW_ID) as PlanSegmentType,
                T2.X_BUILDING AS BuildingName,
                T2.CITY    AS City,
                T2.COUNTRY AS Country,
                T2.X_FLOOR AS FloorNo,
                T2.ADDR_TYPE_CD    AS AddressYType,
                T2.ZIPCODE AS PostalCode,
                T2.STATE AS State,
                T2.ADDR as StreetAddress,
                T2.ADDR_LINE_2 AS Section,
                T2.X_PO_BOX POBox,
                T2.X_STREET_TYPE AS StreetType,
                T2.X_UNIT AS UnitNo,
                T3.ALT_PH_NUM AS ContactAlternateNum,
                T3.WORK_PH_NUM AS ContactBusinessPhone,
                T3.EMAIL_ADDR AS ContactEmail,
                T3.FST_NAME AS ContactFirstName,
                T3.HOME_PH_NUM AS ContactHomePhone,
                T3.LAST_NAME AS ContactLastName,
                T3.CELL_PH_NUM AS ContactMobileNum,
                T6.BEST_CALLTM_CD AS ContactPreferredTime,
                T3.CON_CD AS ContactType,
                T3.X_PER_TITLE AS ContactSalutation,
                T3.PREF_COMM_METH_CD AS PreferredContactMethod,
                CASE 
                  WHEN SPI.TYPE ='Device' AND SPI.PART_NUM IN ('FD00010','FD00020','FD00030')
                  THEN (SELECT FIBRESERVICE.SERIAL_NUM FROM SIEBEL.S_ASSET FIBRESERVICE WHERE T4.ROOT_ASSET_ID = FIBRESERVICE.ROW_ID)
                  ELSE T4.SERIAL_NUM 
                END AS MobileNumber,
/*                case 
				           when spi.type ='Member' 
                  then (
                  select moli.x_principle_serv_id from siebel.s_asset moli, siebel.s_prod_int spimoli
                  where
                  moli.prom_integ_id = T4.ASSET_MEM_INTEG_ID and moli.prod_id = spimoli.row_id and (spimoli.x_validation_fld IS NULL OR spimoli.x_validation_fld <> 'Wifi')
                  ),
				          when T4.X_SME_GROUP is not null
				         then 
				          (select distinct a.serial_num from siebel.s_asset a,siebel.s_prod_int p
				          where a.BILL_ACCNT_ID IN 
				          (select o.MASTER_OU_ID from siebel.s_org_ext o where o.row_id = T4.BILL_ACCNT_ID) 
				          and a.prod_id=p.row_id and p.type='Service' and (p.x_validation_fld IS NULL OR p.x_validation_fld <> 'Wifi')
				          and a.row_id = a.root_asset_id and a.serial_num is not null and a.status_cd='Active')

				            else */ 
                   -- T4.X_PRINCIPLE_SERV_ID  AS PrincipleMobileNumber,
                CASE 
                  WHEN SPI.TYPE ='Device' AND SPI.PART_NUM IN ('FD00010','FD00020','FD00030')
                  THEN (SELECT FIBRESERVICE.ROW_ID FROM SIEBEL.S_ASSET FIBRESERVICE WHERE T4.ROOT_ASSET_ID = FIBRESERVICE.ROW_ID)
                  ELSE T4.ROW_ID
                END  AS AssetID,
                T4.INTEGRATION_ID AS AssetIntegrationID,
                case 
                  when T9.row_id is not null 
                  then T9.PAYMENT_TYPE_CD
                  else
                ( SELECT PROMO.PAYMNT_TYPE_CD
                  FROM SIEBEL.S_PROD_INT PROMO
                  WHERE
                  T4.PROMOTION_ID = PROMO.ROW_ID)
                  end AS Pre_Pos_Indicator,
                CASE 
                  WHEN SPI.TYPE ='Device' AND SPI.PART_NUM IN ('FD00010','FD00020','FD00030')
                  THEN (
                  SELECT DISTINCT
                    T12.NAME 
                FROM
                    SIEBEL.S_ASSET T11,
                    SIEBEL.S_PROD_INT T12,
                    SIEBEL.S_VOD T13,
                    SIEBEL.S_ISS_OBJ_DEF T14,
                    SIEBEL.S_VOD T15,
                    siebel.s_asset fibreservice
                WHERE
                      T4.root_asset_id = fibreservice.row_id
                     and fibreservice.row_id   = T11.ROOT_ASSET_ID
                    AND T11.PROD_ID = T12.ROW_ID
                    AND T12.CFG_MODEL_ID = T13.OBJECT_NUM
                    AND T13.ROW_ID = T14.VOD_ID
                    AND T14.PAR_VOD_ID = T15.OBJECT_NUM
                    AND T11.STATUS_CD IN ('Active', 'Suspended')
                    AND T15.VOD_NAME IN ('Fibre Plan ICC'))
                  ELSE
                (SELECT DISTINCT
                    T12.NAME 
                FROM
                    SIEBEL.S_ASSET T11,
                    SIEBEL.S_PROD_INT T12,
                    SIEBEL.S_VOD T13,
                    SIEBEL.S_ISS_OBJ_DEF T14,
                    SIEBEL.S_VOD T15
                WHERE
                        T4.ROW_ID = T11.ROOT_ASSET_ID
                    AND T11.PROD_ID = T12.ROW_ID
                    AND T12.CFG_MODEL_ID = T13.OBJECT_NUM
                    AND T13.ROW_ID = T14.VOD_ID
                    AND T14.PAR_VOD_ID = T15.OBJECT_NUM
                    AND T11.STATUS_CD IN ('Active', 'Suspended')
                    AND T15.VOD_NAME IN ('Main Plan ICC','Data Main Plan ICC','Fibre Plan ICC','Main Plan Postpaid ICC','Data Main Plan Postpaid ICC')) END AS Plan,
                CASE 
                  WHEN SPI.TYPE ='Device' AND SPI.PART_NUM IN ('FD00010','FD00020','FD00030')
                  THEN (SELECT PROMO2.NAME FROM SIEBEL.S_ASSET FIBRESERVICE, SIEBEL.S_PROD_INT PROMO2 WHERE T4.ROOT_ASSET_ID = FIBRESERVICE.ROW_ID
                  AND PROMO2.ROW_ID = FIBRESERVICE.PROMOTION_ID )
                  when spi.type ='Member'
                  then (
                  select promo.name from siebel.s_asset astpromo, siebel.s_prod_int promo
                  where
                  astpromo.integration_id = T4.ASSET_MEM_INTEG_ID and
                  astpromo.prod_id = promo.row_id
                  )
                  ELSE 
                (SELECT 
                    PROMO.NAME
                FROM
                    SIEBEL.S_PROD_INT PROMO
                WHERE
                    T4.PROMOTION_ID = PROMO.ROW_ID) END AS prodPromName,

                T1.CUST_SINCE_DT AS CustomerSince,
                T3.ROW_ID AS ContactRowId,
                T4.STATUS_CD AS AsstStatus,
                T4.X_SUB_STATUS_CD AS AssetSubStatus,
                T5.LANGUAGUES AS PreferredContactLang,
                (SELECT DISTINCT
                    ATTRIB_01
                FROM
                    SIEBEL.S_ORG_EXT_XM
                WHERE
                    PAR_ROW_ID = T1.ROW_ID
                AND NAME = 'FACEBOOK'
                AND TYPE = 'SOCIAL MEDIA') AS FacebookId,
                (SELECT DISTINCT
                    ATTRIB_01
                FROM
                    SIEBEL.S_ORG_EXT_XM
                WHERE
                    PAR_ROW_ID = T1.ROW_ID
                AND NAME = 'GOOGLEPLUS'
                AND TYPE = 'SOCIAL MEDIA') AS GooglePlusId,
                (SELECT DISTINCT
                    ATTRIB_01
                FROM
                    SIEBEL.S_ORG_EXT_XM
                WHERE
                    PAR_ROW_ID = T1.ROW_ID
                AND NAME = 'TWITTER'
                AND TYPE = 'SOCIAL MEDIA') AS TwitterId,
                (select ssx.char_val
                 from siebel.s_asset_xa ssx, siebel.s_asset ssap
                 where T4.PROM_INTEG_ID = ssap.INTEGRATION_ID
                 and ssap.row_id = ssx.asset_id
                 and ssx.attr_name ='Name') AS KenanName,
                T7.AVAIL_CREDIT_AMT as BACreditLimit,
                T7.NAME as BAName,
                T9.BILL_CYCLE as BillCycle,
                T1.X_TAX_REL_FLG as GSTTaxRelief,
                T1.X_TAX_REL_ID as GSTTaxReliefID FROM SIEBEL.S_ORG_EXT T1,
                SIEBEL.S_ADDR_PER T2,
                SIEBEL.S_CONTACT T3,
                (SELECT * FROM SIEBEL.S_ASSET WHERE X_MIG_FLAG = 'Y') T4,
                SIEBEL.S_CONTACT_TNTX T5,
                SIEBEL.S_CONTACT_FNX T6,
                (SELECT * FROM SIEBEL.S_ORG_EXT where ACCNT_TYPE_CD IN ('Billing','Billing Aggregator')) T8,
                SIEBEL.S_INV_PROF T9,
                SIEBEL.S_PROD_INT SPI,
                (SELECT * FROM SIEBEL.S_ORG_EXT where ACCNT_TYPE_CD IN ('Billing','Billing Aggregator')) T7 WHERE T1.PR_ADDR_ID = T2.ROW_ID(+)
                AND T1.PR_CON_ID = T3.ROW_ID(+)
                AND T1.ROW_ID = T4.OWNER_ACCNT_ID(+)
                AND T3.ROW_ID = T5.ROW_ID(+)
                AND T3.ROW_ID = T6.ROW_ID(+)
                AND T1.PRTNR_FLG <> 'Y'
                AND T4.BILL_ACCNT_ID = T7.PAR_ROW_ID(+)
                AND T8.PAR_ROW_ID (+) = T7.MASTER_OU_ID
                AND T4.PROD_ID = SPI.ROW_ID (+)
                AND T7.ROW_ID = T9.ACCNT_ID(+) 
--                AND (:CustomerRowId IS NULL OR 1=1) 
                AND T1.LOC = '770411199999' 
--                AND (:CustomerIDType IS NULL OR 1=1) 
--                AND (:MSISDN IS NULL OR 1=1) 
--                AND (:KENANAccountID IS NULL OR 1=1) 
                AND (((SPI.TYPE = 'Service' OR SPI.TYPE ='Device' OR SPI.TYPE ='Member') 
                AND T4.PAR_ASSET_ID IS NULL) OR T4.ROW_ID IS NULL) 
                order by T4.status_cd asc, spi.name asc) WHERE ROWNUM < 11;
                