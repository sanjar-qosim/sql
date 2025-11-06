insert into groups (group_id, group_name) values
(1, 'Finance'),
(2, 'IT'),
(3, 'Agroculture');

insert into students (student_id, full_name, age, group_id) values
(1, 'John Doe', 21, 1),
(2, 'Petr Ivanov', 22, 1),
(3, 'Marya Pavlova', 20, 2),
(4, 'Larry Johnson', 23, 2),
(5, 'White Black', 21, 3);

insert into subjects (subject_id, subject_name) values
(1, 'Math'),
(2, 'CS'),
(3, 'Yard');

insert into grades (grade_id, student_id, subject_id, grade) values
(1, 1, 1, 9),
(2, 1, 2, 8),
(3, 2, 1, 10),
(4, 2, 3, 9),
(5, 3, 1, 7),
(6, 3, 2, 8),
(7, 4, 3, 9),
(8, 5, 1, 9),
(9, 5, 2, 10);

select count(*) from students

select avg(age) from students

select min(age) as min, max(age) as max from students

select count(*) from grades

select g.group_name, count(s.student_id) as s_count from groups g left join students s on g.group_id = s.group_id group by g.group_name

select g.group_name, avg(s.age) as s_age from groups g join students s on g.group_id = s.group_id group by g.group_name

select sub.subject_name, round(avg(g.grade), 2) as avg_grade from subjects sub join grades g on sub.subject_id = g.subject_id group by sub.subject_name

select count(*) from (select student_id from grades group by student_id having count(distinct subject_id) = (select count(*) from subjects)) as subquery

select g.group_name, count(s.student_id) as s_count from groups g join students s on g.group_id = s.group_id group by g.group_name having count(s.student_id) > 1

select sub.subject_name, round(avg(g.grade), 2) as avg_grade from subjects sub join grades g on sub.subject_id = g.subject_id group by sub.subject_name having avg(g.grade) > 8

select s.full_name, round(avg(g.grade) > 2) as avg_grade from students s join grades g on s.student_id = g.student_id group by s.full_name having avg(g.grade) > 8.5