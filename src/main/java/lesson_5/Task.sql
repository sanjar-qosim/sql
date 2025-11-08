select * from employees where salary > (select avg(salary) from employees)

select * from products where price > (select avg(price) from products)

select distinct * from departments d join employees e on e.department_id = d.id where e.salary > 10000

select p.name, sum(oi.quantity) as total from order_items oi join products p on p.id = oi.product_id group by p.name order by total desc

select c.name, count(o.id) as total from customers c left join orders o on o.customer_id = c.id group by c.name

select d.name, avg(e.salary) as avg_salary from departments d join employees e on e.department_id = d.id group by d.name order by avg_salary desc limit 3

select c.* from customers c left join orders o on o.customer_id = c.id where o.id is null

select * from employees e where salary > all (select salary from employees e where position like '%manager%')

select d.name from departments d join employees e on e.department_id = d.id group by d.name having min(e.salary) > 5000