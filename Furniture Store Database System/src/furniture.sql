PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE administrators (
    adminID INTEGER PRIMARY KEY,
    adminName VARCHAR(255) NOT NULL,
    adminEmail TEXT NOT NULL UNIQUE
);
INSERT INTO administrators VALUES(107992,'Jennifer Lee','jenniferlee@example.com');
INSERT INTO administrators VALUES(187983,'Samantha Lee','samanthalee@example.com');
INSERT INTO administrators VALUES(423903,'Bob Johnson','bob.johnson@example.com');
INSERT INTO administrators VALUES(590324,'David Kim','david.kim@example.com');
INSERT INTO administrators VALUES(648297,'Sarah Lee','sarahlee@example.com');
INSERT INTO administrators VALUES(653424,'Jane Smith','janesmith@example.com');
INSERT INTO administrators VALUES(678970,'Emily Chen','emilychen@example.com');
INSERT INTO administrators VALUES(789792,'John Doe','johndoe@example.com');
INSERT INTO administrators VALUES(791924,'Michael Nguyen','michaelnguyen@example.com');
INSERT INTO administrators VALUES(968427,'Kevin Patel','kevinpatel@example.com');
CREATE TABLE store (
    storeID INTEGER PRIMARY KEY AUTOINCREMENT,
    adminID INTEGER NOT NULL UNIQUE,
    storePhone INTEGER NOT NULL UNIQUE,
    storeAddress VARCHAR(255) NOT NULL UNIQUE,
    CONSTRAINT fk_dir FOREIGN KEY (adminID) REFERENCES administrators (adminID)
);
INSERT INTO store VALUES(1,187983,2345678901,'46 Bur Oak Ave, Markham, ON L6C 3A7');
INSERT INTO store VALUES(2,648297,1234567890,'123 Main St, Ottawa, ON K1S 5P4');
INSERT INTO store VALUES(3,791924,3456789012,'13 Elm St, Toronto, ON M5G 1H1');
INSERT INTO store VALUES(4,789792,4567890123,'321 Pine St, Milton, ON L9T 1K8');
INSERT INTO store VALUES(5,590324,5678901234,'654 Maple Ave, Richmond Hill, ON L4C 2J6');
INSERT INTO store VALUES(6,653424,6789012345,'9 Birch St, Orangeville, ON L9W 3E8');
INSERT INTO store VALUES(7,678970,7890123456,'246 Cedar Ave, Richmond Hill, ON L4C 2B2');
INSERT INTO store VALUES(8,423903,8901234567,'35 Walnut Ave, Toronto, ON M5V 2S1');
INSERT INTO store VALUES(9,107992,9012345678,'864 Oak St, York, ON M9N 2A7');
INSERT INTO store VALUES(10,968427,1234564819,'31 Tippett Rd, North York, ON M3H 0C8');
CREATE TABLE products (
    productID INTEGER PRIMARY KEY,
    productName VARCHAR(255) NOT NULL, storeID INTEGER NOT NULL,
    productCategory VARCHAR(255) NOT NULL,
    productLine VARCHAR(255) NOT NULL,
    vendorName VARCHAR(255) NOT NULL,
    productPrice REAL NOT NULL,
    productDescription VARCHAR(255) NOT NULL,
    stock INTEGER NOT NULL,
    CONSTRAINT fk_dir FOREIGN KEY (storeID) REFERENCES store (storeID),
    CONSTRAINT fk_dir FOREIGN KEY (productCategory) REFERENCES category (productCategory),
    CONSTRAINT fk_dir FOREIGN KEY (productLine) REFERENCES line (productLine),
    CONSTRAINT fk_dir FOREIGN KEY (vendorName) REFERENCES vendor (vendorName)
);
INSERT INTO products VALUES(10681,'Decorative Mirror',10,'Decor','Decor','Macy’s Furniture',99.989999999999987778,'A beautiful and ornate decorative mirror with an elegant frame.',25);
INSERT INTO products VALUES(11671,'L-Shaped Sectional',1,'Living Room','Sofas','Ashley Furniture',1499.9899999999999344,'A spacious and luxurious L-shaped sectional sofa with soft cushions and a sturdy frame.',5);
INSERT INTO products VALUES(12979,'Armchair',2,'Living Room','Chairs','La-Z-Boy',299.9900000000000233,'A comfortable and stylish armchair with a soft fabric and sturdy construction.',15);
INSERT INTO products VALUES(13563,'Storage Ottoman',8,'Living Room','Storage','City Furniture',149.99000000000000554,'Upholstered storage ottoman with reversible tray',30);
INSERT INTO products VALUES(14573,'King Bed',4,'Bedroom','Beds','Ethan Allen',999.9900000000000233,'A luxurious and comfortable king bed with a plush headboard and sturdy construction.',6);
INSERT INTO products VALUES(15719,'Round Dining Table',3,'Dining Room','Tables','Rooms To Go',399.9900000000000233,'A modern and elegant round dining table with a sturdy base and a spacious top.',10);
INSERT INTO products VALUES(15813,'Ladder Bookshelf',5,'Office','Bookcases','Havertys',149.99000000000000554,'A unique and functional ladder bookshelf with multiple shelves and a sturdy frame.',20);
INSERT INTO products VALUES(15876,'Modern Leather Sofa',1,'Living Room','Sofas','Ashley Furniture',1299.9899999999999877,'Contemporary style leather sofa with chrome legs',50);
INSERT INTO products VALUES(16831,'Leather Sofa',1,'Living Room','Sofas','Ashley Furniture',999.9900000000000233,'A comfortable and elegant leather sofa with sturdy construction and plush cushions.',10);
INSERT INTO products VALUES(25814,'Reclining Loveseat',2,'Living Room','Sofas','La-Z-Boy',899.9900000000000233,'Dual reclining loveseat with console',30);
INSERT INTO products VALUES(26782,'Office Chair',6,'Office','Chairs','Macy’s Furniture',199.99000000000000554,'Ergonomic mesh office chair with adjustable headrest',30);
INSERT INTO products VALUES(36869,'Wooden Dining Table',3,'Dining Room','Tables','Ethan Allen',599.9900000000000233,'Solid wood dining table with extendable leaf',20);
INSERT INTO products VALUES(36979,'Bookshelf',7,'Study Room','Bookcases','Ethan Allen',799.9900000000000233,'Large bookshelf with sliding ladder',5);
INSERT INTO products VALUES(41780,'Writing Desk',6,'Office','Desks','IKEA',149.99000000000000554,'A simple and functional writing desk with a minimalist design and spacious work surface.',18);
INSERT INTO products VALUES(45643,'Queen Bed',4,'Bedroom','Beds','Ethan Allen',799.9900000000000233,'A comfortable and stylish queen bed with a sturdy frame and soft headboard.',8);
INSERT INTO products VALUES(54314,'Recliner',2,'Living Room','Chairs','La-Z-Boy',399.9900000000000233,'A soft and cozy recliner with multiple positions for maximum comfort.',20);
INSERT INTO products VALUES(56724,'Patio Sofa',9,'Outdoor','Sofas','Havertys',699.9900000000000233,'Outdoor sofa with all-weather wicker and cushions',20);
INSERT INTO products VALUES(56814,'Queen Platform Bed',4,'Bedroom','Beds','IKEA',349.9900000000000233,'Platform bed with storage drawers',15);
INSERT INTO products VALUES(57281,'Outdoor Dining Set',9,'Outdoor','Dining Room Sets','IKEA',899.9900000000000233,'6-piece outdoor dining set with glass top table and cushioned chairs',15);
INSERT INTO products VALUES(58191,'Outdoor Dining Set',8,'Outdoor','Dining Room Sets','Bob’s Discount Furniture',999.9900000000000233,'A durable and stylish outdoor dining set with a table and six chairs.',6);
INSERT INTO products VALUES(64721,'TV Stand',7,'Living Room','TV Stands','Ashley Furniture',399.9900000000000233,'Entertainment center with barn-style doors',10);
INSERT INTO products VALUES(67942,'Bookcase',5,'Office','Bookcases','Havertys',249.9900000000000233,'A tall and elegant bookcase with plenty of shelf space for all your books and decorative items.',12);
INSERT INTO products VALUES(68674,'Dining Table',3,'Dining Room','Tables','Rooms To Go',599.9900000000000233,'A modern and spacious dining table with a sleek design and durable construction.',15);
INSERT INTO products VALUES(68717,'Accent Armchair',5,'Living Room','Chairs','City Furniture',349.9900000000000233,'Accent chair with floral pattern',20);
INSERT INTO products VALUES(68969,'Upholstered Dining Chairs',3,'Dining Room','Chairs','Havertys',149.99000000000000554,'Set of 4 upholstered dining chairs',40);
INSERT INTO products VALUES(75641,'Storage Cabinet',7,'Storage','Cabinets','City Furniture',349.9900000000000233,'A versatile and spacious storage cabinet with multiple shelves and compartments.',5);
INSERT INTO products VALUES(76987,'Glass Coffee Table',5,'Living Room','Tables','Pier 1 Imports',249.9900000000000233,'Round glass coffee table with metal base',10);
INSERT INTO products VALUES(79818,'Bathroom Vanity',10,'Bathroom','Cabinets','Rooms To Go',599.9900000000000233,'Freestanding bathroom vanity with double sinks',10);
INSERT INTO products VALUES(81872,'Memory Foam Mattress',4,'Bedroom','Mattresses','Rooms To Go',599.9900000000000233,'10-inch memory foam mattress with cooling gel',25);
INSERT INTO products VALUES(94786,'Bathroom Vanity',9,'Bathroom','Storage','Pier 1 Imports',399.9900000000000233,'A sleek and functional bathroom vanity with multiple drawers and a sink.',3);
INSERT INTO products VALUES(98901,'Computer Desk',6,'Office','Desks','Bob’s Discount Furniture',299.9900000000000233,'Modern computer desk with pullout keyboard tray',15);
CREATE TABLE category (
    productCategory VARCHAR(255) PRIMARY KEY,
    categoryDescription VARCHAR(255) NOT NULL
);
INSERT INTO category VALUES('Living Room','Furniture for the living room area');
INSERT INTO category VALUES('Dining Room','Furniture for the dining room area');
INSERT INTO category VALUES('Bedroom','Furniture for the bedroom area');
INSERT INTO category VALUES('Office','Furniture for the office area');
INSERT INTO category VALUES('Condo','Furniture for condos');
INSERT INTO category VALUES('Outdoor','Furniture for outdoor area');
INSERT INTO category VALUES('Bathroom','Furniture for bathroom');
INSERT INTO category VALUES('Decor','Decoration furniture');
INSERT INTO category VALUES('Study Room','Furniture for study room');
INSERT INTO category VALUES('Storage','Furniture for storage purposes');
CREATE TABLE line (
    productLine VARCHAR(255) PRIMARY KEY,
    lineDescription VARCHAR(255) NOT NULL
);
INSERT INTO line VALUES('Sofas','Different types of sofas');
INSERT INTO line VALUES('Chairs','Different types of chairs');
INSERT INTO line VALUES('Tables','Different types of tables');
INSERT INTO line VALUES('Beds','Different types of beds');
INSERT INTO line VALUES('Bookcases','Bookcases and shelving units');
INSERT INTO line VALUES('Desks','Different types of desks');
INSERT INTO line VALUES('Cabinets','Different types of cabinets');
INSERT INTO line VALUES('Mattresses','Different types of mattresses');
INSERT INTO line VALUES('TV Stands','Different types of TV stands');
INSERT INTO line VALUES('Dining Room Sets','Different types of dining room sets');
CREATE TABLE vendor (
    vendorID INTEGER PRIMARY KEY,
    vendorName VARCHAR(255) NOT NULL,
    vendorAddress VARCHAR(255) NOT NULL UNIQUE,
    CONSTRAINT ck_vendor UNIQUE (vendorName)
);
INSERT INTO vendor VALUES(102,'Rooms To Go','8551 St Margarets Road Seymour, IN 47274');
INSERT INTO vendor VALUES(168,'Ashley Furniture','44 E. West Street Ashland, OH 44805');
INSERT INTO vendor VALUES(386,'Pier 1 Imports','7365 Cherry Hill Court Kingston, NY 12401');
INSERT INTO vendor VALUES(526,'Macy’s Furniture','9057 Vermont Road Cockeysville, MD 21030');
INSERT INTO vendor VALUES(592,'Havertys','7075 Princess Street Linden, NJ 07036');
INSERT INTO vendor VALUES(625,'IKEA','7459 Gulf Lane Raeford, NC 28376');
INSERT INTO vendor VALUES(713,'La-Z-Boy','809 North Peg Shop Dr. Ladson, SC 29456');
INSERT INTO vendor VALUES(718,'City Furniture','8779 Windsor St. Fuquay Varina, NC 27526');
INSERT INTO vendor VALUES(786,'Bob’s Discount Furniture','131 Iroquois Street Southgate, MI 48195');
INSERT INTO vendor VALUES(980,'Ethan Allen','611 Penn Street Long Branch, NJ 07740');
CREATE TABLE orders (
    orderNumber INTEGER PRIMARY KEY,
    customerID INTEGER NOT NULL,
    productID INTEGER NOT NULL,
    orderQuantity INTEGER NOT NULL,
    totalPrice REAL NOT NULL,
    orderDate DATE NOT NULL,
    shippingMethod VARCHAR(255) NOT NULL,
    trackingNumber VARCHAR(255),
    CONSTRAINT fk_dir FOREIGN KEY (productID) REFERENCES products (productID),
    CONSTRAINT fk_dir FOREIGN KEY (customerID) REFERENCES customer (customerID),
    CONSTRAINT fk_dir FOREIGN KEY (trackingNumber) REFERENCES courier (trackingNumber)
);
INSERT INTO orders VALUES(1067,110,10681,2,199.97999999999997555,'2022-06-10','Expedited Shipping','123BCD');
INSERT INTO orders VALUES(1382,110,15719,1,399.9900000000000233,'2022-04-13','Standard Shipping','156LAM');
INSERT INTO orders VALUES(2531,102,54314,2,799.98000000000004661,'2022-11-02','Expedited Shipping','456DEF');
INSERT INTO orders VALUES(2651,102,12979,2,599.98000000000004661,'2022-03-12','Standard Shipping','987HZI');
INSERT INTO orders VALUES(3562,103,68674,1,599.9900000000000233,'2022-03-03','Standard Shipping','789GHI');
INSERT INTO orders VALUES(4213,103,11671,1,1499.9899999999999344,'2022-03-10','Standard Shipping','456EFG');
INSERT INTO orders VALUES(4672,104,15813,2,299.98000000000001108,'2022-01-15','Standard Shipping','345GTA');
INSERT INTO orders VALUES(4682,104,45643,1,799.9900000000000233,'2022-05-04','Standard Shipping','123JKL');
INSERT INTO orders VALUES(5328,107,75641,2,699.98000000000004661,'2022-03-07','Standard Shipping','123STU');
INSERT INTO orders VALUES(5542,105,67942,3,749.97000000000006991,'2022-08-05','Standard Shipping','456MNO');
INSERT INTO orders VALUES(6791,106,41780,1,149.99000000000000554,'2022-01-26','Expedited Shipping','789PQR');
INSERT INTO orders VALUES(6871,101,16831,1,999.9900000000000233,'2022-02-01','Standard Shipping','123ABC');
INSERT INTO orders VALUES(7291,104,14573,1,999.9900000000000233,'2022-01-14','Expedited Shipping','654EST');
INSERT INTO orders VALUES(8098,108,58191,1,999.9900000000000233,'2022-12-18','Standard Shipping','456VWX');
INSERT INTO orders VALUES(9532,109,94786,1,399.9900000000000233,'2022-05-09','Standard Shipping','789YZA');
CREATE TABLE customer (
    customerID INTEGER INTEGER PRIMARY KEY,
    customerName VARCHAR(255) NOT NULL UNIQUE,
    customerEmail TEXT NOT NULL UNIQUE,
    customerPhone INTEGER NOT NULL UNIQUE
);
INSERT INTO customer VALUES(101,'John Smith','john.smith@gmail.com',6768139557);
INSERT INTO customer VALUES(102,'Mary Johnson','mary.johnson@yahoo.com',6393642078);
INSERT INTO customer VALUES(103,'David Lee','david.lee@hotmail.com',9022011827);
INSERT INTO customer VALUES(104,'Sarah Kim','sarah.kim@gmail.com',5148356812);
INSERT INTO customer VALUES(105,'Jason Chen','jason.chen@gmail.com',4316528250);
INSERT INTO customer VALUES(106,'Laura Brown','laura.brown@yahoo.com',8195066317);
INSERT INTO customer VALUES(107,'Michael Davis','michael.davis@hotmail.com',9027166542);
INSERT INTO customer VALUES(108,'Julia Taylor','julia.taylor@gmail.com',8674705461);
INSERT INTO customer VALUES(109,'Robert Wilson','robert.wilson@yahoo.com',7092032981);
INSERT INTO customer VALUES(110,'Emily Garcia','emily.garcia@hotmail.com',2044309721);
CREATE TABLE courier (
    trackingNumber VARCHAR(255) PRIMARY KEY,
    courier VARCHAR(255) NOT NULL,
    courierPhone INTEGER NOT NULL
);
INSERT INTO courier VALUES('123ABC','UPS',18007425877);
INSERT INTO courier VALUES('456DEF','FedEx',18004633339);
INSERT INTO courier VALUES('789GHI','DHL',18002255345);
INSERT INTO courier VALUES('123JKL','USPS',18002758777);
INSERT INTO courier VALUES('456MNO','Purolator',18888161333);
INSERT INTO courier VALUES('789PQR','Canpar',18002622772);
INSERT INTO courier VALUES('123STU','Loomis',18005666400);
INSERT INTO courier VALUES('456VWX','Amazon Logistics',18772591757);
INSERT INTO courier VALUES('789YZA','Canada Post',18002683787);
INSERT INTO courier VALUES('123BCD','TNT Express',18004683689);
INSERT INTO courier VALUES('456EFG','Purolator',18888161333);
INSERT INTO courier VALUES('987HZI','FedEx',18004633339);
INSERT INTO courier VALUES('156LAM','DHL',18002255345);
INSERT INTO courier VALUES('654EST','DHL',18002255345);
INSERT INTO courier VALUES('345GTA','DHL',18002255345);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('store',10);
COMMIT;