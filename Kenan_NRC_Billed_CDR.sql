alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select account_no, bill_lname, bill_fname, bill_period from cmf where account_no = 188141930;

select * from bill_invoice where account_no = 188141930;

select d.DESCRIPTION_TEXT, b.AMOUNT, b.* 
from bill_invoice_detail b, descriptions d
where bill_ref_no = 675925224 and bill_ref_resets = 0
and b.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1
and type_code <> 5;

select description_text, n.rate, n.* from nrc n, NRC_TRANS_DESCR t, descriptions d
where billing_account_no = 188141930
and n.TYPE_ID_NRC = t.TYPE_ID_NRC
and t.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1;

select * from ord_order where account_no = 188141930;

select * from ORD_SERVICE_ORDER where ORDER_ID = 35603014011; --35568278011;
--35568281011;

select * from ORD_ITEM where service_order_id = 35018630011;
35018630011;

select c.trans_dt, c.POINT_ORIGIN, c.POINT_TARGET, c.EXTERNAL_ID, b.BILLED_AMOUNT, description_text, c.ANNOTATION
from cdr_billed b, cdr_data c, usage_types u, DESCRIPTIONS d
where b.account_no = 188141930
and b.subscr_no = 16975350 and b.subscr_no_resets = 0
and b.bill_ref_no = 675925224 and b.bill_ref_resets = 0
and b.msg_id = c.msg_id
and b.MSG_ID2 = c.MSG_ID2
and b.MSG_ID_SERV = c.MSG_ID_SERV
and b.SPLIT_ROW_NUM = c.SPLIT_ROW_NUM
and c.TYPE_ID_USG = u.TYPE_ID_USG
and u.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.language_code = 1
and b.BILLED_AMOUNT <> 0
order by c.trans_dt;

select description_text, n.* 
from nrc_trans_descr n, descriptions d
where n.type_id_nrc in (91529, 91530)
and n.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1;
