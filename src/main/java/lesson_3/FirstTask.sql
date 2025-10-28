select SUM(amount) from sales group by region

select  AVG(amount) from sales group by region having count(*) > 1

select region,  SUM(amount) as amount from sales where not amount is null group by region order by amount desc limit 1

select count(*), count(amount) from sales

select region, sum(amount) from sales group by region having sum(amount) > (select AVG(amount) from sales)