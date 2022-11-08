-- BUS TABLE'S SAMPLES DATA
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(14, 3, '練馬', '530', 'あ', '12', '34');

INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(16, 4, '名古屋', '280', 'そ', '23', '45');

INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(16, 4, '千葉', '282', 'う', '24', '453');

INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(16, 4, '茨城', '283', 'か', '25', '458');

INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(16, 4, '栃木', '284', 'ま', '231', '450');

INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(16, 4, '大阪', '285', 'た', '232', '453');


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

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','2','1200','2','2016-01-12','2031-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','2','1300','2','2017-01-12','2032-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','2','1400','2','2018-01-12','2033-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','2','1700','5','2019-01-12','2034-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','2','1800','3','2010-01-12','2035-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','3','2200','4','2019-01-12','2034-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');

INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','4','2200','6','2010-01-12','2035-01-12','2015-01-12 10:30:00','2015-01-12 15:00:00');


-- MEMBER TABLE'S SAMPLES DATA
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('vutran', '123456', 'TRAN LONG VU', 'longvu@hotmail.com', '01234567890' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('hoangnhan', '123456', 'TRANHOANGNHAN', 'longvu1@hotmail.com', '01234567891' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('gialong', '123456', 'DUONG GIA LONG', 'longvu2@hotmail.com', '01234567892' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('vutran1', '123456', 'TRAN LONG VU', 'longvu11@hotmail.com', '01234567893' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('hoangnhan1', '123456', '井上', 'longvu12@hotmail.com', '01234567894' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('gialong1', '123456', '田島', 'longvu21@hotmail.com', '01234567895' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('hoangnhan2', '123456', '加藤', 'longvu111@hotmail.com', '01234567896' );

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('gialong2', '123456', '吉川', 'longvu211@hotmail.com', '01234567897' );

-- RESERVE TABLE'S SAMPLES DATA
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (1, 1, '2016-01-11 10:00:00', '2016-01-12');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (1, 2, '2015-01-11 10:00:00', '2015-01-12');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (1, 3, '2016-01-13 10:00:00', '2016-01-14');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (1, 7, '2015-10-13 10:00:00', '2015-11-14');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (1, 10, '2015-10-13 10:00:00', '2015-11-14');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (1, 11, '2018-10-13 10:00:00', '2018-11-14');


INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (2, 1, '2016-01-11 10:00:00', '2016-01-12');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (2, 2, '2015-01-11 10:00:00', '2015-01-12');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (2, 3, '2016-01-13 10:00:00', '2016-01-14');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (3, 1, '2016-01-11 10:00:00', '2016-01-12');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (3, 2, '2015-01-11 10:00:00', '2015-01-12');

INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES (3, 3, '2016-01-13 10:00:00', '2016-01-14');
