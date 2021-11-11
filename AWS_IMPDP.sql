create user poc_mds identified by uim123;
grant create session, resource to poc_mds;
alter user poc_mds quota 100M on users;

SELECT rdsadmin.rdsadmin_s3_tasks.download_from_s3(
      p_bucket_name    =>  'uimdbdump',       
      p_directory_name =>  'DATA_PUMP_DIR') 
   AS TASK_ID FROM DUAL; 
-- 1590846677969-655

select * from user_datapump_jobs;
select * from dba_directories;
select * from dba_users;

DECLARE
hdnl NUMBER;
BEGIN
hdnl := DBMS_DATAPUMP.OPEN( operation => 'IMPORT', job_mode => 'SCHEMA', job_name=>null);
--DBMS_DATAPUMP.ADD_FILE( handle => hdnl, filename => 'mds.dmp', directory => 'DATA_PUMP_DIR', filetype => dbms_datapump.ku$_file_type_dump_file);
DBMS_DATAPUMP.ADD_FILE( handle => hdnl, filename => 'mds.dmp', directory => 'DATA_PUMP_DIR');
DBMS_DATAPUMP.ADD_FILE( handle => hdnl, filename => 'poc_mds_imp.log', directory => 'DATA_PUMP_DIR', filetype => dbms_datapump.ku$_file_type_log_file);
DBMS_DATAPUMP.METADATA_FILTER(hdnl,'SCHEMA_EXPR','IN (''POC_MDS'')');
DBMS_DATAPUMP.START_JOB(hdnl);
END;
/    


