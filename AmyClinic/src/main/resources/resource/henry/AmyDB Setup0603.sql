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
  cid           DECIMAL(4)      IDENTITY(10,10) PRIMARY KEY,
  name          NVARCHAR(30)    NOT NULL,
);
CREATE TABLE Members(
  mid			DECIMAL(8)		IDENTITY(1000,1) PRIMARY KEY,
  name			NVARCHAR(30)	DEFAULT 'Unknown',  
  pwd			VARCHAR(50)		NOT NULL,
  verify		VARCHAR(50)		DEFAULT '',
  --email			VARCHAR(50)		NOT NULL UNIQUE,
  email			VARCHAR(50)		NOT NULL,
  birthday		DATE			DEFAULT '1970-01-01',
  country		NVARCHAR(20)	DEFAULT '',
  gender		CHAR(1)			, -- enforce in registration code, not enforced to accomodate Google/FB login
  addr			NVARCHAR(50)	, -- ^
  phone			VARCHAR(10)		, -- ^
  height		DECIMAL(3)		,    
  mass			DECIMAL(3)		,			-- weight    
  photo			VARCHAR(50)		,
-- photoFileName	NVARCHAR(50)	,
--  photoContentType VARCHAR(10)	,
  act_status	DECIMAL(1)		DEFAULT 1,	-- 2 = waiting for email confirmation, 1 = active, 0 = inactive    
  num_trans		DECIMAL(4)		DEFAULT 0,	-- number of times client spent money on merchandise
  num_treatment	DECIMAL(4)		DEFAULT 0,  -- number of times client received treatments
  num_visits	DECIMAL(4)		DEFAULT 0,	-- number of times client visited 
  total_spent	DECIMAL(15)		DEFAULT 0,	-- total amount spent
  reward_pts	DECIMAL(7)		DEFAULT 0,
  spent_pts 	DECIMAL(7)		DEFAULT 0,
  last_visit	DATE			DEFAULT GETDATE(),			-- last client transaction
  memo			NVARCHAR(300)	DEFAULT ' ',  
  join_date		DATETIME		DEFAULT GETDATE(),  
);
CREATE TABLE Products
( 
  pid           DECIMAL(5)       IDENTITY PRIMARY KEY, 
  name          NVARCHAR(200)    NOT NULL UNIQUE,  
  photo         VARBINARY(MAX)   ,
  amount        DECIMAL(5)       DEFAULT 0,
  cid           DECIMAL(4)       FOREIGN KEY REFERENCES Catagory, 
  price         DECIMAL(6)       NOT NULL,
  discount      DECIMAL(2)       NOT NULL,
  descrip       NVARCHAR(300)    DEFAULT 'Unspecified',
  ingredients   NVARCHAR(300)    DEFAULT 'Unspecified',
--  date_entered    DATETIME        DEFAULT GETDATE(),  
);
CREATE TABLE Orders
( 
  oid           DECIMAL(10)     IDENTITY PRIMARY KEY, 
  mid           DECIMAL(8)      FOREIGN KEY REFERENCES Members,
  recipient     NVARCHAR(20)    NOT NULL,
  total         DECIMAL(10)     NOT NULL,
  points_spent  DECIMAL(7)      DEFAULT 0,
  addr          NVARCHAR(50)    NOT NULL,
  phone         VARCHAR(10)     NOT NULL,
  email         VARCHAR(50)     NOT NULL,
  odate         DATETIME        DEFAULT GETDATE(),
  ostatus       DECIMAL(1)      DEFAULT 0, /*   0 = Order Created / Cancellable
                                                1 = Processing
                                                2 = Order Complete
                                                3 = Order Cancelled
                                           */
  del_status    DECIMAL(1)      DEFAULT 0, /*   0 = Processing
                                                1 = Enroute                                                
                                                2 = Delivered
                                            */
  payment       DECIMAL(1)      DEFAULT 0, /*
                                                0 = Not yet paid
                                                1 = Paid in Full
                                                Partial payment?
                                            */ 
  discount      DECIMAL(2)      DEFAULT 0,
);
CREATE TABLE OrderItems
( 
  id            DECIMAL(4)      IDENTITY PRIMARY KEY, 
  oid           DECIMAL(10)     FOREIGN KEY REFERENCES Orders,
  pid           DECIMAL(5)      FOREIGN KEY REFERENCES Products, 
                                                        -- Product name omitted, get from Products table 
  quantity      DECIMAL(4)      NOT NULL,
  price_per     DECIMAL(10)     NOT NULL,
--  discount        DECIMAL(2)  DEFAULT 0,
);
CREATE TABLE Employees
(
  eid           DECIMAL(5)      IDENTITY PRIMARY KEY,
  name          NVARCHAR(30)    DEFAULT 'Unknown',
  pwd           VARCHAR(40)     NOT NULL,
  email         VARCHAR(50)     NOT NULL UNIQUE,
  photo         VARBINARY(MAX)  ,    
  education     NVARCHAR(500)   NOT NULL,
  experience    NVARCHAR(500)   NOT NULL,
  specialty     NVARCHAR(500)   NOT NULL,
);
CREATE TABLE Schedule  -- need to change PK, eid should be FK to employee table
( 
  sch_id        DECIMAL(4)      IDENTITY(1000, 1) PRIMARY KEY,
  eid           DECIMAL(5)      FOREIGN KEY REFERENCES Employees,   
  c_date        DATE            NOT NULL,
  c_hours       NVARCHAR(13)    NOT NULL,
  appt_num      DECIMAL(3)      NOT NULL,
  appt_status   DECIMAL(1)      DEFAULT 1, -- 1 = Normal, 0 = Stopped
  memo          NVARCHAR(300)   DEFAULT ' ',  
);
CREATE TABLE Appointments
(
 aid			DECIMAL(6)		IDENTITY(1000,1) PRIMARY KEY,
 mid			DECIMAL(8)		FOREIGN KEY REFERENCES Members,
 purpose		DECIMAL(1)		DEFAULT 0, -- 0 = new treatment, 1 = repeat visit
 apt_date		DATE			NOT NULL,
 apt_time		NVARCHAR(5)	NOT NULL,
-- procedureid	VARCHAR(300)		, -- maybe foreign key? 
 descrip		NVARCHAR(300)	DEFAULT ' ',  
 apt_status		DECIMAL(1)		DEFAULT 1, -- 0 = cancelled 1 = normal
 eid			DECIMAL(5)		FOREIGN KEY REFERENCES Employees, 
);
CREATE TABLE ProcedureType
(
  pType_id      DECIMAL(3)      IDENTITY PRIMARY KEY,
  name          NVARCHAR(30)    NOT NULL
);
CREATE TABLE Procedures
(
  procedure_id  DECIMAL(3)      IDENTITY PRIMARY KEY,
  name          NVARCHAR(30)    NOT NULL,
  pType_id      DECIMAL(3)      FOREIGN KEY REFERENCES ProcedureType,
  fee           DECIMAL(9)      DEFAULT '0',
);
CREATE TABLE AppointmentDetail
( 
  ad_id         DECIMAL(4)      IDENTITY PRIMARY KEY, 
  procedure_id  DECIMAL(3)      FOREIGN KEY REFERENCES Procedures,
  aid           DECIMAL(6)      FOREIGN KEY REFERENCES Appointments,
);
CREATE TABLE Chat 
( 
  chat_id       DECIMAL(7)      IDENTITY(1,1) PRIMARY KEY,
  eid           DECIMAL(5)      FOREIGN KEY REFERENCES Employees,
  mid           DECIMAL(8)      FOREIGN KEY REFERENCES Members,
  record        NVARCHAR(MAX)   NOT NULL,
  chattime      DATETIME        DEFAULT GETDATE(),
);
CREATE TABLE Score
(
 score_id       DECIMAL(4)      IDENTITY PRIMARY KEY,  
 mid            DECIMAL(8)		,
 eid            DECIMAL(5)		,
 aid			DECIMAL(6)		,
 st				DECIMAL(1)		DEFAULT 1,  -- Score status, 1 = normal, 0 = "deleted" do not show
 scores         DECIMAL(1)      NOT NULL,        
 comment        NVARCHAR(MAX)   NOT NULL,
 score_date     DATETIME        DEFAULT GETDATE(),
 FOREIGN KEY (mid) REFERENCES Members(mid),
 FOREIGN KEY (eid) REFERENCES Employees(eid), 
 FOREIGN KEY (aid) REFERENCES Appointments(aid), 
);
GO
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Catagory VALUES ('美容');
INSERT INTO Catagory VALUES ('保養');    
INSERT INTO Catagory VALUES ('面膜');    
INSERT INTO Catagory VALUES ('香水/體香劑');    
INSERT INTO Catagory VALUES ('醫學');        
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Henry','b15e5db3836bff058b253de60c467e00','Henry@group3.com','1981-06-24','Taiwan','M','台北市大安區復興南路一段390號2樓','0925377000','178','80','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Carrie','b15e5db3836bff058b253de60c467e00','Carrie@group3.com','1990-12-12','Taiwan','F','台北市大安區復興南路一段390號2樓','0925332156','160','42','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Beef','b15e5db3836bff058b253de60c467e00','Beef@group3.com','1989-03-09','Taiwan','M','台北市大安區復興南路一段390號2樓','0959487612','170','65','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Nick','b15e5db3836bff058b253de60c467e00','Nick@group3.com','1985-07-30','Taiwan','M','台北市大安區復興南路一段390號2樓','0936598102','169','70','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('Tca','b15e5db3836bff058b253de60c467e00','Tca@group3.com','2000-02-28','Taiwan','M','台北市大安區復興南路一段390號2樓','0945976183','185','63','1');
INSERT INTO Members (name, pwd, email, birthday, country, gender, addr, phone, height, mass, act_status) VALUES ('K','b15e5db3836bff058b253de60c467e00','k@group3.com','1970-01-01','Taiwan','M','台北市大安區復興南路一段390號2樓','0909865731','200','59','1');

/* Member Images are managed by Struts2 and are stored on the server HDD, not stored in DB. DB only contains path information
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m1.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1000;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m2.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1001;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m3.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1002;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m4.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1003;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m5.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1004;
UPDATE Members SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/m6.jpg', SINGLE_BLOB) AS CategoryImage) WHERE mid = 1005;
*/
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('多芬淨白美肌制汗爽身噴霧','500','40','80','20','多芬最懂得呵護女性腋下肌膚有效制汗X淨白美肌','169ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('濟州島綠茶清爽保濕身體乳液','500','40','340','0','清爽補水保濕，潔淨滋養，防敏抗氧化，讓肌膚水潤透亮','300ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('足香粉','500','20','390','10','足部作起=避邪、除穢、化煞，抗菌孳生，泡澡、都舒爽','280ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('親柔芙爽身蜜粉','500','40','690','10','足部作起=避邪、除穢、化煞，抗菌孳生，泡澡、都舒爽','280ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('蘆薈潤澤乳霜','500','20','139','50','極佳保濕防止乾裂肌膚 清爽不黏膩 適用於臉部及全身','220g');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('DHC X disney Alice 聯名限定純欖護唇膏','500','10','290','10','Mr.star日本直送【現貨】新款DHCXdisneyAlice聯名限定純欖護唇膏五月14-17東京連線','1.5g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('瑪莉貓 marie cat 純欖護唇膏','500','10','550','20','純天然的橄欖精華，無色無味，使用起來安心又滋潤，限定款千萬別錯過','1.5g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('蜜桃美臀去角質酵素粉','500','20','599','0','MicCosmo日本原裝 Mic COSMO B3蜜桃美臀去角質酵素粉','125g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('夜遲新谷酵素ORIHIRO NIGHT DIET','500','20','699','10','日本原裝，保證正品','30天份1包5粒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('日本原裝境內版 酵素&酵母','500','20','1500','30','【日本代購-現貨在台】日本原裝境內版 酵素&酵母 自然 革命 體內環保 2G X 60包 日本銷售第一推','2GX60包 ');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('酵素奶昔','500','20','670','10','日本 Natural Healthy Standard 代購 大人氣 酵素 奶昔 現貨在台','風靡日本的人氣酵素現貨在台現貨【印度櫻桃*1、蜂蜜檸檬');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('庶務客日本 現貨 雪肌粹洗面乳','500','20','170','0','* 日本第一品牌洗面乳 * 擠一點點，就有滿滿的泡泡 * 深層清潔,洗後乾爽不黏膩 ','高濃度膠原蛋白');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('科士威~浪漫香水身體乳液','500','40','110','0','淡淡香味','200ml');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('DHC 純欖護唇膏','500','10','160','0','現貨供應，目前日本鎖貨，價格變動大，要買要快!!日本進口、無香料、完美滋潤雙唇!','1.5g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('孕婦孩童指甲油 水性指甲油 花香指甲油','500','10','894','10','ALLOYA 愛若雅 水性環保 指甲油 不再有難聞的化學氣味 而是讓香味持續蔓延 絕對值得您擁有','10ml');

INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('馬油保濕乳霜','500','20','150','10','貓麻吉 日本 Loshi 馬油保濕乳霜 尿素特別配合 身體乳液 220g 原裝進口 馬油護膚霜','220g');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('急潤保濕面膜','500','30','890','0','‧妝前急救，打底保濕 ‧3重水潤威力，妝感服服貼貼 ‧玻尿酸、胺基酸、維他命B3、高濃縮美容液完美基底','7片/盒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('超導恆潤飽水面膜','500','30','890','0','Dr’s Formula來自長庚專業團隊 ‧玻尿酸、胺基酸、維他命B3、高濃縮美容液完美基底 ','7片/盒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('金盞花敏弱呵護面膜','500','30','890','0','‧特別適用曬後肌膚、肌膚敏感者 ‧創新3D立體面膜紙材','7片/盒');
INSERT INTO Products (name, amount, cid, price, discount, descrip, ingredients) VALUES ('淡斑淨膚面膜','500','30','890','0','‧黃金比例3重完美綻白配方 打造細緻純淨之透白亮肌 ‧創新3D立體緊顏面膜 打造迷人肌質 ','7片/盒');
--UPDATE Products 
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p1.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 1;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p2.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 2;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p3.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 3;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p4.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 4;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p5.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 5;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p6.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 6;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p7.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 7;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p8.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 8;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p9.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 9;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p10.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 10;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p11.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 11;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p12.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 12;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p13.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 13;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p14.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 14;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p15.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 15;

UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p16.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 16;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p17.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 17;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p18.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 18;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p19.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 19;
UPDATE Products SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/p20.jpg', SINGLE_BLOB) AS CategoryImage) WHERE pid = 20;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('張文遠','台灣大學醫學院','123','Pocky@Amy.com','臺北馬偕紀念醫院實習醫師(1989-1990)高雄海軍總醫院小兒科少尉醫官(1990-1991)烏坵海軍檢診所內兒科少尉醫官(1991-1992)','雷射去斑/痣、雷射磨皮、脈衝光除痘、脈衝光回春、電波拉皮');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('諸葛亮','成功醫學大學','123','Kindle@Amy.com','成功大學醫學院附設醫院小兒科住院醫師(1992-1995)成功大學醫學院附設醫院小兒科住院總醫師(1995-1996)成功大學醫學院附設醫院美容醫學科研究員(1995-1996)','玻尿酸、肉毒桿菌、美白針、植髮');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('夏侯惇','中山醫藥大學','123','Hershes@Amy.com','國立臺灣大學醫學院醫學系（1978-1985）國立臺灣大學醫學院臨床醫學研究所（1991-1994）國立臺灣大學管理學院高階管理碩士專班 (2006-2009)','抽脂、隆乳、雙眼皮手術、眼袋手術、拉皮手術、隆鼻');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('張君雅','台灣大學醫學院','123','Pocky1@Amy.com','台灣大學醫學院附設醫院小兒心臟科研究員(1996-1997)成功大學醫學院附設醫院美容醫學科研究員(1997-1999)','微整形、醫美市場發展趨勢與醫療環境、超音波醫學、回春類醫學美容');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('史奴比','中國醫藥大學','123','Kindle1@Amy.com','英爵醫美(1995-2013)','美容護膚、微整型注射治療 (玻尿酸、微晶瓷)、韓式隆鼻');
INSERT INTO Employees (name, education, pwd, email, experience, specialty) VALUES ('高飛','M.D. UCSB','123','Hershes1@Amy.com','首爾醫美(1990-2010)','美容醫學手術、美容醫學針劑注射、超音波醫學、基因體醫學');

UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e1.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 1;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e2.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 2;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e3.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 3;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e4.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 4;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e5.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 5;
UPDATE Employees SET photo=(SELECT * FROM OPENROWSET(BULK N'C:/AmyDB/e6.jpg', SINGLE_BLOB) AS CategoryImage) WHERE eid = 6;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ProcedureType (name) VALUES ('整形手術');
INSERT INTO ProcedureType (name) VALUES ('雷射光療');
INSERT INTO ProcedureType (name) VALUES ('瘦身雕塑');
INSERT INTO ProcedureType (name) VALUES ('微整形');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Procedures (name,pType_id,fee) VALUES ('豐胸術','1','100000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('隆鼻術','1','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('脂肪移植','1','50000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('拉皮術','1','30000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('蘿蔔腿縮小術','1','40000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雙眼皮','1','10000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雷射除毛','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雷射淨膚','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('雷射除痣','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('粉餅雷射','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('變頻飛梭','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('脈衝光','2','20000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('震波減脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('冷凍減脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('威塑減脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('水刀抽脂','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('爆脂衝擊波','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('黃金脂雕','3','300000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('波尿酸','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('晶亮瓷','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('水微晶','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('膠原蛋白','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('微針療程','4','4000');
INSERT INTO Procedures (name,pType_id,fee) VALUES ('無痕植髮','4','4000');
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
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1004','Angelica Booth','6000','    9084 Rundell Lane','0987243640','angelicaboothyHe@teleosaurs.xyz');
INSERT INTO Orders (mid,recipient,total,addr,phone,email) VALUES ('1005','Randy Shelton','3000','5672 Mccook Road','0915525479','randysheltonK7r@teleosaurs.xyz');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('1','4','1','3000');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('2','5','1','100');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('3','2','1','750');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('4','3','1','50');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('5','4','2','6000');
INSERT INTO OrderItems (oid,pid,quantity,price_per) VALUES ('6','4','1','3000');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-24' , '早診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-24' , '午診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-24' , '晚診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-25' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-25' , '午診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-25' , '晚診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-26' , '早診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-26' , '午診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-26' , '晚診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-27' , '早診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-27' , '午診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-27' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-28' , '早診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-28' , '午診' , '2' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-28' , '晚診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-30' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-30' , '午診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-30' , '晚診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-5-31' , '早診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-5-31' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-5-31' , '晚診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-1' , '早診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-1' , '午診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-1' , '晚診' , '0' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-2' , '早診' , '1' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-2' , '午診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-2' , '晚診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '4' , '2016-6-3' , '早診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-3' , '午診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-3' , '晚診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-4' , '早診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-4' , '午診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-4' , '晚診' , '0' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-6' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-6' , '午診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-6' , '晚診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-7' , '早診' , '0' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-7' , '午診' , '1' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-7' , '晚診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-8' , '早診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-8' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-8' , '晚診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-9' , '早診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-9' , '午診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-9' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-10' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-10' , '午診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-10' , '晚診' , '3' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-11' , '早診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-11' , '午診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-11' , '晚診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '4' , '2016-6-13' , '早診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-13' , '午診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-13' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-14' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-14' , '午診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-14' , '晚診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-15' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-15' , '午診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-15' , '晚診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-16' , '早診' , '3' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-16' , '午診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-16' , '晚診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-17' , '早診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-17' , '午診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-17' , '晚診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-18' , '早診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-18' , '午診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-18' , '晚診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-20' , '早診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-20' , '午診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-20' , '晚診' , '1' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-21' , '早診' , '2' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-21' , '午診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-21' , '晚診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-22' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-22' , '午診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '5' , '2016-6-22' , '晚診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-23' , '早診' , '2' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-23' , '午診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-23' , '晚診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-24' , '早診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-24' , '午診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-24' , '晚診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-25' , '早診' , '3' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-25' , '午診' , '3' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-25' , '晚診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-27' , '早診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-27' , '午診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-27' , '晚診' , '0' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-28' , '早診' , '3' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-28' , '午診' , '1' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-28' , '晚診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-29' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-29' , '午診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-29' , '晚診' , '3' , '瘦身雕塑' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '5' , '2016-6-30' , '早診' , '0' , '微整形' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-6-30' , '午診' , '3' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-6-30' , '晚診' , '2' , '雷射光療' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '4' , '2016-7-1' , '早診' , '1' , '整形手術' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , appt_status , memo )   VALUES  ( '5' , '2016-7-1' , '午診' , '0' , '0' , '休假' );
INSERT   INTO   Schedule   ( eid , c_date , c_hours , appt_num , memo )   VALUES  ( '6' , '2016-7-1' , '晚診' , '3' , '雷射光療' );

update Schedule set appt_status = 0 where appt_num = 3
  -- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1000','0','2016-6-20','早上','整形手術','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1001','1','2016-6-21','下午','雷射光療','1','2');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1002','1','2016-6-22','早上','瘦身雕塑','1','3');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1003','0','2016-6-23','早上','微整形','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1004','1','2016-6-23','下午','微整形','1','1');
INSERT INTO Appointments (mid,purpose,apt_date,apt_time,descrip,apt_status,eid) VALUES ('1005','0','2016-6-24','早上','整形手術','1','2');
   -- -------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('4','1000');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('7','1001');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('14','1002');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('22','1003');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('19','1004');
INSERT INTO AppointmentDetail (procedure_id,aid) VALUES ('5','1005');
--最終版jack------------------------------------------------------------------------------------------------
select   identity(int, 1,1) as id,year(apt_date) year, month(apt_date) month,pType_id , name , count(*) counts  
INTO SpaToSales
from(
SELECT   Appointments.apt_date apt_date, ProcedureType.pType_id pType_id, ProcedureType.name name
FROM     AppointmentDetail 
INNER JOIN Appointments ON AppointmentDetail.aid = Appointments.aid 
INNER JOIN Procedures ON AppointmentDetail.procedure_id = Procedures.procedure_id 
INNER JOIN ProcedureType ON Procedures.pType_id = ProcedureType.pType_id
		   ) Spatosales
where  YEAR(apt_date) = 2016
group by name,pType_id,MONTH(apt_date) ,year(apt_date)
order by pType_id, MONTH(apt_date)

select * from SpaToSales
------------------------------------------------------------------------------------------------------
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