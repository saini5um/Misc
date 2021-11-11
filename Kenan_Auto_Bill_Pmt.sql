select * from bmf_trans_descr;

select * from bmf b, bmf_trans_descr t
where b.BMF_TRANS_TYPE = t.BMF_TRANS_TYPE
and b.bmf_trans_Type = 820
and b.TRANS_DATE > '1-Jan-2016';

select * From ccard_list where account_no = 110942860
order by ccard_id;
234981

select account_no, pay_method, default_ccard_id 
from cmf where pay_method <> 1;
where DEFAULT_CCARD_ID <> 0;

select pay_method, count(*) from cmf
group by pay_method;

select * from cmf where account_no = 110942860;

select description_text, b.* 
from bmf b, bmf_trans_descr t, descriptions d
where account_no = 110942860
and b.bmf_trans_type = t.bmf_trans_type
and t.description_code = d.description_code
and d.LANGUAGE_CODE = 1
order by trans_date desc;

select * from bmf where bmf_trans_type = 160
and trans_date > '1-Jan-2016';

select * from cmf where account_no in (15334270, 14836800);

select * from CMF_EXT_DATA where account_no in (15334270, 14836800)
order by param_id, account_no;

select description_text, c.* from customer_contract c, contract_types t, descriptions d 
where parent_account_no in (15334270, 14836800)
and end_dt is null
and c.contract_type = t.CONTRACT_TYPE
and t.DESCRIPTION_CODE = d.description_code
and language_code = 1;

select * from bmf where bmf_trans_type = 160
and trans_date > '1-Jan-2016';

select * From service where parent_account_no = 60722751;

select description_text, p.* 
from product p, product_elements e, descriptions d
where billing_account_no = 60722751
and p.element_id = e.element_id
and e.description_code = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1;

select description_text, c.* from customer_contract c, contract_types t, descriptions d 
where parent_account_no in (60722751)
and end_dt is null
and c.contract_type = t.CONTRACT_TYPE
and t.DESCRIPTION_CODE = d.description_code
and language_code = 1;

select description_text, b.* 
from bmf b, bmf_trans_descr t, descriptions d
where account_no = 60722751
and b.bmf_trans_type = t.bmf_trans_type
and t.description_code = d.description_code
and d.LANGUAGE_CODE = 1
order by trans_date desc;

select * from cmf where account_no in (51789448,
51904956,
52389468,
52457072,
52484060,
52510255);
