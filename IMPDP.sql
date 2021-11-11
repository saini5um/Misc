select * from dba_directories;

create directory ATG_PMP as '/app';

select * from dba_tables
where table_name like 'CEL_GST%';

select * from SIEBEL.CEL_GST_TAXABILITY_TABLE;

drop table SIEBEL.CEL_GST_PRODUCT_TAX_TABLE;
drop table SIEBEL.CEL_GST_STARTERPACK_RULE;
drop table SIEBEL.CEL_GST_TAXABILITY_TABLE;