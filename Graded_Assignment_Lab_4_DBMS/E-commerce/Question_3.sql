select count(P.cus_id) as num_of_customers,cus_gender as gender from customer c inner join
(select cus_id,ord_amount from new_order_directory.order
 where ord_amount>=3000 group by cus_id) as P
on c.cus_id=P.cus_id group by cus_gender;

-- Qestion 3