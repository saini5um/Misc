alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select 'CU13', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu13 b, bmf_trans_descr@celxcu13 r, descriptions@celxcu13 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU13', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU12', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu12 b, bmf_trans_descr@celxcu12 r, descriptions@celxcu12 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU12', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU11', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu11 b, bmf_trans_descr@celxcu11 r, descriptions@celxcu11 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU11', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU10', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu10 b, bmf_trans_descr@celxcu10 r, descriptions@celxcu10 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU10', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU09', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu09 b, bmf_trans_descr@celxcu09 r, descriptions@celxcu09 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU09', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU08', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu08 b, bmf_trans_descr@celxcu08 r, descriptions@celxcu08 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU08', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU07', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu07 b, bmf_trans_descr@celxcu07 r, descriptions@celxcu07 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU07', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU06', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu06 b, bmf_trans_descr@celxcu06 r, descriptions@celxcu06 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU06', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU05', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu05 b, bmf_trans_descr@celxcu05 r, descriptions@celxcu05 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU05', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU04', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu04 b, bmf_trans_descr@celxcu04 r, descriptions@celxcu04 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU04', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU03', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu03 b, bmf_trans_descr@celxcu03 r, descriptions@celxcu03 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU03', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU02', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu02 b, bmf_trans_descr@celxcu02 r, descriptions@celxcu02 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU02', 'Jul 2017', description_text, substr(b.batch_id, 1, 5)
union all
select 'CU01', 'Jul 2017', description_text, substr(b.batch_id, 1, 5) term, count(*) 
from bmf@celxcu01 b, bmf_trans_descr@celxcu01 r, descriptions@celxcu01 d
where trans_date >= '01-Jul-2017'
and trans_date < '01-Aug-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1
and bmf_trans_category = 1 and billing_category = 2
group by 'CU01', 'Jul 2017', description_text, substr(b.batch_id, 1, 5);

select d.DESCRIPTION_TEXT, b.* from BMF_TRANS_DESCR b, DESCRIPTIONS d
where b.description_code = d.description_code
and d.LANGUAGE_CODE = 1
and upper(description_text) like '%CPK%'
and trans_sign = -1;

select * from INTSAP.CELCOM_BRANCH_SAP_MAP;

select description_text, account_no, trans_date, b.TRANS_AMOUNT, b.TRANS_SUBMITTER, substr(b.batch_id, 1, 5) term, b.BATCH_ID, b.annotation, b.* 
from bmf b, bmf_trans_descr r, descriptions d
where trans_date >= '01-Aug-2017'
and trans_date < '01-Oct-2017'
and b.BMF_TRANS_TYPE = r.BMF_TRANS_TYPE
and r.description_code = d.description_code
and d.LANGUAGE_CODE = 1
--and upper(description_text) like '%CPK%'
and trans_sign = -1;
