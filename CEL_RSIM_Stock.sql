alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
alter session set current_schema = SIMADMIN;

select * from UIN_DETAIL where uin = '896019170996586242';
select * from dba_users where username = 'TCS_V06720X';
grant execute on SIMADMIN.UNRESERVE_TEST_DATA_BY_UIN to TCS_V06720X;
grant execute on simadmin.transfer_test_data to TCS_V06720X;

select * from dba_objects where owner = 'SIMADMIN' and object_name like '%TRANSFER%'
and object_type = 'PROCEDURE';

select * from UIN_DETAIL where identifier = '1-8272277';

select uin.id, uin.ITEM_ID, itm.X_SAP_MAT_CD, uin.UIN,
case uin.STATUS
WHEN 0 THEN 'IN STOCK'
WHEN 1 THEN 'SOLD'
WHEN 2 THEN 'SHIPPED TO WH'
WHEN 3 THEN 'SHIPPED TO STORE'
WHEN 4 THEN 'RESERVED FOR SHIPPING'
WHEN 5 THEN 'SHIPPED TO VENDOR'
WHEN 6 THEN 'REMOVED FROM INVENTORY'
WHEN 7 THEN 'UNAVAILABLE'
WHEN 8 THEN 'MISSING'
WHEN 9 THEN 'IN RECEIVING'
WHEN 10 THEN 'RESERVED BY CUSTOMER'
WHEN 11 THEN 'CUSTORMER FULFILLED'
WHEN 12 THEN 'SHIPPED TO FINISHER'
WHEN 99 THEN 'UNCONFIRMED'
end STATUS, DE_ITM, uin.STORE_ID, uin.CREATE_DATE, uin.IDENTIFIER, uin.X_SAP_SO_NO, uin.X_MSISDN
from SIMADMIN.UIN_DETAIL uin, SIMADMIN.AS_ITM itm
where uin.item_id=itm.id_itm --and uin.x_msisdn = '0196988293'
and uin.store_id='10078' -- 10058 for Zaimi 47948 -- BCO
--and uin.uin = '896019170996586354'
--and create_date > '11-Apr-2018'
--and uin.id = 1089353441
--and uin.IDENTIFIER = 'P20180417138645957'
and itm.X_SAP_MAT_CD = '20009823'; --'20009823'; -- Starter Packs '20009721' -- Blank SIM
and uin.STATUS=10;

update SIMADMIN.UIN_DETAIL set status = 10 where id = 1089353441;
select * from simadmin.UIN_DETAIL where uin = '209010011764097';

select u.store_id, uin, u.status, u.store_id, u.create_date, u.identifier, u.x_msisdn, c.STORE_ID, c.STATUS
from SIMADMIN.uin_detail u, customer_order c 
where u.status = 10
and u.identifier = c.CUST_ORDER_ID_EXT;

execute SIMADMIN.UNRESERVE_TEST_DATA_BY_UIN('209010011764097');
commit;
execute simadmin.transfer_test_data('M01139661483', 47948, 50034);
select total_quantity, customer_resv_quantity, RESERVED_QUANTITY
from simadmin.RK_STORE_ITEM_SOH where ID_ITM=100012221 AND ID_STR_RT=10078;
update RK_STORE_ITEM_SOH set total_quantity = 28 where ID_ITM=100012221 AND ID_STR_RT=10078;
update simadmin.RK_STORE_ITEM_SOH SET CUSTOMER_RESV_QUANTITY = 0 WHERE ID_ITM=100012221 AND ID_STR_RT=99974;

select x_sap_mat_cd, de_itm, id_itm from simadmin.as_itm where de_itm like 'HP%SAMSUNG%GALAXY%A5%WHT%';

EXECUTE simadmin.DATA_LOADING ('20007782','10058','209010011764185'); -- material code, store_id, imei
EXECUTE SIMADMIN.DATA_LOADING(20009373,'10000','209010011764297');

select * from customer_order where CUST_ORDER_ID_EXT = '1-6555569'; -- 1-6555569
update customer_order set store_id = '10000' where CUST_ORDER_ID_EXT = '1-6555569';
select * from RK_STORE_ITEM_SOH where ID_STR_RT = '54194';
-- Update Store --
select * from simadmin.uin_detail where id = 1089353334; --uin = '896019170996586245';
update simadmin.uin_detail set store_id = 10058 where uin = '896019170996586257'; --'M01139661500';
update simadmin.uin_detail set store_id = 99951 where uin like 'M0113966149%'; --'M01139661500';

-- Update Stock Status --
update simadmin.uin_detail set status = 0 where uin = 'M01139661500';
--20143 is the store in SIT5 DB
commit;

select * from RK_STORE_ITEM_SOH where id_itm = 100010739 and id_str_rt = 10058;

select * from all_tab_columns where column_name = 'ID_STR_RT';
select * from PA_STR_RTL where x_celcom_store_type = 'Blue Cube'
and id_str_rt = 10058;

select * from AS_ITM -- 100010739
where x_level_1_value = 'DEVICE' and x_level_1_name = 'PRODUCT'
and DE_ITM like '%RGW%'
and x_level_2_name = 'CATEGORY' and x_level_2_value = 'FIX';
and x_level_3_name = 'BRAND' and x_level_3_value = 'BASEUS'
and x_level_4_name = 'MODEL' and x_level_4_value = 'MIC TO TYPE C'
; --where DE_ITM like 'ACC ADPTR BASEUS MIC%';

-- Query for Store --
SELECT * FROM (
SELECT * FROM (
select D.STORE_ID AS StoreId, A.ID_ITM AS ItemId, A.DE_ITM AS ItemDesc, A.X_LEVEL_4_VALUE AS Level4Value, A.X_LEVEL_5_VALUE AS Level5Value
,C.DEPT_NAME AS DeptName, C.CLASS_NAME AS ClassName, D.X_MSISDN AS ServiceNumber, D.UIN AS UIN 
,TO_CHAR(DATE_UTILS.CONVERT_TIME_ZONE(D.X_EXPIRY_DATE,'GMT','Asia/Kuala_Lumpur'),'YYYY-MM-DD HH:mm:ss') AS ExpiryDate, D.X_ST_IND AS StFlag 
FROM AS_ITM A, RK_HIERARCHY C, UIN_DETAIL D 
where D.STORE_ID = '10058' and A.ID_ITM = D.ITEM_ID and A.DEPT_ID = C.DEPT_ID(+) 
and A.CLASS_ID = C.CLASS_ID(+) and D.STATUS = 0 ) 
ORDER BY DBMS_RANDOM.VALUE ) 
WHERE 1=1;-- and rownum <= '10';

grant update on simadmin.uin_detail to TCS_V04392X;
grant execute on simadmin.transfer_test_data to TCS_V04392X;

-- RetrieveItemDetailsBySerialNumber
SELECT ROWNUM AS RowCount, 
		       A.ID_ITM AS ItemId, 
		       A.DE_ITM AS ItemDesc, 
		       A.X_SAP_MAT_CD AS Materialcode, 
		       A.x_level_1_value AS Level1Value, 
		       A.x_level_1_name AS Level1Name, 
		       A.x_level_2_value AS Level2Value, 
		       A.x_level_2_name AS Level2Name, 
		       A.x_level_3_value AS Level3Value, 
		       A.x_level_3_name AS Level3Name, 
		       A.x_level_4_value AS Level4Value, 
		       A.x_level_4_name AS Level4Name, 
		       A.x_level_5_value AS Level5Value, 
		       A.x_level_5_name AS Level5Name, 
		       C.Dept_Name AS DeptName, 
		       C.Class_Name AS ClassName, 
		       D.X_MSISDN AS ServiceNumber, 
		       D.UIN AS UIN, 
		       D.X_ST_IND  AS StFlag, 
		       D.IDENTIFIER  AS Identifier, 
		       D.STORE_ID  AS StoreId, 
		       TO_CHAR(DATE_UTILS.CONVERT_TIME_ZONE(D.X_EXPIRY_DATE,'GMT','Asia/Kuala_Lumpur'),'YYYY-MM-DD HH:mm:ss') AS ExpiryDate, 
		       CASE D.STATUS WHEN 0 THEN 'IN STOCK' WHEN 1 THEN 'SOLD' WHEN 2 THEN 'SHIPPED TO WH' WHEN 3 THEN 'SHIPPED TO STORE' WHEN 4 THEN 'RESERVED FOR SHIPPING' WHEN 5 THEN 'SHIPPED TO VENDOR' WHEN 6 THEN 'REMOVED FROM INVENTORY' WHEN 7 THEN 'UNAVAILABLE' WHEN 8 THEN 'MISSING' WHEN 9 THEN 'IN RECEIVING' WHEN 10 THEN 'RESERVED BY CUSTOMER' WHEN 11 THEN 'CUSTORD FULFILLED' WHEN 12 THEN 'SHIPPED TO FINISHER' WHEN 99 THEN 'UNCONFIRMED' ELSE 'UNKNOWN STATUS -' || D.STATUS END AS STATUS 	       
		FROM AS_ITM A, RK_HIERARCHY C, UIN_DETAIL D 
		WHERE 
		A.ID_ITM = D.ITEM_ID 
		and A.DEPT_ID = C.DEPT_ID(+) 
		and A.CLASS_ID = C.CLASS_ID(+) 
		and A.SUBCLASS_ID = C.SUBCLASS_ID(+) 
    AND D.STORE_ID = 10023 
    AND D.UIN = 'M01139661485';
    
