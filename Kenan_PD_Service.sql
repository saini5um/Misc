alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select * from customer_id_equip_map where external_id = '0199325555';

select * from customer_id_equip_map_view where external_id = '0197608646';

select * from ord_order where account_no = 86733410
order by create_dt desc;