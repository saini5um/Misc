select * from cmf where account_no = 182429820;

select * from bill_invoice where account_no = 182429820
order by BILL_SEQUENCE_NUM;

select description_text, b.TYPE_CODE, b.SUBTYPE_CODE, b.AMOUNT, b.TRANS_DATE 
from bill_invoice_detail b, descriptions d
where bill_ref_no = 674920189
and b.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1;
--674920189

select description_text, tracking_id, n.type_id_nrc, TRANSACT_DATE, rate, rate_dt, annotation 
from nrc n, nrc_trans_descr t, descriptions d
where billing_account_no = 182429820
and n.TYPE_ID_NRC = t.TYPE_ID_NRC
and t.DESCRIPTION_CODE = d.description_code
and d.language_code = 1;
