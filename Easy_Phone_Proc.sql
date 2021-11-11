alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select o.name Cust_Name,
        o.x_cust_id_type Cust_id_type,
        o.loc Cust_id,
        (select serial_num from siebel.s_asset where row_id=a.root_asset_id) SerialNumber,
        (select name from siebel.s_prod_int where 
            row_id=(select promotion_id from siebel.s_asset where row_id=a.root_asset_id)) ProdPromName,
        p.name Contract_Name,
        (select p1.name
        from siebel.s_asset a1,siebel.s_prod_int p1
        where a1.prod_id=p1.row_id
        and a1.par_asset_id=a.par_asset_id
        and p1.type='Device'
        and p1.serialized_flg='Y'
        and a1.status_cd in ('Active','Suspended')) Device_Name,
        case (select T1.VOD_NAME
            from siebel.s_prod_int pp,siebel.s_asset aa,siebel.s_vod t1,
                    siebel.S_ISS_OBJ_DEF t2, siebel.S_VOD t3
            where aa.row_id=a.par_asset_id
            and aa.prod_id=pp.row_id
            and pp.cfg_model_id=t3.object_num
            and t2.VOD_ID = t3.row_id
            and T2.LAST_VERS = '999999999' 
            and t1.OBJECT_NUM = T2.PAR_VOD_ID) 
            when 'Device ICC' then 'Device'
            when 'Easy Phone VAS ICC' then 'Easy Phone'
            when 'New Phone ICC' then 'New Phone'
            when 'New Phone VAS ICC' then 'New Phone'
            else 'Plan' end as contract_type,
            a.start_Dt+1/3 start_date,
            (a.start_Dt+1/3 + (p.SERVICE_LENGTH/12)*365) end_date,
            a.bill_accnt_id Bill_Account_Id,
            (select ou_num from siebel.s_org_ext where row_id=a.bill_accnt_id) Bill_Account_Number,
            a.bill_profile_id Bill_Profile_id
from siebel.s_asset a,siebel.s_prod_int p,siebel.s_org_ext o
where 1=1
and a.prod_id=p.row_id
and a.owner_accnt_id=o.row_id
and a.status_cd in ('Active','Suspended')
and p.fulflmnt_item_code in ('Contract ICC', 'Penalty ICC')
and o.x_cust_id_type='New NRIC' and o.loc='860520305343';

select loc, created, name, row_id, X_CUST_ID_TYPE, OU_NUM from s_org_ext where loc = '901114137397';
select loc, created, name, row_id, X_CUST_ID_TYPE, OU_NUM from s_org_ext where row_id = '1-HYAR-782';

select a.created, a.row_id, a.SERIAL_NUM, a.STATUS_CD, p.name, p.FULFLMNT_ITEM_CODE
from s_asset a, s_prod_int p
where OWNER_ACCNT_ID = '1-HYAR-782' and a.status_cd in ('Active', 'Suspended')
and p.fulflmnt_item_code = 'Contract ICC'
and a.prod_id = p.row_id;

select a.created, a.row_id, a.SERIAL_NUM, a.STATUS_CD, p.name, p.FULFLMNT_ITEM_CODE
from s_asset a, s_prod_int p, s_org_ext o
where a.OWNER_ACCNT_ID = o.row_id
and a.status_cd in ('Active', 'Suspended')
and p.fulflmnt_item_code = 'Contract ICC'
and a.prod_id = p.row_id
and ;

select SERIAL_NUM, OWNER_ACCNT_ID, BILL_ACCNT_ID, BILL_PROFILE_ID, ROOT_ASSET_ID 
from s_asset where serial_num = '0198797798'
and STATUS_CD = 'Active';
