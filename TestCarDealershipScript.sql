use cardealership;

-- query 1
select * from dealerships;

-- query 2
select * from inventory
where dealership_id = 200;

-- query 3
select * from vehicle
where vin = 425;

-- query 4
select dealerships.`name`, address, phone from inventory
inner join dealerships on inventory.dealership_id = dealerships.dealership_id
where vin = 425;

-- query 5
select d.`name`, v.* from inventory as i
join vehicle as v on i.vin = v.vin
join dealerships as d on i.dealership_id = d.dealership_id
where vehicle_type = 'SUV';

-- query 6
select * from inventory as i
join vehicle as v on i.vin = v.vin
join sales_contracts as sc on sc.vin = v.vin
where i.dealership_id = 200;