alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select m.SERIAL_NUM, p.name, p.part_num, count(*)
--select m.SERIAL_NUM, a.prod_id, m.prod_id, p.name, p.part_num, a.row_id, a.PAR_ASSET_ID, 
--a.ROOT_ASSET_ID, a1.ATTR_NAME, a1.CHAR_VAL 
from s_asset a, s_prod_int p, s_asset_xa a1, s_asset m
where m.prod_id = p.row_id
and a.ROOT_ASSET_ID = m.row_id
and m.serial_num like '01%'
--and a.ROOT_ASSET_ID = '1-34U0WD'
--and a.SERIAL_NUM = '0193380597'
and a.prod_id = '1-3VGH6'
and a.status_cd = 'Active'
and p.PART_NUM like 'RTP%'
and a1.char_val is not null
and a1.asset_id = a.row_id
group by m.SERIAL_NUM, p.name, p.part_num
having count(*) = 7;

SELECT a.*
--INTO V_COUNT
FROM SIEBEL.CX_NEWEASY_PH a, SIEBEL.S_PROD_INT PROD, SIEBEL.S_PRI_LST_ITEM c, SIEBEL.S_PROD_INT PLANPROD
WHERE a.x_prod_id=PROD.row_id AND
          PROD.row_id= c.prod_id AND 
          PROD.PART_NUM = 'MDR5584' and 
          PLANPROD.ROW_ID = a.X_PLAN_ID  AND 
          PLANPROD.PART_NUM = 'PB10840' AND 
          a.X_PROTECTION_CD = 'Without Protection' and 
          a.X_TYPE = 'Easy Phone'
          and a.x_source = 'Portal';
          
delete cx_neweasy_ph where row_id = '1-2UPKPKE';

select * From cx_neweasy_ph where X_PLAN_ID = '1-QVD3I3';
select row_id, created, part_num, name from s_prod_int where row_id = '1-1BHKYEY5';
select row_id, created, part_num, name from s_prod_int where part_num = 'MDR5584';

SELECT a.*
--INTO V_COUNT
FROM SIEBEL.CX_NEWEASY_PH a, SIEBEL.S_PROD_INT PROD, SIEBEL.S_PRI_LST_ITEM c, SIEBEL.S_PROD_INT PLANPROD
WHERE a.x_prod_id=PROD.row_id AND
          PROD.row_id= c.prod_id AND 
          PROD.PART_NUM = 'MDR5584' and 
          PLANPROD.ROW_ID = a.X_PLAN_ID AND 
          PLANPROD.PART_NUM = 'PB09890'; --AND 
          a.X_PROTECTION_CD = 'Without Protection' and 
--          a.X_TYPE = 'Easy Phone';
--          and a.x_source = 'Portal';

SELECT a.*
--INTO V_COUNT
FROM SIEBEL.CX_NEWEASY_PH a, SIEBEL.S_PROD_INT PROD, SIEBEL.S_PRI_LST_ITEM c, SIEBEL.S_PROD_INT PLANPROD
WHERE a.x_prod_id=PROD.row_id AND
          PROD.row_id= c.prod_id AND 
          PROD.PART_NUM = 'MDR5584' and 
          PLANPROD.ROW_ID = a.X_PLAN_ID AND 
          PLANPROD.PART_NUM = 'PB12100' AND ;
--          a.X_PROTECTION_CD = 'Without Protection' and 
--          a.X_TYPE = 'Easy Phone';
--          and a.x_source = 'Portal';

select * from s_prod_int where part_num = 'PB10840';
select row_id, created, name, part_num 
from s_prod_int where name like 'FiRST Gold Supreme CBS%' --'FiRST Platinum CBS%'--'FiRST Gold Supreme CBS%'
and PART_NUM like 'PB%';
select p.row_id, p.created, p.name, p.part_num, e.* 
from cx_neweasy_ph e, s_prod_int p
where x_plan_id = '1-Y3OKUM'
and e.x_prod_id = p.row_id
and p.name like 'S%'
and e.x_type = 'Easy Phone';

select distinct a.X_EMI AS EMIAMOUNT,a.X_CANCELLATION_KD_FEE AS KEEPDEVICECANCELLATIONFEE,a.X_UPFRONT AS UPFRONTAMOUNT,
c.MSRP_PRI_UNIT AS DEVICEPRICE, a.X_EXPRESS_NEWPH_FEE AS EXPRESSFEE, a.X_CHANGE_FEE AS CHANGEFEE, a.X_BUYOUT_FEE BUYOUTFEE, 
a.X_NON_SUBSIDIZED_FEE NONSUBFEE, a.X_CANCELLATION_RD_FEE RETRUNDEVCANFEE
from SIEBEL.CX_NEWEASY_PH a, SIEBEL.S_PROD_INT PROD,SIEBEL.S_PRI_LST_ITEM c, SIEBEL.S_PROD_INT PLANPROD, SIEBEL.S_PROD_INT_X PRODX
where a.x_prod_id=PROD.row_id AND 
          PROD.row_id= c.prod_id AND
          PROD.ROW_ID=PRODX.PAR_ROW_ID(+) AND
          PROD.PART_NUM = 'MDR5584' AND 
          PLANPROD.row_id(+) = a.x_plan_id AND
          (PLANPROD.part_num is null or PLANPROD.part_num = 'PB12100') AND
          a.X_PROTECTION_CD = 'Without Protection' AND 
          a.X_TYPE = 'Easy Phone' AND 
--          a.X_STATUS = "Active" AND
          a.x_source = 'Portal';
