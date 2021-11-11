alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';
select * from s_prod_int
where PART_NUM like 'SM00010%'; -- 20005121

select * from s_prod_int
where name like '%Wonder%';

select o.order_num, o.created + 8/24, t.name, o.X_ORDER_SUB_TYPE, o.STATUS_CD, p.name, p.part_num, i.action_cd, o.X_SOURCE
from s_order o, s_order_type t, s_order_item i, s_prod_int p
where o.created > to_date('08-Sep-2016') - 8/24
and o.created < to_date('09-Sep-2016') - 8/24
and o.ORDER_TYPE_ID = t.row_id
and o.row_id = i.order_id
and i.prod_id = p.row_id
and p.name like 'Wonder%';

select o.order_num, o.created + 8/24, t.name, o.X_ORDER_SUB_TYPE, o.STATUS_CD, p.name, p.part_num, i.action_cd, 
o.X_SOURCE, o.accnt_id, i.ASSET_ID, i.ASSET_INTEG_ID, i.ROOT_ORDER_ITEM_ID
from s_order o, s_order_type t, s_order_item i, s_prod_int p
where o.created > to_date('09-Sep-2016') - 8/24
and o.created < to_date('10-Sep-2016') - 8/24
and o.ORDER_TYPE_ID = t.row_id
and o.row_id = i.order_id
and i.prod_id = p.row_id
and p.name like 'Wonder%';

select a.desc_text, a.ROOT_ASSET_ID, r.desc_text, r.SERIAL_NUM
from s_asset a, s_asset r
where a.integration_id in ('1-155WIVUB',
'1-1561MUMB',
'1-155WMIHG',
'1-155ZI7OJ')
and a.root_asset_id = r.ROW_ID;

select root_asset_id, a.created, a.row_id, a.START_DT, p.part_num, p.name, a.OWNER_ACCNT_ID, e.name
from s_asset a, s_prod_int p, s_org_ext e 
where a.prod_id = p.row_id
and p.part_num like 'GV%3%'
and a.OWNER_ACCNT_ID = e.ROW_ID
and ROOT_ASSET_ID in (
'1-IR3T-3194',
'1-IUVK-1194',
'1-ISO4-461',
'1-ISQH-3299',
'1-ISXK-831',
'1-ISJI-147',
'1-IS5C-1405',
'1-13SV0UD3',
'1-IQQJ-3783',
'1-12A7LT22',
'1-129SLG7F',
'1-12AFF2ON',
'1-12F4ZAT2',
'1-126QPVF8',
'1-11BNARAT',
'1-11HOF6MI',
'1-N69T5Z3',
'1-12QI0VMH',
'1-TF7LFOJ',
'1-13MBZ0TL',
'1-11H4I0YS',
'1-10SFXKX5',
'1-11HIVEEI',
'1-1238PEM7',
'1-12E7MQ1G',
'1-X1NP6FC',
'1-1218QBNP',
'1-11LYK5IT',
'1-127L4ZVN',
'1-1536O8YX',
'1-14RGLX8Y',
'1-14LPY6C7',
'1-14MBN6ZP',
'1-13DFA2O0',
'1-130G02SB',
'1-IHB48P2',
'1-XVS6TST',
'1-R7H3EB0',
'1-11SW6GUH',
'1-1347NYJ5',
'1-14M1MLB4',
'1-OVGI8UY',
'1-LHAO-858',
'1-LI12-885',
'1-Z5CRNHL',
'1-131PHR4X');

select o.accnt_id, i.ASSET_INTEG_ID, a.ROOT_ASSET_ID
from s_order o, s_order_item i, s_prod_int p, s_asset a
where o.row_id = i.order_id
and i.prod_id = p.row_id
and p.name like 'Wonder%'
and i.asset_integ_id = a.integration_id
and o.order_num in 
('1-89787697639',
'1-89789480274',
'1-89760440130',
'1-89761464870',
'1-89773870212',
'1-89781726130',
'1-89797922456',
'1-89722568690',
'1-89733967906',
'1-89734745425',
'1-89736396387',
'1-89731611029',
'1-89733893600',
'1-89747571558',
'1-89756961517',
'1-89757861981',
'1-89691532560',
'1-89693737340',
'1-89715521217',
'1-89713955215',
'1-89713955215',
'1-89709221568',
'1-89714090815',
'1-89716863316',
'1-89679960229',
'1-89690713086',
'1-89656518066',
'1-89672470466',
'1-89668520980',
'1-89656518066',
'1-89672470466',
'1-89671878790',
'1-89679874725',
'1-89651006790',
'1-89649866710',
'1-89630897536',
'1-89585424543',
'1-89599232164',
'1-89610042423',
'1-89610043167',
'1-89610997973',
'1-89610920583',
'1-89613032558',
'1-89584453650',
'1-89594686293',
'1-89594686767',
'1-89599118794',
'1-89617959350',
'1-89618675546',
'1-89580237477',
'1-89592116330',
'1-89594175000',
'1-89596366897',
'1-89614666222',
'1-89615910322');


select a.row_id, root_asset_id, a.created, a.desc_text, a.serial_num, p.PART_NUM
from s_asset a, s_prod_int p 
where root_asset_id in ('1-IR3T-3194',
'1-ISO4-461',
'1-IUVK-1194')
and a.PROD_ID = p.row_id
and p.PART_NUM like 'GV%'
order by root_asset_id, a.row_id;

select o.order_num, o.created + 8/24, t.name, o.X_ORDER_SUB_TYPE, o.STATUS_CD, p.name, p.part_num, i.action_cd, o.X_SOURCE
from s_order o, s_order_type t, s_order_item i, s_prod_int p
where --o.created > to_date('08-Sep-2016') - 8/24
--and o.created < to_date('09-Sep-2016') - 8/24
o.ORDER_TYPE_ID = t.row_id
and o.row_id = i.order_id
and i.prod_id = p.row_id
and o.order_num in (
'1-89789480274',
'1-89731611029',
'1-89713955215',
'1-89713955215',
'1-89656518066',
'1-89672470466',
'1-89656518066',
'1-89672470466',
'1-89671878790');


select * from user_tab_columns where column_name like '%MAT%'
and table_name like 'S_%';

select * from user_tables where table_name like '%ATTR%';

select * from s_prod_int_x;

select * from s_xa_attr;

select * from s_srv_req_xm;

select * from s_inv_prof where row_id = '1-IDSL-1692';

select * from s_org_ext where row_id = '1-IABW-2175';