DECLARE
    l_rcursor sys_refcursor;
  v_cur SYS_REFCURSOR;
  v_loc varchar2(100);
  v_id_type varchar2(60);
  status_cd varchar2(10);
  error_cd varchar2(10);
  errmsg   VARCHAR2(500);
  sql_trc   VARCHAR2(32000);
    l_statecode   VARCHAR2(2);
    l_col_type    VARCHAR2(100) ;
    l_cursor_name VARCHAR2(100) ;
    l_colCnt      NUMBER;
    l_descTbl dbms_sql.desc_tab;
  BEGIN
  v_loc := 'WWWW3333'; --'980906768765';
  v_id_type := 'Passport';
--    listzipcode_pkg.list_by_statecode_p( statecode_p => l_statecode ,
--    zipcode_list_rc => l_rcursor) ;
  osb_usr.CEL_ATG_CUSTOMER_RETRIEVE_ENT(null, v_loc, v_id_type, null, null, v_cur, status_cd, error_cd, errmsg, sql_trc);

    l_cursor_name := 'list_by_statecode_p';
    dbms_sql.describe_columns ( c => dbms_sql.to_cursor_number(v_cur) ,
    col_cnt => l_colCnt, desc_t => l_descTbl );
    dbms_output.put_line( RPAD( 'Name' , 25 , ' ' ) || 'Type' );
    dbms_output.put_line( RPAD( '----' , 25 , ' ' ) || '----' );
    FOR i IN 1 .. l_colCnt
    LOOP
      IF l_descTbl(i).col_type    = 2 THEN
        l_col_type               := 'NUMBER';
      ELSIF l_descTbl(i).col_type = 1 THEN
        l_col_type               := 'VARCHAR2';
      ELSE
        l_col_type := l_descTbl(i).col_type ;
      END IF;
      dbms_output.put_line( RPAD( l_descTbl(i).col_name, 25 , ' ' ) || l_col_type);
    END LOOP;
  END ;
