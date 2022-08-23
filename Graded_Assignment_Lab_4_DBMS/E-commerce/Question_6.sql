select t2.cat_id,t2.pro_name,c.cat_name,t2.sprice as min_price from category c
inner join
(select cat_id,pro_name,min(t1.price) as sprice from product p inner join
(
select pro_id,min(supp_price) as price from supplier_pricing group by pro_id
)as t1 on p.pro_id=t1.pro_id group by cat_id
) as t2 on t2.cat_id=c.cat_id;

-- question 6