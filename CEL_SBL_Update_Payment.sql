update siebel.s_order_item set status_Cd = 'Pending',fulflmnt_status_cd='' where order_id in (
select row_id from siebel.s_order where  order_num in ('1-9296971')); 

update siebel.s_order 
set status_cd = 'Pending', x_pos_flg ='N',fulflmnt_status_cd='',eai_error_text='', active_flg='Y',x_submit_flg='N' 
where order_num in ('1-9296971');