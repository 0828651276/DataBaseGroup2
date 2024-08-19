drop database 4gear_store;
create database 4Gear_Store;
use 4Gear_Store;

create table roles(
	role_id int primary key auto_increment,
    role_name varchar(50)
);
create table user(
	user_id int primary key auto_increment,
	user_name varchar(250) unique,
    user_password varchar(250)
);
create table user_roles(
	role_id int,
    user_name varchar (250),
    primary key(role_id, user_name),
    foreign key(role_id) references roles(role_id),
    foreign key(user_name) references user(user_name)
);
create table Products(
	product_id int primary key auto_increment,
    product_name varchar(250),
    product_desciption varchar(250),
    product_supplier_name varchar(250),
    product_price int,
    product_stock int
);
create table Employees(
	employee_id int primary key auto_increment,
    employee_name varchar(250),
    employee_email varchar(250),
    employee_phone varchar(250),
    employee_address varchar(250),
    user_name varchar(250),
    foreign key (user_name) references user(user_name)
);
create table Customers(
	customer_id int primary key auto_increment,
    customer_name varchar(250),
    customer_email varchar(250),
    ecustomer_phone varchar(250),
    customer_address varchar(250),
    user_name varchar(250),
    foreign key (user_name) references user(user_name)
);
create table orders(
	order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    total_price int,
    foreign key (customer_id) references customers(customer_id)
);
create table order_detail(
	order_detail_id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int,
    price int,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);
create table shopping_cart_detail(
	shopping_cart_detail_id int primary key auto_increment,
    product_id int,
    customer_id int,
    product_name varchar (250),
    quantity int,
    price int,
    total_price int,
    foreign key (customer_id) references customers(customer_id)
);
create table shopping_cart(
	shopping_cart_detail_id int,
    product_id int,
    primary key (shopping_cart_detail_id, product_id),
    foreign key (shopping_cart_detail_id) references shopping_cart_detail(shopping_cart_detail_id),
    foreign key (product_id) references products(product_id)
);