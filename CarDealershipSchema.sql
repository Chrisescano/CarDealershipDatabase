create schema cardealers;

create table dealerships(
	dealership_id int not null auto_increment,
	`name` varchar(50),
	address varchar(50),
	phone varchar(12),
	primary key(dealership_id)
);

alter table inventory
add foreign key(dealership_id) references dealerships(dealership_id);

alter table inventory
add foreign key(vin) references vehicle(vin);

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
	inventory_id int not null auto_increment,
	dealership_id int,
    vin int,
    primary key(inventory_id)
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

-- adding data
use cardealership;

-- vehicle
INSERT INTO vehicle VALUES
('425', 2003, 'Honda', 'Accord', 'Car', 'Blue', 85000, 8000.00, 0),
('808', 2017, 'Tesla', 'Model S', 'Car', 'Red', 30000, 50000.00, 1),
('802', 2013, 'Ford', 'F-150', 'Truck', 'Silver', 75000, 20000.00, 0),
('261', 2021, 'Acura', 'NSX', 'Car', 'Black', 1500, 150000.00, 0),
('618', 2011, 'Harley-Davidson', 'Sportster', 'Motorcycle', 'Black', 12000, 9000.00, 1),
('637', 2017, 'BMW', 'X5', 'SUV', 'White', 40000, 35000.00, 0),
('683', 2014, 'Chevrolet', 'Tahoe', 'SUV', 'Gray', 60000, 25000.00, 1),
('777', 2005, 'Chevrolet', 'Corvette', 'Car', 'Yellow', 30000, 18000.00, 0),
('728', 2012, 'Ford', 'Focus', 'Car', 'Green', 55000, 10000.00, 1),
('811', 2013, 'Lexus', 'RX 350', 'SUV', 'Silver', 45000, 28000.00, 0),
('753', 2016, 'Lexus', 'IS 300', 'Car', 'Blue', 35000, 26000.00, 1),
('787', 2016, 'Nissan', 'Maxima', 'Car', 'Black', 40000, 18000.00, 0),
('158', 2012, 'Ford', 'Expedition', 'SUV', 'White', 70000, 22000.00, 1),
('473', 2015, 'Jeep', 'Grand Cherokee', 'SUV', 'Red', 50000, 23000.00, 0),
('947', 2011, 'Honda', 'Civic', 'Car', 'Silver', 60000, 9000.00, 1);

-- dealerships
INSERT INTO dealerships VALUES
(100, 'ABC Motors', '123 Main Street', '555-123-4567'),
(200, 'XYZ Auto Group', '456 Oak Avenue', '555-987-6543'),
(300, '123 Car Haven', '789 Elm Boulevard', '555-555-7890');

-- inventory
INSERT INTO Inventory VALUES
(1, 100, '425'),
(2, 100, '808'),
(3, 200, '802'),
(4, 200, '261'),
(5, 300, '618'),
(6, 300, '637'),
(7, 100, '683'),
(8, 200, '777'),
(9, 300, '728'),
(10, 100, '811'),
(11, 200, '753'),
(12, 300, '787'),
(13, 100, '158'),
(14, 200, '473'),
(15, 300, '947');

-- sales contracts
INSERT INTO sales_contracts VALUES
(1, '2023-01-15', 'Alice Johnson', '808', 4500.00, 150.00, 100.00, 0.03, 36, 1),
(2, '2023-02-20', 'Bob Smith', '802', 3200.00, 120.00, 80.00, 0.025, 48, 1),
(3, '2023-03-25', 'Charlie Brown', '618', 6000.00, 200.00, 150.00, 0, 0, 0),
(4, '2023-04-10', 'David Wilson', '753', 2600.00, 90.00, 60.00, 0.028, 60, 1),
(5, '2023-05-05', 'Eva Davis', '728', 1800.00, 80.00, 50.00, 0.02, 24, 1),
(6, '2023-06-15', 'Frank Miller', '158', 2500.00, 100.00, 70.00, 0.025, 48, 1),
(7, '2023-07-20', 'Grace Turner', '947', 900.00, 40.00, 30.00, 0, 0, 0);