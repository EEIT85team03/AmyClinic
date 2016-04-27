USE AmyDB
GO

DROP TABLE Score;
DROP TABLE Chat;
DROP TABLE Appointments;
DROP TABLE Schedule;
DROP TABLE Employees;
DROP TABLE OrderItems;
DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE Catagory;
DROP TABLE Members;


CREATE TABLE Catagory(
  cid			DECIMAL(4)		IDENTITY(10,10) PRIMARY KEY,
  name			NVARCHAR(30)	NOT NULL,
);

CREATE TABLE Members(
  mid			DECIMAL(8)		IDENTITY(1000,1) PRIMARY KEY,
  name			NVARCHAR(30)	DEFAULT 'Unknown',  
  pwd			VARCHAR(50)		NOT NULL,
  email			VARCHAR(50)		NOT NULL UNIQUE,
  birthday		DATE			,
  country		VARCHAR(20)		,
  gender		CHAR(1)			NOT NULL,
  addr			NVARCHAR(50)	NOT NULL,
  phone			DECIMAL(10)		NOT NULL,
  height		DECIMAL(3)		,    
  mass			DECIMAL(3)		,			-- weight    
  photo			VARBINARY(MAX)	,
  act_status	DECIMAL(1)		NOT NULL,	-- 1 = active, 0 = inactive    
  num_trans		DECIMAL(4)		DEFAULT 0,	-- number of times client spent money on merchandise
  num_treatment	DECIMAL(4)		Default 0,  -- number of times client received treatments
  num_visits	DECIMAL(4)		DEFAULT 0,	-- number of times client visited 
  total_spent	DECIMAL(15)		DEFAULT 0,	-- total amount spent
  reward_pts	DECIMAL(4)		DEFAULT 0,
  last_visit	DATE			DEFAULT GETDATE(),			-- last client transaction
  memo			NVARCHAR(300)	DEFAULT ' ',  
  join_date		DATETIME		DEFAULT GETDATE(),  
);


CREATE TABLE Products
( 
  pid			DECIMAL(5)		IDENTITY PRIMARY KEY, 
  name			VARCHAR(200)		DEFAULT 'Unknown' UNIQUE,  
  photo			VARBINARY(MAX)	,
  amount		DECIMAL(5)		DEFAULT 0,
  cid			DECIMAL(4)		FOREIGN KEY REFERENCES Catagory, 
  price			DECIMAL(6)		NOT NULL,
  discount		DECIMAL(2)		NOT NULL,
  descrip		NVARCHAR(300)	DEFAULT 'Unspecified',
  ingredients	NVARCHAR(300)	DEFAULT 'Unspecified',
--  date_entered	DATETIME		DEFAULT GETDATE(),  
);


CREATE TABLE Orders
( 
  oid			DECIMAL(10)		IDENTITY PRIMARY KEY, 
  mid			DECIMAL(8)		FOREIGN KEY REFERENCES Members,
  recipient		NVARCHAR(20)	NOT NULL,
  total			DECIMAL(10)		NOT NULL,
  addr			NVARCHAR(50)	NOT NULL,
  phone			DECIMAL(10)		NOT NULL,
  email			VARCHAR(50)		NOT NULL UNIQUE,
  odate			DATETIME		DEFAULT GETDATE(),
  ostatus		DECIMAL(1)		DEFAULT 1, /*	0 = Order Created / Cancellable
												1 = Processing
												2 = Order Complete
												3 = Order Cancelled
										   */
  del_status	DECIMAL(1)		DEFAULT 0, /*	0 = Processing
												1 = Enroute												
												2 = Delivered
											*/
  payment		DECIMAL(1)		DEFAULT 0, /*
												0 = Not yet paid
												1 = Paid in Full
												Partial payment?
											*/ 
  discount		DECIMAL(2)		DEFAULT 0,
);

CREATE TABLE OrderItems
( 
  id			DECIMAL(4)		IDENTITY PRIMARY KEY, 
  oid			DECIMAL(10)		FOREIGN KEY REFERENCES Orders,
  pid			DECIMAL(5)		FOREIGN KEY REFERENCES Products, 
														-- Product name omitted, get from Products table 
  quantity		DECIMAL(4)		NOT NULL,
  price_per		DECIMAL(10)		NOT NULL,
--  discount		DECIMAL(2)		DEFAULT 0,
);

CREATE TABLE Employees
(
  eid			DECIMAL(5)		IDENTITY PRIMARY KEY,
  name			NVARCHAR(30)	DEFAULT 'Unknown',
  photo			VARBINARY(MAX)	,	
  education		NVARCHAR(500)	NOT NULL,
  experience	NVARCHAR(500)	NOT NULL,
  specialty		NVARCHAR(500)	NOT NULL,
);

CREATE TABLE Schedule  -- need to change PK, eid should be FK to employee table
( 
  eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees,   
  c_date		DATE			NOT NULL,
  c_hours		VARCHAR(13)		NOT NULL,
  appt_num		DECIMAL(3)		NOT NULL,
  appt_status	DECIMAL(1)		DEFAULT 1, -- 1 = Normal, 0 = Stopped
  memo			NVARCHAR(300)	DEFAULT ' ',  
);

CREATE TABLE Appointments
(
 aid			DECIMAL(6)		IDENTITY(1000,1) PRIMARY KEY,
 mid			DECIMAL(8)		FOREIGN KEY REFERENCES Members,
 purpose		DECIMAL(1)		DEFAULT 0, -- 0 = new treatment, 1 = repeat visit
 apt_date		DATETIME		NOT NULL,
 procedureid	VARCHAR(300)		, -- maybe foreign key? 
 descrip		NVARCHAR(300)	DEFAULT ' ',  
 apt_status		DECIMAL(1)		DEFAULT 1, -- 0 = cancelled 1 = normal
 eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees, 
);

CREATE TABLE Chat 
( 
  chat_id		DECIMAL(7)		IDENTITY(1,1) PRIMARY KEY,
  eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees,
  mid			DECIMAL(8)		FOREIGN KEY REFERENCES Members,
  record		NVARCHAR(MAX)	NOT NULL,
  chattime		DATETIME		DEFAULT GETDATE(),
);

CREATE TABLE Score
(  
 mid			DECIMAL(8),
 eid			DECIMAL(5),
 scores			DECIMAL(1)		NOT NULL,		
 comment		NVARCHAR(MAX)	NOT NULL,
 score_date		DATETIME		DEFAULT GETDATE(),

 FOREIGN KEY (mid) REFERENCES Members(mid),
 FOREIGN KEY (eid) REFERENCES Employees(eid),
 CONSTRAINT pk_Customer_Id PRIMARY KEY (mid , eid)
 
);
GO

INSERT INTO Catagory VALUES ('Vitamins');
INSERT INTO Catagory VALUES ('Skin Care');	
INSERT INTO Catagory VALUES ('Health Food');	
INSERT INTO Catagory VALUES ('Equipment');	
INSERT INTO Catagory VALUES ('Medicine');		

INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Henry','123','Henry@group3.com','1981-06-24','Taiwan','M','台北市大安區復興南路一段390號2樓','0925377000','178','80','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Carrie','123','Carrie@group3.com','1990-12-12','Taiwan','F','台北市大安區復興南路一段390號2樓','0925332156','160','42','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Beef','123','Beef@group3.com','1989-03-09','Taiwan','M','台北市大安區復興南路一段390號2樓','0959487612','170','65','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Nick','123','Nick@group3.com','1985-07-30','Taiwan','M','台北市大安區復興南路一段390號2樓','0936598102','169','70','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Tca','123','Tca@group3.com','2000-02-28','Taiwan','M','台北市大安區復興南路一段390號2樓','0945976183','185','63','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('K','123','k@group3.com','1970-01-01','Taiwan','M','台北市大安區復興南路一段390號2樓','0909865731','200','59','1');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('MoMo Face Mask','500','20','100','0','Makes your face look younger!','Cloth, water, sugar');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('SuperHealth Vitamin B Suppliments','1000','10','750','10','little round pills of youth!','Sugar, flour, Vitamin B');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('WeiChuan Bottled RedBean Soup','300','30','50','25','Great for Women!','Red Bean, Water, Sugar, Agar');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Panasonic Hydration Mask','100','40','3000','5','Steam those wrinkles away!','Electronic Equipment');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('BigBrand Disinfectent','2000','50','100','0','Infection-be-gone!','Fungus Extract');

INSERT INTO Employees (name, education, experience, specialty) VALUES ('Dr. Pocky','M.D. Brown University','10 years Cosmetic Surgeon at County USC Hospital','Facelift, Liposuction, Facial reconstruction');
INSERT INTO Employees (name, education, experience, specialty) VALUES ('Dr. Kindle','M.D. Yale','5 years Cosmetic Surgeon at India National Health and Beauty Center','Laser hair removal, nose job, hair implants');
INSERT INTO Employees (name, education, experience, specialty) VALUES ('Dr. Hershes','M.D. UCSB','20 years Cosmetic Surgeon at Saint Claire','Everything');

select * from Members
select * from Products
select * from Orders
select * from OrderItems
select * from Schedule
select * from Appointments
select * from Employees
select * from Catagory
select * from Chat
select * from Score
