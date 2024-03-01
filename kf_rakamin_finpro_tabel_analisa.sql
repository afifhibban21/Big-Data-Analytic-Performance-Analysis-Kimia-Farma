
create table kf_tabel_analisa as 
select 
	ft.transaction_id, 
      ft.date,
      inv.branch_id,
      kc.branch_name,
      kc.kota,
      kc.provinsi,
      kc.rating as rating_cabang,
      ft.customer_name,
      pd.product_id,
      inv.product_name,
      pd.price as actual_price,
      round(ft.discount_percentage*100)  as discount_percentage ,
      case 
      		when pd.price  <= 50000 then '10%'
      		when pd.price  between  50000 and 100000 then '15%'
      		when pd.price  between  100000 and 300000 then '20%'
      		when pd.price  between  300000 and 500000 then '25%'
      		when pd.price  > 500000 then '30%' 
      end as presentase_gross_laba,
      round(pd.price  - (pd.price * ft.discount_percentage)) as nett_sales,
      round(pd.price - (pd.price  - (pd.price * ft.discount_percentage))) nett_profit
from  
	  kf_final_transaction ft
join  
	  kf_inventory  inv 
on 
	  ft.branch_id = inv.branch_id
join  
	  kf_kantor_cabang kc
on 
	  inv.branch_id = kc.branch_id 
join 
	  kf_product pd 
on
	  pd.product_id = inv.product_id 

