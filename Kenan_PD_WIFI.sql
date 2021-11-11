SELECT SO.ORDER_NUM, CASE WHEN P.NAME LIKE 'Wi-Fi%' THEN SOI.SERVICE_NUM||'@WifiPlus' ELSE SOI.SERVICE_NUM END EXTERNAL_ID, 
P.NAME, BA.OU_NUM BANUM, SO.CREATED + 1/3 DTCREATED, SO.X_REASON_CODE , PARBA.OU_NUM PARENT_BA, SO.HOLD_FLG
FROM SIEBEL.S_ORDER SO, SIEBEL.S_ORDER_ITEM SOI, SIEBEL.S_ORG_EXT BA, SIEBEL.S_INV_PROF INV, 
SIEBEL.S_ORG_EXT PARBA, SIEBEL.S_PROD_INT P
WHERE SO.ROW_ID = SOI.ORDER_ID 
AND SOI.BILL_ACCNT_ID = BA.PAR_ROW_ID 
AND BA.MASTER_OU_ID = PARBA.ROW_ID(+)
AND SOI.ROOT_ORDER_ITEM_ID = SOI.ROW_ID 
AND SOI.BILL_PROFILE_ID = INV.ROW_ID 
AND SOI.PROM_INTEG_ID IS NOT NULL 
AND SOI.PROD_ID = P.ROW_ID
AND SO.X_ORDER_SUB_TYPE = 'Port Out' 
AND SO.STATUS_CD = 'Complete' 
AND SO.ORDER_CAT_CD = 'Sales' 
AND INV.PAYMENT_TYPE_CD = 'Postpaid' 
AND SO.LAST_UPD >= TO_DATE('01-12-15 00:00:00', 'DD-MM-YY HH24:MI:SS') - 1/3 
AND SO.LAST_UPD < TO_DATE('02-12-15 00:00:00', 'DD-MM-YY HH24:MI:SS') - 1/3 
AND SO.HOLD_FLG = 'N'
AND SO.X_REASON_CODE <> 'Port Out to Red Tone'
AND SO.ORDER_NUM = '1-78766219033';

select * from s_order_item;

select * from s_order where accnt_id = '1-CQXQ7KO'
--and created > '01-Oct-2015'
order by created;

select * from cx_cust_mgt
where created > '16-Dec-2015';

select to_char(created, 'dd-MON-YYYY'), success_flg, count(*)
from cx_cust_mgt
where created > '15-Dec-2015'
group by to_char(created, 'dd-MON-YYYY'), success_flg;

select * from user_tab_columns
where table_name = 'S_ORDER'
and column_name like '%ACCN%';

select * from cx_err_log
where created > '17-Dec-2015'
and x_business_event like '%Plan%Auto%'
order by created;

select * From cx_err_dat;
