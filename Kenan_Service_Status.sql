select * from all_tables where table_name like '%STATUS%';

select * from status_reason_map;

select * from status_type_map;

select * from status_values;

select * from status_reason_values@CELXADM
where display_value like '%Port%';

select * from emf_status_values;

select * from emf_status_chg_reason_values;

select * from emf_config_id_ref
where language_code = 1;

select * from all_tab_columns
where column_name = 'EMF_CONFIG_ID';

select * from emf_config_id_values@CELXADM;

select * from customer_id_equip_map
where external_id = '0197576416';

select * from service_status where subscr_no = 13466595 and subscr_no_resets = 0;

select * from service where subscr_no = 12476074
and subscr_no_resets = 0;
