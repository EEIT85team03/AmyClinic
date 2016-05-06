USE AmyDB
GO


DROP TABLE AppointmentDetail;
DROP TABLE Procedures;
DROP TABLE ProcedureType;
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
  country		NVARCHAR(20)		,
  gender		CHAR(1)			NOT NULL,
  addr			NVARCHAR(50)	NOT NULL,
  phone			VARCHAR(10)		NOT NULL,
  height		DECIMAL(3)		,    
  mass			DECIMAL(3)		,			-- weight    
  photo			VARBINARY(MAX)	,
  photoFileName	NVARCHAR(50)	,
  photoContentType VARCHAR(10)	,
  act_status	DECIMAL(1)		DEFAULT 1,	-- 1 = active, 0 = inactive    
  num_trans		DECIMAL(4)		DEFAULT 0,	-- number of times client spent money on merchandise
  num_treatment	DECIMAL(4)		DEFAULT 0,  -- number of times client received treatments
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
  name			NVARCHAR(200)	NOT NULL UNIQUE,  
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
  phone			VARCHAR(10)		NOT NULL,
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
  pwd			VARCHAR(40)		NOT NULL,
  email			VARCHAR(50)		NOT NULL UNIQUE,
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
 apt_date		DATE			NOT NULL,
 apt_time		NVARCHAR(5)	NOT NULL,
 procedureid	VARCHAR(300)		, -- maybe foreign key? 
 descrip		NVARCHAR(300)	DEFAULT ' ',  
 apt_status		DECIMAL(1)		DEFAULT 1, -- 0 = cancelled 1 = normal
 eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees, 
);

CREATE TABLE ProcedureType
(
  pType_id		DECIMAL(3)		IDENTITY PRIMARY KEY,
  name			NVARCHAR(30)	NOT NULL
);

CREATE TABLE Procedures
(
  procedure_id	DECIMAL(3)		IDENTITY PRIMARY KEY,
  name			NVARCHAR(30)	NOT NULL,
  pType_id		DECIMAL(3)		FOREIGN KEY REFERENCES ProcedureType,
  fee			DECIMAL(9)		DEFAULT '0',
);

CREATE TABLE AppointmentDetail
( 
  ad_id			DECIMAL(4)		IDENTITY PRIMARY KEY, 
  procedure_id	DECIMAL(3)		FOREIGN KEY REFERENCES Procedures,
  aid			DECIMAL(6)		FOREIGN KEY REFERENCES Appointments,
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
 score_id		DECIMAL(4)		IDENTITY PRIMARY KEY,  
 mid			DECIMAL(8),
 eid			DECIMAL(5),
 scores			DECIMAL(1)		NOT NULL,		
 comment		NVARCHAR(MAX)	NOT NULL,
 score_date		DATETIME		DEFAULT GETDATE(),

 FOREIGN KEY (mid) REFERENCES Members(mid),
 FOREIGN KEY (eid) REFERENCES Employees(eid), 
 
);
GO
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Catagory VALUES ('Vitamins');
INSERT INTO Catagory VALUES ('Skin Care');	
INSERT INTO Catagory VALUES ('Health Food');	
INSERT INTO Catagory VALUES ('Equipment');	
INSERT INTO Catagory VALUES ('Medicine');		
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Henry','b15e5db3836bff058b253de60c467e00','Henry@group3.com','1981-06-24','Taiwan','M','台北市大安區復興南路一段390號2樓','0925377000','178','80','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Carrie','b15e5db3836bff058b253de60c467e00','Carrie@group3.com','1990-12-12','Taiwan','F','台北市大安區復興南路一段390號2樓','0925332156','160','42','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Beef','b15e5db3836bff058b253de60c467e00','Beef@group3.com','1989-03-09','Taiwan','M','台北市大安區復興南路一段390號2樓','0959487612','170','65','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Nick','b15e5db3836bff058b253de60c467e00','Nick@group3.com','1985-07-30','Taiwan','M','台北市大安區復興南路一段390號2樓','0936598102','169','70','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Tca','b15e5db3836bff058b253de60c467e00','Tca@group3.com','2000-02-28','Taiwan','M','台北市大安區復興南路一段390號2樓','0945976183','185','63','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('K','b15e5db3836bff058b253de60c467e00','k@group3.com','1970-01-01','Taiwan','M','台北市大安區復興南路一段390號2樓','0909865731','200','59','1');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('MoMo Face Mask','500','20','100','0','Makes your face look younger!','Cloth, water, sugar');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('SuperHealth Vitamin B Suppliments','1000','10','750','10','little round pills of youth!','Sugar, flour, Vitamin B');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('WeiChuan Bottled RedBean Soup','300','30','50','25','Great for Women!','Red Bean, Water, Sugar, Agar');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('Panasonic Hydration Mask','100','40','3000','5','Steam those wrinkles away!','Electronic Equipment');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('BigBrand Disinfectent','2000','50','100','0','Infection-be-gone!','Fungus Extract');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('Dr. Pocky','M.D. Brown University','123','Pocky@Amy.com','10 years Cosmetic Surgeon at County USC Hospital','Facelift, Liposuction, Facial reconstruction');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('Dr. Kindle','M.D. Yale','123','Kindle@Amy.com','5 years Cosmetic Surgeon at India National Health and Beauty Center','Laser hair removal, nose job, hair implants');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('Dr. Hershes','M.D. UCSB','123','Hershes@Amy.com','20 years Cosmetic Surgeon at Saint Claire','Everything');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ProcedureType (name) VALUES ('整形手術');
INSERT INTO ProcedureType (name) VALUES ('雷射光療');
INSERT INTO ProcedureType (name) VALUES ('瘦身雕塑');
INSERT INTO ProcedureType (name) VALUES ('微整形');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Procedures (name,pType_id) VALUES ('豐胸術','1');
INSERT INTO Procedures (name,pType_id) VALUES ('隆鼻術','1');
INSERT INTO Procedures (name,pType_id) VALUES ('脂肪移植','1');
INSERT INTO Procedures (name,pType_id) VALUES ('拉皮術','1');
INSERT INTO Procedures (name,pType_id) VALUES ('蘿蔔腿縮小術','1');
INSERT INTO Procedures (name,pType_id) VALUES ('雙眼皮','1');
INSERT INTO Procedures (name,pType_id) VALUES ('雷射除毛','2');
INSERT INTO Procedures (name,pType_id) VALUES ('雷射淨膚','2');
INSERT INTO Procedures (name,pType_id) VALUES ('雷射除痣','2');
INSERT INTO Procedures (name,pType_id) VALUES ('粉餅雷射','2');
INSERT INTO Procedures (name,pType_id) VALUES ('變頻飛梭','2');
INSERT INTO Procedures (name,pType_id) VALUES ('脈衝光','2');
INSERT INTO Procedures (name,pType_id) VALUES ('震波減脂','3');
INSERT INTO Procedures (name,pType_id) VALUES ('冷凍減脂','3');
INSERT INTO Procedures (name,pType_id) VALUES ('威塑減脂','3');
INSERT INTO Procedures (name,pType_id) VALUES ('水刀抽脂','3');
INSERT INTO Procedures (name,pType_id) VALUES ('爆脂衝擊波','3');
INSERT INTO Procedures (name,pType_id) VALUES ('黃金脂雕','3');
INSERT INTO Procedures (name,pType_id) VALUES ('波尿酸','4');
INSERT INTO Procedures (name,pType_id) VALUES ('晶亮瓷','4');
INSERT INTO Procedures (name,pType_id) VALUES ('水微晶','4');
INSERT INTO Procedures (name,pType_id) VALUES ('膠原蛋白','4');
INSERT INTO Procedures (name,pType_id) VALUES ('微針療程','4');
INSERT INTO Procedures (name,pType_id) VALUES ('無痕植髮','4');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1000','1','1','GoodBoy');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1005','2','0','奧客');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1003','3','1','VIP');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1001','1','1','代宰貴婦');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1002','2','1','小氣巴拉');
INSERT INTO Score (mid,eid,scores,comment) VALUES ('1004','3','1','出手大方');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Chat (eid,mid,record) VALUES ('1','1001','30');
INSERT INTO Chat (eid,mid,record) VALUES ('2','1002','15');
INSERT INTO Chat (eid,mid,record) VALUES ('3','1003','25');
INSERT INTO Chat (eid,mid,record) VALUES ('1','1004','7');
INSERT INTO Chat (eid,mid,record) VALUES ('2','1005','9');
INSERT INTO Chat (eid,mid,record) VALUES ('3','1000','16');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1000','梁啟超','3000','1880 Hartwell Road','0989118086','alvinreidKHg@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1001','Halle Ray','100','3897 Ottawa Road','0937071705','halleraycVv@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1002','Christ Richard','750','1880 Hartwell Road','0973182850','christ@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1003','Jonatan Mendoza','50','5413 Natchez Boulevard','0917301245','jonatanmendozaZaq@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1004','Angelica Booth','6000','	9084 Rundell Lane','0987243640','angelicaboothyHe@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','3000','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('1','4','1','3000');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('2','5','1','100');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('3','2','1','750');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('4','3','1','50');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('5','4','2','6000');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('6','4','1','3000');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,memo) VALUES ('1','2016-6-20','6','2','整形手術');
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,memo) VALUES ('2','2016-6-21','9','3','雷射光療');
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,memo) VALUES ('3','2016-6-22','6','2','瘦身雕塑');
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,memo) VALUES ('1','2016-6-23','1','3','微整形');
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,memo) VALUES ('1','2016-6-24','3','1','整形手術');
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,memo) VALUES ('2','2016-6-30','9','3','雷射光療');
INSERT INTO Schedule (eid,c_date,c_hours,appt_num,appt_status,memo) VALUES ('1','2016-6-30','0','0','0','休假');
  -- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,procedureid,descrip,apt_status,eid) VALUES ('1000','0','2016-6-20','早上','整形手術','Description','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,procedureid,descrip,apt_status,eid) VALUES ('1001','1','2016-6-21','下午','雷射光療','Description','1','2');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,procedureid,descrip,apt_status,eid) VALUES ('1002','1','2016-6-22','早上','瘦身雕塑','Description','1','3');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,procedureid,descrip,apt_status,eid) VALUES ('1003','0','2016-6-23','早上','微整形','Description','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,procedureid,descrip,apt_status,eid) VALUES ('1004','1','2016-6-23','下午','微整形','Description','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,procedureid,descrip,apt_status,eid) VALUES ('1005','0','2016-6-24','早上','整形手術','Description','1','2');
   -- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('4','1000');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1001');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('14','1002');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1003');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1004');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1005');
      -- -------------------------------------------------------------------------------------------------------------------------------------------------------------
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
select * from Procedures;
select * from ProcedureType;
select * from AppointmentDetail;