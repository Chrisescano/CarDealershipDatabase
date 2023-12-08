create schema cardealers;

create table dealerships(
	dealership_id int not null auto_increment,
	`name` varchar(50),
	address varchar(50),
	phone varchar(12),
	primary key(dealership_id)
);

create table vehicle(
    vin int,
    `year` int,
	make varchar(20),
    model varchar(20),
    vehicle_type varchar(20),
    color varchar(20),
    mileage int,
    price int,
    SOLD boolean,
    primary key(vin)
);

create table inventory(
	dealership_id int,
    vin int,
    primary key(vin)
);

create table sales_contracts(
	id int not null auto_increment,
    `date` varchar(10),
    customer_name varchar(30),
    vin int,
    sales_tax_amount double,
    recording_fee double,
    processing_fee double,
    loan_rate double,
    loan_term double,
    is_financed boolean,
    primary key(id),
    foreign key(vin) references vehicle(vin)
);