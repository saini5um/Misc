select * from arbor.account_category_ref; --order_item_assoc;

select * from all_tables 
where owner = 'ARBOR'
and table_name like 'WFM%';

select * from arbor.ord_item_route where item_type_id = 203;

select * from ARBOR.WFM_WORKFLOW_TRANS where workflow_id = 203;

select * from ARBOR.WFM_ACTIVITY_def where workflow_id = 203;

select * from arbor.wfm_milestone_ref where milestone_id = 9499;

select * From arbor.wfm_milestone_values where milestone_id = 9499;

select v.display_value, m.milestone_id, m.QUEUE_TYPE_ID 
from arbor.wfm_milestone_ref m, arbor.wfm_milestone_values v
where m.milestone_id = v.milestone_id
and v.language_code = 1
order by 2;

select * from ARBOR.GRS_ACTION_DEFINITION where action_id = 6002 order by line_number;

select * from arbor.grs_action_definition where xml_line like '%AUTOBAHN%';

select * from ARBOR.ORD_ITEM_TYPE_VALUES where item_type_id = 203;

select * from ARBOR.ORD_SERVICE_ORDER_TYPE_VALUES;

select * from ARBOR.ORD_ITEM_ACTION_VALUES;

select * from arbor.ord_item_type_assoc
where member_type = 10 and member_ID = 10004
and service_order_type_id = 20;

select description_text, p.* 
from arbor.product_elements p, arbor.descriptions d
where ELEMENT_ID = 10004
and p.description_code = d.description_code
and language_code = 1;

select * from emf_config_id_values
where language_code = 1
order by 1;
