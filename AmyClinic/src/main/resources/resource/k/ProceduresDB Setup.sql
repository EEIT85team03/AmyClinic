USE AmyDB
GO
TRUNCATE TABLE Procedures;
TRUNCATE TABLE ProcedureType;
GO

INSERT INTO ProcedureType (name) VALUES ('整形手術');
INSERT INTO ProcedureType (name) VALUES ('雷射光療');
INSERT INTO ProcedureType (name) VALUES ('瘦身雕塑');
INSERT INTO ProcedureType (name) VALUES ('微整形');

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

select * from Procedures;
select * from ProcedureType;