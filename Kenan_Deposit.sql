Select c.ACCOUNT_NO As BA, ciem1.EXTERNAL_ID As MSISDN,
  c.ACCOUNT_CATEGORY, c.VIP_CODE, c.bill_period AS BC, sv.DISPLAY_VALUE
  As STATUS, Trunc(s.SERVICE_ACTIVE_DT) As SSTART, 
  --cp.package_id AS PKGID, pdv.display_Value AS PKG, p1.COMPONENT_ID As SERVICE_COMPID, cdv1.DISPLAY_VALUE
  --As SERVICE_COMP, Trunc(p1.BILLING_ACTIVE_DT) As SERVICE_START,
  p2.component_id AS DATA_COMPID, cdv2.display_value AS IR_COMP,
  Trunc(p2.billing_active_dt) AS IR_START, d.deposit_amount/100, d.chg_who, d.date_received deposit_received
From cmf c, service s, product p1, customer_id_equip_map ciem1,
    product_elements pe1, component_definition_values cdv1,
    product p2, product_elements pe2, component_definition_values cdv2,
    cmf_package cp, package_definition_values pdv, deposit d
Where s.SUBSCR_NO = ciem1.SUBSCR_NO And s.SUBSCR_NO_RESETS =
  ciem1.SUBSCR_NO_RESETS And
  c.ACCOUNT_NO = s.PARENT_ACCOUNT_NO And 
  s.SUBSCR_NO = p1.PARENT_SUBSCR_NO And s.SUBSCR_NO_RESETS =
  p1.PARENT_SUBSCR_NO_RESETS And p1.COMPONENT_ID = cdv1.COMPONENT_ID And
  p1.ELEMENT_ID = pe1.ELEMENT_ID AND
  c.account_no=cp.parent_account_no
  AND c.account_no=d.account_no
  AND d.date_returned IS null
  AND cp.package_id=pdv.package_id
  AND pdv.language_code=1
  AND pdv.short_display IS NOT NULL
  AND cp.package_status=1
  AND cp.inactive_dt IS null and
  s.SUBSCR_NO = p2.PARENT_SUBSCR_NO And s.SUBSCR_NO_RESETS =
  p2.PARENT_SUBSCR_NO_RESETS And p2.COMPONENT_ID = cdv2.COMPONENT_ID And
  p2.ELEMENT_ID = pe2.ELEMENT_ID
  And ciem1.EXTERNAL_ID = '0192165279'
  And s.SERVICE_INACTIVE_DT Is Null And ss.INACTIVE_DT Is Null
  And ss.STATUS_TYPE_ID = 1 And sv.LANGUAGE_CODE = 1 And ciem1.EXTERNAL_ID_TYPE = 1
  And ciem1.IS_CURRENT = 1 And ciem1.INACTIVE_DATE Is Null And
  ciam.EXTERNAL_ID_TYPE = 1 And ciam.INACTIVE_DATE Is Null And
  ciem2.EXTERNAL_ID_TYPE = 11 And ciem2.IS_CURRENT = 1 And
  ciem2.INACTIVE_DATE Is Null And cdv1.LANGUAGE_CODE = 1 AND
  cdv2.language_code = 1 and
  p1.BILLING_INACTIVE_DT Is Null And pe1.TYPE_GROUP_USG In (20000)
  AND p2.billing_inactive_dt IS NULL AND pe2.type_group_usg IN (10005);
  
select * from deposit where account_no = 68682734;

select * from usage_type_groups u, descriptions d 
where type_group_usg = 20000
and u.description_code = d.description_code
and d.language_code = 1;

select d.DESCRIPTION_TEXT, p.* 
from PRODUCT_ELEMENTS p, descriptions d
where p.description_code = d.description_code
and upper(description_text) like '%ROAM%';

select min(date_received), max(date_received), sum(deposit_amount) from deposit;
where date_returned is not null; --where account_no = 59994264;

DEPOSIT: 9,604,947.82
NOT RETURNED: 34,422,432.78
