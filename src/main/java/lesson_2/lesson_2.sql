-- нормализация

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id int references customers(id) ,
    total_amount int not null
);

CREATE TABLE order_items (
    order_id INT references orders(id),
    product_id INT references products(id),
    quantity INT not null,
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE products (
    id SERIAL PRIMARY key,
    name TEXT not null,
    price int not null,
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    region TEXT NOT NULL
);


-- задача 1
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name text not null,
    email text unique not null
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    total_amount NUMERIC(10,2) not null,
    order_date date not null,
    customer_id int references customers(id)
);


-- задача 2
CREATE TABLE departments  (
    id SERIAL PRIMARY KEY,
    name text not null,
);

CREATE TABLE employees  (
    id SERIAL PRIMARY KEY,
    name text not null,
    position text not null,
    department_id INT REFERENCES departments(id) ON DELETE SET NULL
);


-- задача 3
CREATE TABLE categories   (
    id SERIAL PRIMARY KEY,
    name text not null
);

CREATE TABLE products  (
    id SERIAL PRIMARY KEY,
    name text not null,
    price numeric(10,2) not null check (price >= 0),
    category_id INT REFERENCES categories(id)
);


-- задача 4
CREATE TABLE customers  (
    id SERIAL PRIMARY KEY,
    name text not null
);

CREATE TABLE products   (
    id SERIAL PRIMARY KEY,
    name text not null,
    price numeric(10,2) not null check (price >= 0)
);

CREATE TABLE orders   (
    id SERIAL PRIMARY KEY,
    customer_id INT references customers(id)
    total_amount numeric(10,2) not null
);

CREATE TABLE order_items   (
    order_id int references orders(id),
    product_id int references products(id)
);


-- задача 5
CREATE TABLE faculties (
    id SERIAL PRIMARY KEY,
    name text not null
);

CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name text not null
    faculty_id int references faculties(id)
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name text not null,
    group_id int references groups(id)
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name text not null
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name text not null,
    teacher_id int references teachers(id)
);

CREATE TABLE student_courses (
    student_id int references students(id),
    course_id int references courses(id),
    grade int check (grade BETWEEN 1 AND 5),
    PRIMARY KEY (student_id, course_id)
);

-- задача 6
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text not null,
    email text UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id int references users(id) ON DELETE CASCADE,
    text text not null,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id int references posts(id) ON DELETE CASCADE,
    user_id int references users(id) ON DELETE CASCADE,
    text text not null,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE likes (
    user_id int references users(id) ON DELETE CASCADE,
    post_id int references posts(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, post_id)
);