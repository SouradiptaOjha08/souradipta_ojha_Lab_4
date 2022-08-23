select pro_id,pro_name from product where pro_id in
(select pro_id from supplier_pricing where PRICING_ID in
(select pricing_id from new_order_directory.order where  ord_date>'2021-10-05'));

-- Question_7