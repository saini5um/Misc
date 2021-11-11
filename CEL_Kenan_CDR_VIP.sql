alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select description_text, c.trans_id, c.type_id_usg, account_no, subscr_no, subscr_no_resets, external_id, point_origin, 
c.POINT_TARGET, trans_dt, primary_units, amount 
from cdr_data c, usage_types u, descriptions d
where trans_dt > '20-Sep-2017' and subscr_no in (
10920783,11143406,11415159,11446523,15209366,15727606,17010280
) and subscr_no_resets = 0
and c.TYPE_ID_USG = u.TYPE_ID_USG
and u.DESCRIPTION_CODE = d.DESCRIPTION_CODE
and d.LANGUAGE_CODE = 1
and trans_id like 'REC%'
order by c.subscr_no, c.trans_dt;

select * from local_server_id;