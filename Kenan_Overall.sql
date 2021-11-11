Select ciam.EXTERNAL_ID As BA, ciem1.EXTERNAL_ID As MSISDN, ciem2.EXTERNAL_ID As
  IMSI, ciam1.external_id AS BRN, ciam2.external_id AS IC, ciam3.external_id AS PASSPORT,ciam4.external_id AS OLDIC,
  c.PAY_METHOD, c.ACCOUNT_CATEGORY, c.VIP_CODE, c.bill_period AS BC, sv.DISPLAY_VALUE
  As STATUS, srv.display_value AS REASON, Trunc(s.SERVICE_ACTIVE_DT) As SSTART, Trunc(ss.ACTIVE_DT)
  As S_STAT_DAT, cp.package_id AS PKGID, pdv.display_Value AS PKG, p1.COMPONENT_ID As SERVICE_COMPID, cdv1.DISPLAY_VALUE
  As SERVICE_COMP, Trunc(p1.BILLING_ACTIVE_DT) As SERVICE_START, p2.element_id,
  p2.component_id AS DATA_COMPID, cdv2.display_value AS DATA_COMP,
  Trunc(p2.billing_active_dt) AS DATA_START, d.deposit_amount, d.chg_who, d.date_received
From
    customer_id_equip_map ciem1, customer_id_equip_map ciem2, cmf c, service s,
    customer_id_acct_map ciam1, customer_id_acct_map ciam2, customer_id_acct_map ciam3, customer_id_acct_map ciam4,
    service_status ss, status_values sv, status_reason_values srv, customer_id_acct_map ciam, product p1,
    product_elements pe1, component_definition_values cdv1,
    product p2, product_elements pe2, component_definition_values cdv2,
    cmf_package cp, package_definition_values pdv, deposit d
Where s.SUBSCR_NO = ciem1.SUBSCR_NO And s.SUBSCR_NO_RESETS =
  ciem1.SUBSCR_NO_RESETS And s.SUBSCR_NO = ss.SUBSCR_NO And s.SUBSCR_NO_RESETS =
  ss.SUBSCR_NO_RESETS And ss.STATUS_ID = sv.STATUS_ID
  AND ss.status_reason_id=srv.status_reason_id AND srv.language_code=1 And s.SUBSCR_NO =
  ciem2.SUBSCR_NO And s.SUBSCR_NO_RESETS = ciem2.SUBSCR_NO_RESETS And
  c.ACCOUNT_NO = s.PARENT_ACCOUNT_NO And c.ACCOUNT_NO = ciam.ACCOUNT_NO And
  s.SUBSCR_NO = p1.PARENT_SUBSCR_NO And s.SUBSCR_NO_RESETS =
  p1.PARENT_SUBSCR_NO_RESETS And p1.COMPONENT_ID = cdv1.COMPONENT_ID And
  p1.ELEMENT_ID = pe1.ELEMENT_ID AND
  c.account_no=cp.parent_account_no
  AND c.account_no=d.account_no(+)
  AND c.account_no=ciam1.account_no(+)
AND ciam1.external_id_type(+)=3
AND ciam1.inactive_date(+) IS NULL
AND c.account_no=ciam2.account_no(+)
AND ciam2.external_id_type(+)=2
AND ciam2.inactive_date(+) IS NULL
AND c.account_no=ciam3.account_no(+)
AND ciam3.external_id_type(+)=4
AND ciam3.inactive_date(+) IS NULL
AND c.account_no=ciam4.account_no(+)
AND ciam4.external_id_type(+)=5
AND ciam4.inactive_date(+) IS NULL
  AND d.date_returned IS null
  AND cp.package_id=pdv.package_id
  AND pdv.language_code=1
  AND pdv.short_display IS NOT NULL
  AND cp.package_status=1
  AND cp.inactive_dt IS null and
  s.SUBSCR_NO = p2.PARENT_SUBSCR_NO And s.SUBSCR_NO_RESETS =
  p2.PARENT_SUBSCR_NO_RESETS And p2.COMPONENT_ID = cdv2.COMPONENT_ID And
  p2.ELEMENT_ID = pe2.ELEMENT_ID
--  And ciem1.EXTERNAL_ID = '0134227724'
  And s.SERVICE_INACTIVE_DT Is Null And ss.INACTIVE_DT Is Null
  And ss.STATUS_TYPE_ID = 1 And sv.LANGUAGE_CODE = 1 And ciem1.EXTERNAL_ID_TYPE = 1
  And ciem1.IS_CURRENT = 1 And ciem1.INACTIVE_DATE Is Null And
  ciam.EXTERNAL_ID_TYPE = 1 And ciam.INACTIVE_DATE Is Null And
  ciem2.EXTERNAL_ID_TYPE = 11 And ciem2.IS_CURRENT = 1 And
  ciem2.INACTIVE_DATE Is Null And cdv1.LANGUAGE_CODE = 1 AND
  cdv2.language_code = 1 and
  p1.BILLING_INACTIVE_DT Is Null And pe1.TYPE_GROUP_USG In (20000)
  AND p2.billing_inactive_dt IS NULL AND pe2.type_group_usg IN (10005);
