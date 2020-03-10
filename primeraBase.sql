select user_name, count(order_id)
from demo_users LEFT join demo_orders using (user_id)
group by user_name;

select product_name, sum(quantity), sum(unit_price * quantity)
from demo_product_info left join demo_order_items using (product_id)
group by product_name
ORDER BY sum(unit_price * quantity) asc;

select state_name, sum(unit_price * quantity) as "Total"
from demo_customers 
inner join demo_orders 
using(customer_id) 
inner join demo_order_items 
using (order_id) 
inner join demo_states 
on demo_states.st = demo_customers.cust_state
group by state_name
order by "Total" desc;


insert into demo_states (st, state_name)
values ('RM', 'Region Metropolitana');

insert into demo_states (st, state_name)
values ('V', 'Region de Valparaiso');

insert into demo_states (st, state_name)
values ('VIII', 'Region del BioBio');

select * from demo_states;

insert into demo_product_info (product_name, product_description, category, product_avail, list_price, product_image, mimetype, filename)
values ('Mascarilla', 'Mascarilla para ir a las marchas', 'accesorios', 'Y', 200, null, null, null);

insert into demo_product_info (product_name, product_description, category, product_avail, list_price, product_image, mimetype, filename)
values ('Capucha', 'Para que no te identifiquen', 'accesorios', 'Y', 200, null, null, null);

update demo_states set state_name = 'Region Mas bacan'
where st = 'RM'

update demo_product_info set product_name = 'Zapatitos de bebe',
product_description = 'Zapatos para hombres de pies pequenios...'
where product_id = 9;

select * from demo_product_info;

update demo_customers set cust_first_name = 'Elsa',
cust_last_name= 'coweas'
where customer_id = 2;

update demo_customers set cust_first_name = 'Maria Trinidad',
cust_last_name = 'Gaete'
where customer_id = 1;

update demo_customers set cust_street_address2 = 'Diagonal Paraguay 55'
where customer_id = 1;

delete from demo_states where st = 'RM';

delete from demo_states where st = 'VIII';



