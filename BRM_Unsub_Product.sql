alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select COLUMN_NAME from user_tab_columns 
where table_name = 'PURCHASED_PRODUCT_T'
order by COLUMN_ID;

select * from PRODUCT_T;

select * from user_tables where table_name like '%BAL%GRP%_T';
select * from BAL_GRP_SUB_BALS_T;
select * from au_bal_grp_t;

select t.name prod, t.DESCR, c.name counter, p.STATUS, unix2date(p.PURCHASE_START_T),unix2date(p.PURCHASE_END_T),
unix2date(s.valid_from), unix2date(s.valid_to), s.current_bal, s.next_bal, s.delayed_bal, s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, PURCHASED_PRODUCT_T p, product_t t, CONFIG_BEID_BALANCES_T c
where g.ACCOUNT_OBJ_ID0 = 105017029681
and g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.GRANTOR_OBJ_ID0 = p.POID_ID0
and s.GRANTOR_OBJ_TYPE = '/purchased_product'
and p.PRODUCT_OBJ_ID0 = t.POID_ID0
and s.REC_ID2 = c.rec_id;

select t.name, t.descr, unix2date(p.created_t), unix2date(p.mod_t), UNIX2DATE(effective_t), unix2date(cycle_start_t), 
unix2date(cycle_end_t), unix2date(purchase_start_t), unix2date(p.PURCHASE_END_T), unix2date(instantiated_t), p.* 
from purchased_product_t p, product_t t
where p.ACCOUNT_OBJ_ID0 = 105017029681
and p.purchase_end_t > 0
and p.PRODUCT_OBJ_ID0 = t.POID_ID0;

select c.name, UNIX2DATE(valid_from), unix2date(valid_to), b.* 
From BAL_GRP_SUB_BALS_T b, CONFIG_BEID_BALANCES_T c
where b.obj_id0 = 105017030193
and GRANTOR_OBJ_ID0 = 105017031693
and b.REC_ID2 = c.REC_ID;

select UNIX2DATE(valid_from), UNIX2DATE(valid_to), rec_id2, GRANTOR_OBJ_ID0, GRANTOR_OBJ_TYPE, c.name
from BAL_GRP_SUB_BALS_T b, CONFIG_BEID_BALANCES_T c
where /*valid_to > 0 
and VALID_TO < valid_from
and */ b.OBJ_ID0 = 105009248851
and b.GRANTOR_OBJ_ID0 = 105009247943
and b.REC_ID2 = c.REC_ID;

select UNIX2DATE(created_t), unix2date(mod_t), p.* 
from PURCHASED_PRODUCT_T p
where p.PRODUCT_OBJ_ID0 = 4125023
and p.CYCLE_END_T = 0
and created_t >= to_epoch(to_date('09-Mar-2019', 'dd-Mon-YYYY'))
and created_t <= to_epoch(to_date('14-Mar-2019', 'dd-Mon-YYYY'));

--Plus_2020_NRC_CO Purchased 01-Mar-2019 and Unsubscribed 12-Mar-2019
select t.name, t.POID_ID0, UNIX2DATE(p.created_t), UNIX2DATE(p.mod_t), UNIX2DATE(effective_t), unix2date(cycle_start_t), 
unix2date(cycle_end_t), unix2date(purchase_start_t), unix2date(p.PURCHASE_END_T), unix2date(instantiated_t), p.* 
from PURCHASED_PRODUCT_T p, product_t t
where p.PRODUCT_OBJ_ID0 = t.POID_ID0
and p.POID_ID0 = 105009247943;
-- Unsubscribe will update mod_t, effective_t, cycle_end_t, purchase_end_t

select * from BAL_GRP_BALS_T where OBJ_ID0 = 105017030193;
select c.name, unix2date(valid_from), b.* 
from BAL_GRP_SUB_BALS_T b, CONFIG_BEID_BALANCES_T c 
where b.OBJ_ID0 = 105009248851
and b.REC_ID2 = c.REC_ID
--and b.rec_id2 = 702
order by b.rec_id;

select * from BAL_GRP_T where ACCOUNT_OBJ_ID0 = 105009246803;
select 
