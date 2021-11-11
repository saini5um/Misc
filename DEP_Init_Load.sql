DECLARE 
  v_cur SYS_REFCURSOR;
  v_loc varchar2(100);
  v_id_type varchar2(60);
  status_cd varchar2(10);
  error_cd varchar2(10);
  errmsg   VARCHAR2(500);
  sql_trc   VARCHAR2(32000);
  cri VARCHAR2(60); --1-6X0K7</cel:Column>
  ci VARCHAR2(200); --E4985522F</cel:Column>
  cit VARCHAR2(120); --Passport</cel:Column>
  kai VARCHAR2(120); --
  bpi VARCHAR2(60); --
  man VARCHAR2(120); --
	dob DATE; --1972-01-01T00:00:00.000+07:30</cel:Column>
  gdr VARCHAR2(120); --Male</cel:Column>
  mmn VARCHAR2(240); --NA</cel:Column>
  nm VARCHAR2(400); --THEVEN NAIDU</cel:Column>
  nat VARCHAR2(120); --"/>
  rc VARCHAR2(120); --"/>
  slt VARCHAR2(120); --Mr</cel:Column>
  sc VARCHAR2(120); --"/>
  sg VARCHAR2(120); --Consumer</cel:Column>
	ssg VARCHAR2(120); --Retail</cel:Column>
  TYP VARCHAR2(120); --"/>
  vc VARCHAR2(120); --"/>
  ctc VARCHAR2(120); --"/>
  abari VARCHAR2(60); --"/>
  bas VARCHAR2(120); --"/>
  bl VARCHAR2(120); --"/> BRIEFING LAYOUT
  pi VARCHAR2(60); --"/> ASSET PROMOTION ID
  psi VARCHAR2(88); --"/> PROD_INT.X_VALIDATION_FLD
  ai VARCHAR2(400); --"/> ASSET SERIAL NUM
  am VARCHAR2(1000); --"/> ASSET_XA CHAR_VAL ATTR_NAME=MODEL
  prd VARCHAR2(400); --"/> PROD_INT NAME
  ptyp VARCHAR2(120); --"/> PROD_INT TYPE
  pst  VARCHAR2(120); --"/> PROD_INT FABRIC_CD
  bn VARCHAR2(400); --Somerset</cel:Column> S_ADDR_PER.X_BUILDING
  cty VARCHAR2(200); --KL</cel:Column> CITY
  cny VARCHAR2(120); --MY</cel:Column> COUNTRY
  fn VARCHAR2(60); --"/> X_FLOOR
  atyp VARCHAR2(120); --High-Rise</cel:Column> ADDR_TYPE_CD
  pc VARCHAR2(120); --57000</cel:Column> ZIPCODE
  stat VARCHAR2(40); --WP</cel:Column> STATE
  sta VARCHAR2(800); --Jln Ampang</cel:Column> ADDR
  sec VARCHAR2(400); --"/> ADDR_LINE_2
  pob VARCHAR2(120); --"/> X_PO_BOX
  styp VARCHAR2(400); --"/> X_STREET_TYPE
	un VARCHAR2(60); --187</cel:Column> X_UNIT
	can VARCHAR2(160); --CONTACT ALT_PH_NUM
	cbp VARCHAR2(160); --"/> WORK_PH_NUM
	ce VARCHAR2(1400); --psaini3@mailinator.com</cel:Column> EMAIL_ADDR
	cfn VARCHAR2(200); --THEVEN NAIDU</cel:Column> FST_NAME
  chp VARCHAR2(160); --"/> HOME_PH_NUM
  cln VARCHAR2(200); --">value</cel:Column> LAST_NAME
  cmp VARCHAR2(160); --0135008478</cel:Column> CELL_PH_NUM
  cpt VARCHAR2(120); -- S_CONTACT_FNX BEST_CALLTM_CD
	ctyp VARCHAR2(120); -- CONTACT CON_CD
  csal VARCHAR2(120); --"/> CONTACT X_PER_TITLE
  pcm VARCHAR2(120); --">Email</cel:Column> CONTACT PREF_COMM_METH_CD
	mn VARCHAR2(400); --"/> ASSET SERIAL_NUM
  pmn VARCHAR2(100); --"/> ASSET X_PRINCIPLE_SERV_ID
	ari VARCHAR2(60); --"/> ASSET ROW_ID
  aii VARCHAR2(120); --"/> ASSET INTEGRATION_ID
  sgi VARCHAR2(200); --"/> ASSET X_SME_GROUP
  ppi VARCHAR2(120); --"/> S_PROD_INT PAYMNT_TYPE_CD
  PLN VARCHAR2(400); --"/> S_PROD_INT NAME
  BTYP VARCHAR2(1000); --"/> ASSET_XA CHAR_VAL ATTR_NAME=Billing Type
  PPN VARCHAR2(400); --"/> S_PROD_INT NAME 
  cs DATE; --2018-04-10T00:00:00.000+08:00</cel:Column> S_ORG_EXT CUST_SINCE_DT
	conri VARCHAR2(60); --1-6WZMJ</cel:Column> CONTACT ROW_ID
  astat VARCHAR2(120); -- S_ASSET STATUS_CD
	asst VARCHAR2(120); -- S_ASSET X_SUB_STATUS_CD
	pcl VARCHAR2(400); -- S_CONTACT_TNTX.LANGUAGES
	fi VARCHAR2(400); -- S_ORG_EXT_XM.ATTRIB_01 NAME='FACEBOOK' TYPE='SOCIAL MEDIA'
	gpi VARCHAR2(400); -- 
	ti VARCHAR2(400);
	kn VARCHAR2(1000); -- S_ASSET_XA.CHAR_VAL ATTR_NAME='Name'
  bacl NUMBER;
  ban  VARCHAR2(1000);
	bcyc NUMBER; --INV_PROF BILL_CYCLE
	gtr CHAR(4); -- X_TAX_REL_FLG
	gtri VARCHAR2(400);
  mcnn VARCHAR2(400);
  mcnm VARCHAR2(400);
  mcsi VARCHAR2(400);
  mcmn VARCHAR2(400);
  mcem VARCHAR2(400);
  gpe VARCHAR2(400);
  supnm VARCHAR2(400);
  supmn VARCHAR2(400);
  supem VARCHAR2(400);
  mcsd  DATE;
  mced  DATE;
  stfi  VARCHAR2(400);
  cursor ipcur is
  select row_id, created, ACCNT_TYPE_CD, CUST_STAT_CD, loc, OU_NUM, name, x_cust_id_type, OU_TYPE_CD 
  from siebel.s_org_ext
  where ACCNT_TYPE_CD = 'Customer'
  and created > '01-Mar-2017' 
  and created < '01-Apr-2017';
--  order by created;
BEGIN
  for curec in ipcur
  loop
  v_loc := curec.loc; --'980906768765';
  v_id_type := curec.x_cust_id_type;

  osb_usr.CEL_ATG_CUSTOMER_RETRIEVE_ENT(null, v_loc, v_id_type, null, null, v_cur, status_cd, error_cd, errmsg, sql_trc);
--  dbms_output.put_line(status_cd || '; error_cd = ' || error_cd ||'; errmsg = '||errmsg||'; sql='||sql_trc);
  
  LOOP
    FETCH v_cur INTO cri, ci, cit, kai, bpi, man, dob, gdr, mmn, nm, 
    nat, rc, slt, sc, sg, ssg, typ, vc, ctc, abari, 
    bas, bl, pi, psi, ai, am, prd, ptyp, pst, bn, 
    cty, cny, fn, atyp, pc, stat, sta, sec, pob, styp, 
    un, can, cbp, ce, cfn, chp, cln, cmp, cpt, ctyp, 
    csal, pcm, mn, pmn, ari, aii, ppi, pln, ppn, cs, 
    conri, astat, asst, pcl, fi, gpi, ti, kn, bacl, ban, 
    bcyc, gtr, gtri, mcnn, mcnm, mcsi, mcmn, mcem, gpe, supnm, 
    supmn, supem, mcsd, mced, stfi;
  
    EXIT WHEN v_cur%NOTFOUND;
    dbms_output.put_line(cri || ' customerid = ' || ci);
    insert into DEP_CUST_PROFILE values (cri, ci, cit, kai, bpi, man, dob, gdr, mmn, nm, 
    nat, rc, slt, sc, sg, ssg, typ, vc, ctc, abari, 
    bas, bl, pi, psi, ai, am, prd, ptyp, pst, bn, 
    cty, cny, fn, atyp, pc, stat, sta, sec, pob, styp, 
    un, can, cbp, ce, cfn, chp, cln, cmp, cpt, ctyp, 
    csal, pcm, mn, pmn, ari, aii, null, ppi, pln, null, 
    ppn, cs, conri, astat, asst, pcl, fi, gpi, ti, kn, 
    bcyc, gtr, gtri);
    commit;
  END LOOP;
  CLOSE v_cur;
  
  end loop;
END;

