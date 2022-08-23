DROP procedure IF EXISTS `Type_of_service_procedure`;

DELIMITER $$
USE `new_order_directory`$$
CREATE PROCEDURE `Type_of_service_procedure` ()
BEGIN
select S.supp_id,supp_name,avg(Q.rat_ratstars) as rating,
case
	when avg(Q.rat_ratstars)=5 then 'Excellent Service'
    when avg(Q.rat_ratstars)>4 then 'Good Service'
    when avg(Q.rat_ratstars)>2 then 'Average Service'
    else 'Poor Service'
end as Type_of_service from supplier S inner join 
(select supp_id,P.rat_ratstars from supplier_pricing SP inner join
(select pricing_id,rat_ratstars from new_order_directory.order inner join rating
on new_order_directory.order.ord_id=rating.ord_id) as P on SP.pricing_id=P.pricing_id) as Q on S.supp_id=Q.supp_id group by S.supp_id;

END$$

DELIMITER ;

call Type_of_service_procedure();

-- question 9