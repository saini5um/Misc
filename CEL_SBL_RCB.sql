select t.name, o.created, o.ORDER_NUM, o.row_id, o.X_BCDP_LOGIN, o.X_ORDER_SUB_TYPE, x_reason_code, x_source, 
x_outlet_id, x_partner_id, o.X_DURATION
from s_order o, s_order_type t
where o.ORDER_TYPE_ID = t.row_id
and o.CREATED > ('17-Jun-2016')
and t.name = 'Release Call Bar';

select t.name, o.X_ORDER_SUB_TYPE, x_reason_code, x_source, count(*)
from s_order o, s_order_type t
where o.ORDER_TYPE_ID = t.row_id
and o.CREATED > ('15-Jun-2016')
and o.CREATED < ('16-Jun-2016')
and t.name = 'Release Call Bar'
group by t.name, o.X_ORDER_SUB_TYPE, x_reason_code, x_source;

select * from S_SRV_REQ_REL;

select * from S_ORDER_ATT;