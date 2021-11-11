select * from external_id_equip_map_view
where view_status = 2
and external_id_type = 1
--  and inactive_date is null
and external_id like '0127011422%';

select * from server_definition
where server_id = 11;