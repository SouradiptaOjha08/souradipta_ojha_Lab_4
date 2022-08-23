select * from supplier where supp_id in
(select  supp_id from supplier_pricing group by supp_id having count(distinct(pro_id))>1);

-- question 5