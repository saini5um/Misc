select * from user_tables where table_name like '%RESOU%';
select * from user_tab_columns where column_name like '%RESOUR%';
select * from product_t where upper(descr) like '%BOOST%';

select * from config_t;
select * from OFFER_PROFILE_T;
select * from OFFER_PROFILE_TIERS_T where obj_id0 = 5254909014;
select * from OFFER_PROFILE_POLICY_LABELS_T where obj_id0 = 5254909014;

select * from EVENT_BAL_IMPACTS_T;

select p.code, p.name, l.label, l.RESOURCE_NAME, l.resource_id, t.*
from offer_profile_t p, offer_profile_policy_labels_t l, OFFER_PROFILE_TIERS_T t
where p.poid_id0 = l.OBJ_ID0
and p.POID_ID0 = t.OBJ_ID0
and l.REC_ID = t.REC_ID;

select poid_id0, poid_rev, unix2date(created_t), unix2date(mod_t), name, code from plan_t;

select poid_id0, poid_rev, unix2date(created_t), unix2date(mod_t), name, code, descr, permitted from deal_t;
select * from deal_products_t;
select * from DEAL_DISCOUNTS_T;
select * from rate_plan_t where POID_ID0 = 161070295; -- 161070295
select * from rate_t where POID_ID0 = 161068247;
select * from RATE_QUANTITY_TIERS_T where OBJ_ID0 = 161068247; -- 161068247
select * from RATE_BAL_IMPACTS_T
where element_id in (2000012, 2000090); -- 2000012

select * from product_t where POID_ID0 = 161069271;
select * from RATE_T r, RATE_BAL_IMPACTS_T b
where r.POID_ID0 = b.OBJ_ID0;

select p.name, s.SERVICE_OBJ_TYPE, s.SERVICE_ID, rec_id
from plan_t p, PLAN_SERVICES_T s
where p.POID_ID0 = s.OBJ_ID0
order by s.OBJ_ID0, s.REC_ID;

select p.name, d.NAME, s.*
from plan_t p, PLAN_SERVICES_DEALS_T s, DEAL_T d
where p.POID_ID0 = s.OBJ_ID0
and s.DEAL_OBJ_ID0 = d.POID_ID0
order by s.OBJ_ID0, s.REC_ID, s.REC_ID2;

select * from DEAL_DETAILS;
select * from PLAN_SERVICES_DEALS_T;
select * from CONFIG_BEID_BALANCES_T
order by rec_id;

-- rate and balance impacts for product
select p.name, p.POID_ID0, p.code, c.NAME, b.* 
from product_t p, rate_plan_t t, rate_t r, rate_bal_impacts_t b, config_beid_balances_t c
where p.POID_ID0 = p.POID_ID0
and t.PRODUCT_OBJ_ID0 = p.POID_ID0
and t.POID_ID0 = r.RATE_PLAN_OBJ_ID0
and r.POID_ID0 = b.OBJ_ID0
and b.ELEMENT_ID = c.rec_id
--and p.POID_ID0 = 4125045
--and b.ELEMENT_ID = 840
and b.IMPACT_CATEGORY is null
order by p.POID_ID0, b.OBJ_ID0, b.rec_id;

select * from rate_plan_t where PRODUCT_OBJ_ID0 = 4125045;
select * from rate_t where RATE_PLAN_OBJ_ID0 in (4126069, 4125557, 4126581); --= 4125759;
select * from RATE_BAL_IMPACTS_T where OBJ_ID0 = 4127093;
select 11.214953*1.07 from dual;

select 2*1024*1024*1024 from dual; -- -2147483648

-- products in a deal
select d.POID_ID0, d.name, p.name, p.* 
from deal_t d, deal_products_t t, product_t p
where d.POID_ID0 = t.OBJ_ID0
and t.PRODUCT_OBJ_ID0 = p.POID_ID0
--and p.PROVISIONING_TAG is not null
order by 1, p.POID_ID0;

-- discounts in a deal
select d.POID_ID0, d.name, p.name, p.* 
from deal_t d, DEAL_DISCOUNTS_T t, discount_t p
where d.POID_ID0 = t.OBJ_ID0
and t.discount_OBJ_ID0 = p.POID_ID0
--and p.PROVISIONING_TAG is not null
order by 1, p.POID_ID0;

select p.name, c.name, l.* 
from plan_limit_t l, plan_t p, CONFIG_BEID_BALANCES_T c
where p.POID_ID0 = l.OBJ_ID0
and l.REC_ID = c.REC_ID
order by 3, 4;
