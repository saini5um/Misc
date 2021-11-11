alter session set current_schema = SIMADMIN;
select count(*) from pa_str_rtl; -- 32,186

select *
from pa_str_rtl 
where x_celcom_store_type = 'Ordinary Dealer' 
and id_str_rt in ('50034','50035','50036','50037','50038','50039');

select id_str_rt, count(*) from RK_STORE_ITEM_SOH 
where id_str_rt in ('50034','50035','50036','50037','50038','50039')
group by id_str_rt;

-- take backup
create table rk_store_item_soh_bkp as select * from rk_store_item_soh;

-- replicating the items in store 50036 based on available items in store 50034
insert into rk_store_item_soh
select id_itm, 50036, total_quantity, reserved_quantity, customer_resv_quantity, in_transit_quantity, rtv_quantity,
adjust_unavail_qty, SHOP_FLOOR_QUANTITY, DELIVERY_BAY_QUANTITY, LAST_APPROVED_STK_CNT_DATE, LAST_STK_CNT_TYPE,
open_stock_counts, last_stk_cnt_before_ind, last_received_day, last_received_quantity, uin_problem_line
from RK_STORE_ITEM_SOH where ID_STR_RT = 50034 --and total_quantity <> 0
order by 1;

select * from RK_STORE_ITEM_SOH where ID_STR_RT = 50036 order by 1;

select count(*) from RK_STORE_ITEM_SOH; -- 188,961,105
