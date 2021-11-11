select bucket, count(*) from (
select account_obj_id0, case 
when cnt < 10 then '0-10' 
when cnt >=10 and cnt < 20 then '10-20'
--when cnt >=15 and cnt < 20 then '15-20'
when cnt >=20 and cnt < 30 then '20-30'
--when cnt >=25 and cnt < 30 then '25-30'
when cnt >= 30 then '30-'
end bucket from (
select g.ACCOUNT_OBJ_ID0, count(unique r.name) cnt--r.NAME, r.BEID_STR_CODE, count(*) --unix2date(s.valid_from), unix2date(s.valid_to), s.* 
from bal_grp_t g, bal_grp_bals_t b, bal_grp_sub_bals_t s, CONFIG_BEID_BALANCES_T r, account_t a --, PURCHASED_PRODUCT_T p, product_t t
where g.POID_ID0 = b.OBJ_ID0
and b.OBJ_ID0 = s.OBJ_ID0
and b.REC_ID = s.REC_ID2
and s.rec_id2 = r.rec_id
and g.account_obj_id0 = a.POID_ID0
and a.AAC_SERIAL_NUM = 'SA'
and a.status = 10100
--and exists ( select 1 from purchased_product_t p
--where p.account_obj_id0 = a.poid_id0 and p.plan_obj_id0 = 4130260)
group by g.account_obj_id0))
group by bucket;
