select * from dba_tablespaces;
select * from v$datafile;

create tablespace uim_large_data
datafile '/scratch/oracle/oradata/orcl/pdbuim/data_001M01_01.dbf' size 2200M
extent management local
uniform size 1M;

create temporary tablespace uim_large_temp
tempfile '/scratch/oracle/oradata/orcl/pdbuim/temp_001M01_01.dbf' size 1600M
extent management local
uniform size 1M;

/scratch/oracle/oradata/orcl/pdbuim/users01.dbf
