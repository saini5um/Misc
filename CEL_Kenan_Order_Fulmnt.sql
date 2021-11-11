alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from ord_order where account_no = 153025220; --153025160;

select * from ORD_SERVICE_ORDER where order_id = 23565142011;

select * from ord_item where SERVICE_ORDER_ID = 20915450011;

select * from customer_id_acct_map where external_id = '800320123456';
select * from cmf where account_no = 153025160;
select * from ord_order where account_no = 153025160;
select * from ord_service_order where ORDER_ID = 23565126011;

select * from ord_item where service_order_id = 20915424011;

select * from ORD_ORDER_STATUS_VALUES;

select * from customer_id_equip_map_view where external_id = '0196087638'
and external_id_type = 1; --11091062 --9484315011

select * from customer_id_equip_map_view where view_id = 9484313011;