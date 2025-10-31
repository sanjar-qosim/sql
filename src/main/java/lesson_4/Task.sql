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