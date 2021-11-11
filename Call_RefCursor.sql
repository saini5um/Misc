variable v_cur REFCURSOR;
variable status_cd varchar2(60);
variable error_cd varchar2(100);
variable errmsg varchar2(4000);
variable sqltrc varchar2(32000);

begin
osb_usr.cel_atg_customer_retrieve_ent(null, 'WWWW3333', 'Passport', null, null, :v_cur, :status_cd, :error_cd, :errmsg, :sqltrc);
end;
/

print v_cur;
