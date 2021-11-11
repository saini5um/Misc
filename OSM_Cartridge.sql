select * from user_tables
where table_name like 'OM%DATA%';

select * from user_tab_columns where column_name = 'DATA_DICTIONARY_ID';

select * from om_order_data_dictionary where cartridge_id = 2;
select * from om_order_hier where cartridge_id = 2;

select d.data_dictionary_mnemonic tag, d.attribute_type, p.data_dictionary_mnemonic parent, h.* 
from om_order_data_dictionary d, om_order_hier h, om_order_data_dictionary p
where d.data_dictionary_id = h.data_dictionary_id
and h.parent_node_id = p.data_dictionary_id
--and d.cartridge_id = 2
and d.attribute_type <> 'CR';

select * from om_order_data_dictionary 
where data_dictionary_id = 10038;

select * from om_state;

select * from om_cartridge;

select * from om_order_type;

select * from om_order_source;

select * from om_order_view;

select * from om_order_header;

select * from om_orch_order_item;
