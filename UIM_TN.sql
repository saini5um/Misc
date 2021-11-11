select entityid, id, name, adminstate, objectstate, startdate, enddate, createddate from telephonenumber;

select * from telephonenumber;

select * from user_tables
where table_name like 'TN%';

select * from tnconsumer;
select * from tnassignment;

select * from tncondition;

select * from tnreservation;

select * from user_tab_columns
where table_name = 'TNCONDITION';
and column_name like '%DATE';

select * from TELEPHONENUMBERSPECIFICATION;
select * from equipment;

