alter session set nls_date_format = 'DD-Mon-YYYY HH24:MI:SS';

select * from CUSTOMER_ID_EQUIP_MAP
where external_id = '0136229855';

select description_text, p.* 
from product p, product_elements e, descriptions d
where p.element_id = e.element_id
and e.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and p.parent_subscr_no = 11083702
and p.parent_subscr_no_resets = 0
--and p.element_id = 10005
and p.PRODUCT_INACTIVE_DT is null;

update product_view set view_status = 3 where view_id = 35066469011;

select * from cmf_balance where account_no = 152961340;
select * from bmf where account_no = 152961340;
select * from bmf_distribution where bmf_tracking_id = 21470489;

select status, count(*) from user_triggers group by status;

select * from user_triggers where status = 'DISABLED';



select * from product_view where tracking_id = 19494708;

select * from cmf where account_no = 152961490;

select * from ord_order where account_no = 152961490 order by create_dt desc;

select i.* from ord_item i, ord_service_order o
where o.service_order_id = i.service_order_id
and o.order_id = 23532082011;
