create table concession(
	item_id SERIAL primary key,
	item_name VARCHAR(100),
	price NUMERIC(5,2),
	size VARCHAR(30),
	quantity INT
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(100),
	membership BOOLEAN,
	membership_start_date DATE,
	membership_renew_date DATE
);

create table movie(
	movie_id SERIAL primary key,
	movie_name VARCHAR(100),
	movie_producer VARCHAR(100),
	movie_length TIME,
	date_added DATE,
	date_remove DATE
);

create table ticket(
	ticket_id SERIAL primary key,
	customer_id INT,
	foreign key(customer_id) references customer(customer_id),
	movie_id INT,
	foreign key(movie_id) references movie(movie_id),
	ticket_date DATE,
	start_time TIME,
	seat_row CHAR(1),
	seat_number INT,
	paid_amount NUMERIC(5,2)
);

-- Inserting values into customer table

insert into customer values(1, 'Bob', 'Smith', '123 Fake St.', 'bobsmith@gmail.com', false, null, null);
insert into customer values(2, 'Sarah', 'Smith', '123 Fake St.', 'bobsmith@gmail.com', false, null, null);
insert into customer values(3, 'Noah', 'White', '456 Altura St.', 'bobsmith@gmail.com', True, '2022/01/11', '2022/02/11');
select * from customer;

-- Inserting values into concession table
insert into concession values(1, 'Snickers', 1.59, null, 500);
insert into concession values(2, 'Popcorn', 17.99, 'large', null);
insert into concession values(3, 'Fountain Drink', 4.99, 'small', null);
insert into concession values(4, 'Fountain Drink', 5.99, 'medium', null);
insert into concession values(5, 'Fountain Drink', 6.99, 'large', null);
select * from concession;

-- Inserting into movie table
insert into movie values (1, 'Up', 'Pixar', '1:36:10', '2016/01/11', '2017/01/11');
insert into movie values (2, 'Monsters INC', 'Pixar', '1:30:10', '2010/11/11', '2011/11/11');
insert into movie values (3, 'Inception', 'Pixar', '3:00:00', '2017/01/11', null);
update movie set movie_producer = 'Christopher Nolan' where movie_id = 3;
select * from movie;

-- Inserting into ticket table
insert into ticket values(1, 1, 2, '2022/01/11', '08:00', 'A', 10, 12.99);
insert into ticket values(2, 2, 1, '2022/01/11', '09:00', 'B', 15, 12.99);
insert into ticket values(3, 3, 2, '2022/01/11', '10:00', 'C', 20, 10.99);
select * from ticket;