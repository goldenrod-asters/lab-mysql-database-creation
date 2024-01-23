USE Car_sales

INSERT INTO Cars (VIN, Manufacturer, Model, Year, Color)
VALUES (12345, 'Volkswagen', 'Tiguan', 2019, 'Blue'),
	   (23456,	'Peugeot', 'Rifter', 2019, 'Red'),
	   (34567, 'Ford', 'Fusion', 2018, 'White'),
	   (45678, 'Toyota', 'RAV4', 2018, 'Silver'),
	   (56789,	'Volvo', 'V60', 2019, 'Gray'),
	   (67890, 'Volvo', 'V60 Cross Country', 2019, 'Gray');

SELECT * FROM Car_sales.Cars
        
INSERT INTO Customers (Customer_ID, Customer_Name, Customer_Phone, Customer_Email)
VALUES	(10001, 'Pablo Picasso', '491746176382', 'pablopicasso@gmail.com'),
		(20001,	'Abraham Lincoln', '491628433498', 'abelicoln@hotmail.com'),
        (30001, 'Marie Curie', '491763994839', 'mariecurie67@yahoo.com');
        
SELECT * FROM Car_sales.Customers

INSERT INTO Store_Locations (Location_ID, Location_Name, Location_Address)
VALUES	('Mitte01','Hackescher Markt','Rosenthaler Str. 1'),
		('Friedrichshain02','Boxhagener Platz','Simon Dach Str. 2'),
        ('Kreuzberg05','Maybachufer','Friedelstr. 5');
        
SELECT * FROM Car_sales.Store_Locations

INSERT INTO Salespersons (Staff_ID, Staff_Name, Store_Locations_Location_ID)
VALUES	(00001, 'Petey Cruiser', 'Mitte01'),
		(00002, 'Anna Sthesia', 'Friedrichshain02'),
        (00003, 'Paige Turner', 'Kreuzberg05');

SELECT * FROM Car_sales.Salespersons
        