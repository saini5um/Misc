select * from user_tables where table_name like '%DATA%';
select * from user_sequences;

select * from data_t where name like '%%';

select * from user_tab_partitions
where table_name like '%DAT%';

select * from user_partition_key;

select * from event_t;

select floor(sysdate - to_date('01-JAN-1970', 'DD-MON-YYYY') + 1)*pin_partition.power_44_of_2 from dual;
select sysdate - to_date('01-JAN-1970', 'DD-MON-YYYY') from dual;
select sysdate from dual;

select * from pin_temp_high_val_t;

select * From dual;

select pin_partition.poid_to_