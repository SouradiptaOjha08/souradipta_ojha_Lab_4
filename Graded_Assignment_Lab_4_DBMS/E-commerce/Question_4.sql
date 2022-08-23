select Q.ord_id,Q.ord_amount,Q.ord_date,Q.cus_id,Q.pricing_id,pro_name from product pd inner join
(select pro_id,P.* from supplier_pricing s inner join
(select * from new_order_directory.order where cus_id=2) as P
where s.pricing_id=P.pricing_id) as Q on pd.pro_id=Q.pro_id;

/* question 4