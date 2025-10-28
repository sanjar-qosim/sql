insert into students (first_name, last_name, birth_date, email, group_id) values
('John', 'Doe', '2000-05-01', 'john.doe@mail.com', 101),
('John', 'Doe', '2000-05-01', 'john.doe2@mail.com', 101),
('Petr', 'Ivanov', '1999-03-15', 'petr.@mail.com', 102),
('Anna', 'Maryava', '2001-08-22', 'anna@mail.com', 103),
('Anna', 'Maryava', '2001-08-22', 'anna2@mail.com', 103);

select first_name, last_name, count(*) as dubl from students group by first_name, last_name having count(*) > 1

delete from students a using students b where a.first_name = b.first_name and a.last_name = b.last_name and a.ctid > b.ctid
