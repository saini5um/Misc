Select SN_START,SN_END,ltrim(distb_code,'0') as DISTB_CODE,PRICE,DO_NUMBER,EXPIRY_DATE,SO_NO,PLANT,ltrim(SAP_CUST,0) as SAP_CUST,
material_code, ltrim(MATERIAL_CODE,0) as MAT_CODE,BATCH_NO,CHARGE_TYPE,MAT_IND,itf_note,itf_status,itf_date,itf_time,
STOCK_TYPE,LGORT,MSISDN,TRACKING_NO,DELIVERED_STATUS From Sapcep.ZBSS_SD_FLAGSHIP 
where SO_NO = '1002417704' -- 896019170996585711
-- ITF_STATUS = 'N'
--and DELIVERED_STATUS = 'N' 
and CHARGE_TYPE = 'O'
and itf_date > '2018'
order by itf_date desc;

update Sapcep.ZBSS_SD_FLAGSHIP 
set itf_status = 'N' --, sn_start = '896019170996586292', SN_END = '896019170996586292'
where so_no = 1002417704 
and material_code = '000000000020009721'; -- 20009721 SIM Card

update Sapcep.ZBSS_SD_FLAGSHIP 
set itf_status = 'N' --, sn_start = '896019170996586301', SN_END = '896019170996586301'
where so_no = 1002417217
and material_code = '000000000020010219';

select * from Sapcep.ZBSS_SD_FLAGSHIP where msisdn = '0196024560';

Select * From Sapcep.ZBSS_SD_FLAGSHIP 
where SO_NO = '1002417704' -- 896019170996585711
-- ITF_STATUS = 'N'
--and DELIVERED_STATUS = 'N' 
and CHARGE_TYPE = 'O'
and itf_date > '2018'
order by itf_date desc;