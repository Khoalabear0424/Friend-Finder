--Signifyd (it deals with credit card fraud prevention)

-- challenge

-- List the difference between an order amount and the previous order amount for that particular employee
	-- in this particular case only employee 95 has made two orders

DROP DATABASE IF EXISTS tough_interview_questions;

CREATE DATABASE tough_interview_questions;

USE tough_interview_questions;

/* the association */

	/* orders has many shipments */

	/* a shipment belongs to an order */

CREATE TABLE shipments (
	id INT NOT NULL AUTO_INCREMENT, 
	employee_id INT,
	order_id INT,
	action VARCHAR(50),
	order_date DATE,
    PRIMARY KEY(id)
);

CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT, 
	amount INT,
    PRIMARY KEY(id)
);

insert into orders (id, amount) values (1, 23);
insert into orders (id, amount) values (2, 45);
insert into orders (id, amount) values (3, 12);
insert into orders (id, amount) values (4, 33);
insert into orders (id, amount) values (5, 11);
insert into orders (id, amount) values (6, 444);
insert into orders (id, amount) values (7, 66);
insert into orders (id, amount) values (91, 99);
insert into orders (id, amount) values (92, 4);
insert into orders (id, amount) values (93, 65);
insert into orders (id, amount) values (94, 7);
insert into orders (id, amount) values (95, 234);
insert into orders (id, amount) values (96, 8);
insert into orders (id, amount) values (97, 233);
insert into orders (id, amount) values (98, 3);

insert into shipments (employee_id, action, order_id, order_date) values (1, 'ordered', 1, '2017-08-06');
insert into shipments (employee_id, action, order_id, order_date) values (1, 'approved', 1, '2017-08-08');
insert into shipments (employee_id, action, order_id, order_date) values (1, 'processing', 1, '2017-08-09');
insert into shipments (employee_id, action, order_id, order_date) values (1, 'shipped', 1, '2017-08-12');

insert into shipments (employee_id, action, order_id, order_date) values (2, 'ordered', 2, '2017-08-08');
insert into shipments (employee_id, action, order_id, order_date) values (2, 'approved', 2, '2017-08-12');
insert into shipments (employee_id, action, order_id, order_date) values (2, 'processing', 2, '2017-08-18');
insert into shipments (employee_id, action, order_id, order_date) values (2, 'shipped', 2, '2017-08-19');

insert into shipments (employee_id, action, order_id, order_date) values (3, 'ordered', 3, '2017-08-08');
insert into shipments (employee_id, action, order_id, order_date) values (3, 'approved', 3, '2017-08-12');
insert into shipments (employee_id, action, order_id, order_date) values (3, 'processing', 3, '2017-08-18');
insert into shipments (employee_id, action, order_id, order_date) values (3, 'shipped', 3, '2017-08-19');

insert into shipments (employee_id, action, order_id, order_date) values (4, 'ordered', 4, '2017-08-15');
insert into shipments (employee_id, action, order_id, order_date) values (4, 'approved', 4, '2017-08-18');
insert into shipments (employee_id, action, order_id, order_date) values (4, 'processing', 4, '2017-08-21');
insert into shipments (employee_id, action, order_id, order_date) values (4, 'shipped', 4, '2017-08-29');

insert into shipments (employee_id, action, order_id, order_date) values (5, 'ordered', 5, '2017-08-20');
insert into shipments (employee_id, action, order_id, order_date) values (5, 'approved', 5, '2017-08-20');
insert into shipments (employee_id, action, order_id, order_date) values (5, 'processing', 5, '2017-08-20');
insert into shipments (employee_id, action, order_id, order_date) values (5, 'shipped', 5, '2017-08-22');

insert into shipments (employee_id, action, order_id, order_date) values (6, 'ordered', 6, '2017-08-20');
insert into shipments (employee_id, action, order_id, order_date) values (6, 'approved', 6, '2017-08-22');
insert into shipments (employee_id, action, order_id, order_date) values (6, 'processing', 6, '2017-08-23');
insert into shipments (employee_id, action, order_id, order_date) values (6, 'cancelled', 6, '2017-08-24');

insert into shipments (employee_id, action, order_id, order_date) values (7, 'ordered', 7, '2017-08-22');
insert into shipments (employee_id, action, order_id, order_date) values (7, 'approved', 7, '2017-08-23');
insert into shipments (employee_id, action, order_id, order_date) values (7, 'cancelled', 7, '2017-08-24');

insert into shipments (employee_id, action, order_id, order_date) values (90, 'ordered', 91, '2017-08-06');
insert into shipments (employee_id, action, order_id, order_date) values (90, 'approved', 91, '2017-08-08');
insert into shipments (employee_id, action, order_id, order_date) values (90, 'processing', 91, '2017-08-09');
insert into shipments (employee_id, action, order_id, order_date) values (90, 'cancelled', 91, '2017-08-12');

insert into shipments (employee_id, action, order_id, order_date) values (91, 'ordered', 92, '2017-08-08');
insert into shipments (employee_id, action, order_id, order_date) values (91, 'approved', 92, '2017-08-12');
insert into shipments (employee_id, action, order_id, order_date) values (91, 'cancelled', 92, '2017-08-18');

insert into shipments (employee_id, action, order_id, order_date) values (93, 'ordered', 93, '2017-08-15');
insert into shipments (employee_id, action, order_id, order_date) values (93, 'approved', 93, '2017-08-16');
insert into shipments (employee_id, action, order_id, order_date) values (93, 'processing', 93, '2017-08-19');
insert into shipments (employee_id, action, order_id, order_date) values (93, 'shipped', 93, '2017-08-23');

insert into shipments (employee_id, action, order_id, order_date) values (92, 'ordered', 94, '2017-08-11');
insert into shipments (employee_id, action, order_id, order_date) values (92, 'approved', 94, '2017-08-12');
insert into shipments (employee_id, action, order_id, order_date) values (92, 'processing', 94, '2017-08-13');
insert into shipments (employee_id, action, order_id, order_date) values (92, 'shipped', 94, '2017-08-14');

insert into shipments (employee_id, action, order_id, order_date) values (94, 'ordered', 95, '2017-08-05');
insert into shipments (employee_id, action, order_id, order_date) values (94, 'approved', 95, '2017-08-07');
insert into shipments (employee_id, action, order_id, order_date) values (94, 'processing', 95, '2017-08-09');
insert into shipments (employee_id, action, order_id, order_date) values (94, 'shipped', 95, '2017-08-10');

insert into shipments (employee_id, action, order_id, order_date) values (94, 'ordered', 96, '2017-08-11');
insert into shipments (employee_id, action, order_id, order_date) values (94, 'approved', 96, '2017-08-13');
insert into shipments (employee_id, action, order_id, order_date) values (94, 'processing', 96, '2017-08-14');
insert into shipments (employee_id, action, order_id, order_date) values (94, 'shipped', 96, '2017-08-15');

-- cancelled after approved
insert into shipments (employee_id, action, order_id, order_date) values (95, 'ordered', 97, '2017-08-11');
insert into shipments (employee_id, action, order_id, order_date) values (95, 'cancelled', 97, '2017-08-13');
insert into shipments (employee_id, action, order_id, order_date) values (95, 'approved', 97, '2017-08-14');
insert into shipments (employee_id, action, order_id, order_date) values (95, 'shipped', 97, '2017-08-15');

-- cancelled without approval
insert into shipments (employee_id, action, order_id, order_date) values (95, 'ordered', 98, '2017-08-16');
insert into shipments (employee_id, action, order_id, order_date) values (95, 'cancelled', 98, '2017-08-19');
















