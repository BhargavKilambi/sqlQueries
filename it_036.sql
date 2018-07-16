create table customer(
    customer_name varchar(15) not null,
    customer_street varchar(12) not null,
    customer_city varchar(15) not null,
    primary key (customer_name)
);
create table branch(
branch_name varchar(15) not null,
branch_city varchar(15) not null,
assets number not null,
primary key (branch_name)
);
create table account1(
account_number varchar(15) not null,
branch_name varchar(15) not null,
balance number not null,
primary key(account_number)
);
create table loan(
loan_number varchar(15) not null,
branch_name varchar(15) not null,
amount number not null,
primary key (loan_number)
);
create table depositor(
    customer_name varchar(15) not null,
    account_number varchar(15) not null,
    primary key (customer_name,account_number),
    foreign key (account_number) references account1(account_number),
    foreign key (customer_name) references customer(customer_name)
);
create table borrower(
    customer_name varchar(15) not null,
    loan_number varchar(15) not null,
    primary key (customer_name,loan_number),
    foreign key (customer_name) references customer(customer_name),
    foreign key (loan_number) references loan(loan_number)
);

INSERT INTO customer
VALUES('Jones','Main','Harrison');

SELECT * FROM customer;

INSERT INTO customer VALUES('Smith','Main','Rye');
INSERT INTO customer VALUES('Hayes','Main','Harrison');
INSERT INTO customer VALUES('Curry','North','Rye');
INSERT INTO customer VALUES('Lindsay','Park','Pittsfield');
INSERT INTO customer VALUES('Turner','Putnam','Stamford');
INSERT INTO customer VALUES('Williams','Nassau','Princeton');
INSERT INTO customer VALUES('Adams','Spring','Pittsfield');

INSERT INTO customer VALUES('Johnson','Alma','Palo Alto');
INSERT INTO customer VALUES('Glenn','Sand Hill','Woodside');
INSERT INTO customer VALUES('Brooks','Senator','Brooklyn');
INSERT INTO customer VALUES('Green','Walnut','Stamford');
INSERT INTO customer VALUES('Jackson','University','Salt Lake');
INSERT INTO customer VALUES('Majeria','First','Rye');
INSERT INTO customer VALUES('McBride','Safety','Rye');


INSERT INTO branch VALUES('Downtown','Brooklyn','900000');
INSERT INTO branch VALUES('Redwood','Palo Alto','2100000');
INSERT INTO branch VALUES('Perryridge','Horseneck','1700000');
INSERT INTO branch VALUES('Mianus','Horseneck','400200');
INSERT INTO branch VALUES('Round Hill','Horseneck','8000000');
INSERT INTO branch VALUES('Pownal','Bennington','400000');
INSERT INTO branch VALUES('North Town','Rye','3700000');
INSERT INTO branch VALUES('Brighton','Brooklyn','7000000');
INSERT INTO branch VALUES('Central','Rye','400280');

select * from depositor;

INSERT INTO account1 VALUES('A-101','Downtown','500');
INSERT INTO account1 VALUES('A-215','Mianus','700');
INSERT INTO account1 VALUES('A-102','Perryrdige','400');
INSERT INTO account1 VALUES('A-305','Round Hill','350');
INSERT INTO account1 VALUES('A-201','Perryridge','900');
INSERT INTO account1 VALUES('A-222','Redwood','700');
INSERT INTO account1 VALUES('A-217','Brighton','750');
INSERT INTO account1 VALUES('A-333','Central','850');
INSERT INTO account1 VALUES('A-444','North Town','625');

INSERT INTO depositor VALUES('Johnson','A-101');

INSERT INTO depositor VALUES('Smith','A-215');
INSERT INTO depositor VALUES('Hayes','A-102');
INSERT INTO depositor VALUES('Hayes','A-101');
INSERT INTO depositor VALUES('Turner','A-305');
INSERT INTO depositor VALUES('Johnson','A-201');
INSERT INTO depositor VALUES('Jones','A-217');
INSERT INTO depositor VALUES('Lindsay','A-222');
INSERT INTO depositor VALUES('Majeria','A-333');
INSERT INTO depositor VALUES('Smith','A-444');

-- Count the number of disctinct streets in customer table

SELECT Count(*) AS distinctStreet
FROM (SELECT DISTINCT customer_street FROM customer);
