USE AmyDB
GO


DROP TABLE Appointments;
DROP TABLE Employees;
DROP TABLE Schedule;
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
  first_name	NVARCHAR(30)	DEFAULT 'Unknown',
  last_name		NVARCHAR(30)	DEFAULT 'Unknown',
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
  last_visit	DATE			,			-- last client transaction
  memo			NVARCHAR(300)	DEFAULT ' ',  
  join_date		DATETIME		DEFAULT GETDATE(),  
);

CREATE TABLE Products
( 
  pid			DECIMAL(5)		IDENTITY PRIMARY KEY, 
  name			VARCHAR(20)		DEFAULT 'Unknown' UNIQUE,  
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

CREATE TABLE Schedule  -- need to change PK, eid should be FK to employee table
( 
  eid		DECIMAL(4)		IDENTITY(1000,1) PRIMARY KEY, 
  -- daysofweek	??
  c_date		DATE			NOT NULL,
  c_hours		VARCHAR(13)		NOT NULL,
  appt_num		DECIMAL(3)		NOT NULL,
  appt_status	DECIMAL(1)		DEFAULT 1, -- 1 = Normal, 0 = Stopped
  memo			NVARCHAR(300)	DEFAULT ' ',  
);

CREATE TABLE Employees
(
  eid			DECIMAL(5)		IDENTITY PRIMARY KEY,
  name			NVARCHAR(30)	DEFAULT 'Unknown',
  photo			VARBINARY(MAX)	NOT NULL,	
  education		NVARCHAR(300)	NOT NULL,
  experience	NVARCHAR(300)	NOT NULL,
  specialty		NVARCHAR(300)	NOT NULL,
);

CREATE TABLE Appointments
(
 aid			DECIMAL(6)		IDENTITY(1000,1) PRIMARY KEY,
 mid			DECIMAL(8)		FOREIGN KEY REFERENCES Members,
 purpose		DECIMAL(1)		DEFAULT 0, -- 0 = new treatment, 1 = repeat visit
 apt_date		DATETIME		NOT NULL,
 procedureid	DECIMAL(5)		, --foreign key 
 descrip		NVARCHAR(300)	DEFAULT ' ',  
 apt_status		DECIMAL(1)		DEFAULT 1, -- 0 = cancelled 1 = normal
 eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees, 
);

GO

select * from Members
select * from Products
select * from Orders
select * from OrderItems
select * from Schedule
select * from Appointments
select * from Employees
select * from Catagory
