select * from service_alias_list_t where name = '092887742011';

select * from user_tables where table_name like 'SERVICE%';

select * From service_t where poid_id0 in (191232865577,191232865193,191232867049);

select * From account_t where poid_id0 = 191232867785;

select * from account_nameinfo_t where obj_id0 = 191232867785;

select * from event_t where account_obj_id0 = 191232867785
order by created_t desc;