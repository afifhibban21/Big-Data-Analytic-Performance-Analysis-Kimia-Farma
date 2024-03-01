
# **Virtual Internship Experience: Big Data Analytics - Kimia Farma**

Tool : BigQuery  <br>
Visualization : Looker Data Studio  <br>
Dataset : VIX Kimia Farma

---

## Introduction

VIX Big Data Analytics Kimia Farma merupakan virtual internship experience yang difasilitasi oleh Rakamin Academy. Pada project ini saya berperan sebagai Data Analyst Intern yang diminta untuk menganalisis dan membuat laporan penjualan perusahaan menggunakan data-data yang telah disediakan. Dari project ini, saya juga banyak belajar tentang data data warehouse, dataleke, dan datamart.


Objectives

- Membuat design datamart (Tabel analisa)
- Membuat visualisasi/dashboard **Performance Analysis** perusahaan

Dataset
Dataset yang disediakan terdiri dari tabel-tabel berikut:

- Final Transaction
- Kantor Cabang
- Inventory
- Product

---

# Design Datamart

## Tabel Analisa 

tabel analisa adalah tabel yang berisi data - data gabungan yang berasa dari ke empat tabel yang ada  dan beberapa kolum yang sudah dilakukan perubahan untuk kebutuhan dan memudahkan analisa dan mempunyai primary key <br>
yaitu transaction_id.</p>

<details>
  <summary> Klik untuk melihat Query </summary>
    <br>

```sql
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
```
<br>
</details>
<br>

![Screenshot 2024-03-02 at 00 12 50](https://github.com/afifhibban21/Big-Data-Analytic-Performance-Analysis-Kimia-Farma/assets/117912771/63c783d7-c089-4a62-bdee-8af78414762b)


   </kbd> <br> Gambar 1 — Sampel Hasil Pembuatan Tabel Analisa  


<br>

---                                
# **Data Vizualisation**
[Klik untuk melihat hasil analisa di LookerStudio](https://lookerstudio.google.com/reporting/b4c9f280-8d2a-4510-bf21-c6ee7d5120e6)


![Screenshot 2024-03-02 at 00 18 43](https://github.com/afifhibban21/Big-Data-Analytic-Performance-Analysis-Kimia-Farma/assets/117912771/d1733720-a815-42ea-b66b-81134ad892a9)

   </kbd> <br> Gambar 2 — Performance Analysis Dashboard Kimia Farma
    


---
