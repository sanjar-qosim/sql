select e.id as employee_id, e.name as employee_name, coalesce(d.name, 'No Department') as department_name from employees e left join departments d on e.department_id = d.id

select e.name as employee_name, m.name as manager_name from employees e join employees m on e.manager_id = m.id

select d.id, d.name from departments d left join employees on e.departments_id d.id where e.id is null

select o.id as order_id, coalesce(e.name, 'No Employee') as employee_name, coalesce(e.name, 'No Customer') as customer_name, o.amount from orders o left join employees e on o.employee_id = e.id left join customers c on o.customer_id = c.id

select o.idm as order_id, p.name as product_name, oi.quantity from orders o left join order_items oi on o.id = oi.order_id left join products p on oi.product_id = p.id order by o.id

select d.name as department_name, o.id as order_id from departments d left join employees e on e.department_id = d.id left join orders o on o.employee_id = e.od order by d.name

select c.name as customer_name, p.name as product_name from customers c cross join products p where not exist (select 1 from orders o join order_item oi on o.id = oi.order_id where o.customer_id = c.id and oi.product_id = .id)

select p.id, p.name from products p left join order_items oi on p.id = oi.product_id where oi.id is null

select m.name as manager_name, sum(o.amount) as total_sales from employees m join employees e on e.manager_id = m.id join orders o on o.employee_id = e.id group by m.name

select count(*) as total_orders, sum(amount) as total_revenue from orders

select d.name as department_name, avg(e.salary) as avg_salary, max(e.salary) as max_salary from departments d left join employees e on e.department_id = d.id group by d.name

select o.id as order_id, sum(oi.quantity) as total_quantity, count(distinct oi.product_id) as unique_products from orders o left join order_items oi on o.id = oi.order_id group by o.id

select p.name as product_name, sum(p.price * oi.quantity) as total_revenue from products p join order oi on oi.product_id = p.id group by p.name order by total_revenue desc limit 3

select count(distinct customer_id) as customers from orders where customer_id is not null

select d.name as department_name, count(e.id) as employees_count, avg(e.salary) as avg_salary, sum(o.amount) as total_sales from departments d left join employees e on e.department_id = d.id left join orders o on o.employee_id = e.id group by d.name

select c.name avg(o.amount) as avg_count from customers c join orders o on o.customer_id = c.id group by c.name having avg(o.amount) > (select avg(amount) from orders)

select first_name || ' ' || last_name as full_name from employees e

select to_char(order_date, 'DD.MM.YYYY HH24:MI') as formatted from orders

select * from orders where order_date < current_date - interval 'N days'

select name, coalesce(salary, 0) as salary, coalesce(salary, 0) * 1.10 as salary_with_bonuses from employees e