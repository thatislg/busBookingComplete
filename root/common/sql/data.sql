-- BUS TABLE'S SAMPLES DATA
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(14, 3, '練馬', '530', 'あ', '12', '34');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(16, 4, '名古屋', '280', 'そ', '23', '45');

-- OPERATION_MANAGER TABLE'S SAMPLES DATA 
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('yamada','pwyamada','山田 太郎');
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('tranvu','123456789','TRAN LONG VU');
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('gialong','123456789','DUONG GIA LONG');
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('hoangnhan','123456789','HOANG THANH NHAN');

-- BUS_STATION TABLE'S SAMPLES DATA
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京','新宿駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉','千葉駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城','茨城駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('栃木','日光駅');

-- ROUTE TABLE'S SAMPLES DATA
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','4','1000','1','2015-01-11','2030-01-11','2015-01-11 10:30:00','2015-01-11 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','2','1500','2','2015-01-12','2030-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');