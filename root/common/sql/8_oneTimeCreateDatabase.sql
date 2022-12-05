-- Project Name : bus
-- Date/Time    : 2022/10/27 20:30:02
-- Author       : Thanh Nhan
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << 注意！！ >>
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
  この機能は A5:SQL Mk-2でのみ有効であることに注意してください。
*/

-- 管理者
--* RestoreFromTempTable
create table OPERATION_MANAGER (
  ADMINSTRATOR_ID SERIAL not null
  , LOGIN_ID VARCHAR(20) not null
  , PASSWORD VARCHAR(30) not null
  , ADMINSTRATOR_NAME VARCHAR(30) not null
  , constraint OPERATION_MANAGER_PKC primary key (ADMINSTRATOR_ID)
) ;

-- バス
--* RestoreFromTempTable
create table BUS (
  BUS_ID SERIAL not null
  , ROW_NUM INTEGER not null
  , COLUMN_NUM INTEGER not null
  , NUMBER_PLACE VARCHAR(3) not null
  , NUMBER_DIVISION VARCHAR(3) not null
  , NUMBER_KANA VARCHAR(1) not null
  , NUMBER_FIRST_HALF VARCHAR(3) not null
  , NUMBER_LATTER_HALF VARCHAR(3) not null
  , constraint BUS_PKC primary key (BUS_ID)
) ;

-- 座席
--* RestoreFromTempTable
create table SEAT (
  SEAT_ID SERIAL not null
  , BUS_ID INTEGER not null
  , RESERVE_ID INTEGER not null
  , SEAT_NUMBER INTEGER not null
  , constraint SEAT_PKC primary key (SEAT_ID)
) ;

-- 会員
--* RestoreFromTempTable
create table MEMBER (
  MEMBER_ID SERIAL not null
  , LOGIN_ID VARCHAR(20) not null
  , PASSWORD VARCHAR(30) not null
  , MEMBER_NAME VARCHAR(30) not null
  , MAIL_ADDRESS VARCHAR(30) not null
  , PHONE_NUMBER CHAR(11) not null
  , constraint MEMBER_PKC primary key (MEMBER_ID)
) ;

-- 予約
--* RestoreFromTempTable
create table RESERVE (
  RESERVE_ID SERIAL not null
  , MEMBER_ID INTEGER not null
  , ROUTE_ID INTEGER not null
  , RESERVED_DATE TIMESTAMP not null
  , DEPARTURE_DATE DATE not null
  , constraint RESERVE_PKC primary key (RESERVE_ID)
) ;

-- 路線
--* RestoreFromTempTable
create table ROUTE (
  ROUTE_ID SERIAL not null
  , DEPARTURE_ID INTEGER not null
  , ARRIVAL_ID INTEGER not null
  , PRICE INTEGER not null
  , BUS_ID INTEGER not null
  , OPERATION_START_DATE DATE not null
  , OPERATION_END_DATE DATE not null
  , SCHEDULED_DEPARTURE_TIME TIMESTAMP not null
  , SCHEDULED_ARRIVAL_TIME TIMESTAMP not null
  , constraint ROUTE_PKC primary key (ROUTE_ID)
) ;

-- 停留所
--* RestoreFromTempTable
create table BUS_STATION (
  BUS_STATION_ID SERIAL not null
  , PREFECTURE VARCHAR(30) not null
  , BUS_STATION_NAME VARCHAR(100) not null
  , constraint BUS_STATION_PKC primary key (BUS_STATION_ID)
) ;

comment on table OPERATION_MANAGER is '管理者';
comment on column OPERATION_MANAGER.ADMINSTRATOR_ID is '管理者ID';
comment on column OPERATION_MANAGER.LOGIN_ID is 'ログインID';
comment on column OPERATION_MANAGER.PASSWORD is 'パスワード';
comment on column OPERATION_MANAGER.ADMINSTRATOR_NAME is '管理者氏名';

comment on table BUS is 'バス';
comment on column BUS.BUS_ID is 'バスID';
comment on column BUS.ROW_NUM is '1列あたりシート数';
comment on column BUS.COLUMN_NUM is 'シート列数';
comment on column BUS.NUMBER_PLACE is 'ナンバープレート地位名';
comment on column BUS.NUMBER_DIVISION is 'ナンバープレート類番号';
comment on column BUS.NUMBER_KANA is 'ナンバープレートひながら';
comment on column BUS.NUMBER_FIRST_HALF is 'ナンバープレート連指定番前半';
comment on column BUS.NUMBER_LATTER_HALF is 'ナンバープレート連指定番後半';

comment on table SEAT is '座席';
comment on column SEAT.SEAT_ID is '座席ID';
comment on column SEAT.BUS_ID is 'バスID';
comment on column SEAT.RESERVE_ID is '予約ID';
comment on column SEAT.SEAT_NUMBER is '座席番号';

comment on table MEMBER is '会員';
comment on column MEMBER.MEMBER_ID is '会員ID';
comment on column MEMBER.LOGIN_ID is 'ログインID';
comment on column MEMBER.PASSWORD is 'パスワード';
comment on column MEMBER.MEMBER_NAME is '氏名';
comment on column MEMBER.MAIL_ADDRESS is 'メールアドレス';
comment on column MEMBER.PHONE_NUMBER is '電話番号';

comment on table RESERVE is '予約';
comment on column RESERVE.RESERVE_ID is '予約ID';
comment on column RESERVE.MEMBER_ID is '会員ID';
comment on column RESERVE.ROUTE_ID is '路線ID';
comment on column RESERVE.RESERVED_DATE is '予約日';
comment on column RESERVE.DEPARTURE_DATE is '出発日';

comment on table ROUTE is '路線';
comment on column ROUTE.ROUTE_ID is '路線ID';
comment on column ROUTE.DEPARTURE_ID is '出発停留所ID';
comment on column ROUTE.ARRIVAL_ID is '到着停留所ID';
comment on column ROUTE.PRICE is '料金';
comment on column ROUTE.BUS_ID is 'バスID';
comment on column ROUTE.OPERATION_START_DATE is '運行開始日';
comment on column ROUTE.OPERATION_END_DATE is '運行終了日';
comment on column ROUTE.SCHEDULED_DEPARTURE_TIME is '出発予定時刻';
comment on column ROUTE.SCHEDULED_ARRIVAL_TIME is '到着予定時刻';

comment on table BUS_STATION is '停留所';
comment on column BUS_STATION.BUS_STATION_ID is '停留所ID';
comment on column BUS_STATION.PREFECTURE is '都道府県';
comment on column BUS_STATION.BUS_STATION_NAME is '名称';

-- BUS TABLE'S SAMPLES DATA
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'群馬','280','あ','1','99');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'大宮','281','い','2','98');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'所沢','282','う','3','97');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'熊谷','283','え','4','96');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'春日部','284','お','5','95');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'千葉','285','さ','6','94');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'習志野','286','し','7','93');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'袖ヶ浦','287','す','8','92');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'野田','288','せ','9','91');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'品川','289','そ','10','90');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'練馬','290','か','11','89');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'足立','291','き','12','88');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'八王子','292','く','13','87');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'多摩','293','け','14','86');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'横浜','294','こ','15','85');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'川崎','295','な','16','84');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'湘南','296','に','17','83');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'相模','297','ぬ','18','82');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'和歌山','100','の','19','81');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'鳥取','101','ま','20','80');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'島根','102','み','21','79');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'岡山','103','む','22','78');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'広島','104','め','23','77');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'福山','105','も','24','76');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'山口','106','ざ','25','75');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'徳島','107','ず','26','74');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'香川','108','ぞ','27','73');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'愛媛','109','は','28','72');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'高知','110','ひ','29','71');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'福岡','111','ふ','30','70');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'北九州','112','へ','31','69');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'久留米','113','ほ','32','68');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'筑豊','114','た','33','67');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'佐賀','115','ち','34','66');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'長崎','116','つ','35','65');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'佐世保','117','て','36','64');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'群馬','118','あ','37','63');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'大宮','119','い','38','62');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'所沢','120','う','39','61');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'熊谷','121','え','40','60');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'春日部','122','お','41','59');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'千葉','123','さ','42','58');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'習志野','124','し','43','57');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'袖ヶ浦','125','す','44','56');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'野田','126','せ','45','55');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'品川','127','そ','46','54');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'練馬','128','か','47','53');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'足立','129','き','48','52');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'八王子','130','く','49','51');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'多摩','131','け','50','50');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'横浜','132','こ','51','49');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'川崎','133','な','52','48');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'湘南','134','に','53','47');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'相模','135','ぬ','54','46');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'和歌山','136','の','55','45');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'鳥取','137','ま','56','44');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'島根','138','み','57','43');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'岡山','139','む','58','42');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'広島','140','め','59','41');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'福山','141','も','60','40');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'山口','142','ざ','61','39');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'徳島','143','ず','62','38');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'香川','144','ぞ','63','37');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'愛媛','145','は','64','36');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'高知','146','ひ','65','35');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'福岡','147','ふ','66','34');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'北九州','148','へ','67','33');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'久留米','149','ほ','68','32');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'筑豊','150','た','69','31');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'佐賀','151','ち','70','30');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'長崎','152','つ','71','29');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'佐世保','153','て','72','28');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'群馬','154','あ','73','27');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'大宮','155','い','74','26');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'所沢','156','う','75','25');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'熊谷','157','え','76','24');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'春日部','158','お','77','23');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'千葉','159','さ','78','22');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'習志野','160','し','79','21');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'袖ヶ浦','161','す','80','20');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'野田','162','せ','81','19');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'品川','163','そ','82','18');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'練馬','164','か','83','17');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'足立','165','き','84','16');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'八王子','166','く','85','15');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'多摩','167','け','86','14');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'横浜','168','こ','87','13');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'川崎','169','な','88','12');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'湘南','170','に','89','11');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'相模','171','ぬ','90','10');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'和歌山','172','の','91','9');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'鳥取','173','ま','92','8');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'島根','174','み','93','7');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'岡山','175','む','94','6');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'広島','176','め','95','5');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'福山','177','も','96','4');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'山口','178','ざ','97','3');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'徳島','179','ず','98','2');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'香川','180','ぞ','99','1');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'愛媛','181','は','1','99');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'高知','182','ひ','2','98');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'福岡','183','ふ','3','97');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'北九州','184','へ','4','96');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'久留米','185','ほ','5','95');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'筑豊','186','た','6','94');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(11,4,'佐賀','187','ち','7','93');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(6,4,'長崎','188','つ','8','92');
INSERT INTO bus
(row_num, column_num, number_place, number_division, number_kana, number_first_half, number_latter_half)
VALUES(5,4,'佐世保','189','て','9','91');

-- BUS_STATION TABLE'S SAMPLES DATA
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','東京駅〔八重洲南口〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','東京駅〔日本橋口〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','東京駅八重洲口前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','赤羽駅東口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','秋葉原駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','浅草雷門');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','池袋駅東口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','上野駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','有明ガーデン');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','新宿駅西口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','田町駅東口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','東京駅丸の内北口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','東京タワー〔構内〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','国際展示場駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','渋谷マークシティ');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','二子玉川ライズ・楽天クリムゾンハウス');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','京王八王子駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','高尾駅南口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','聖蹟桜ヶ丘駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('東京都','中野駅(東京都)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','成田空港第２ターミナル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','成田空港第１ターミナル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','成田空港第３ターミナル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','東京ディズニーシー');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','東京ディズニーランド');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','西船橋駅〔高速バス〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','津田沼駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','第三中学校(千葉県)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','京成津田沼駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','海浜幕張駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','幕張メッセ中央');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','小倉団地入口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','小倉台駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','小倉団地(千葉県)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','千城台北駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','千城台駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','御成台入口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','清爽の街');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','御成台中央');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('千葉県','情報大学正門');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','ＵＳＪ');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','千里ニュータウン');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','大阪梅田〔阪急三番街〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','天王寺駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','湊町バスターミナル〔ＯＣＡＴ〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','名神茨木');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','名神高槻');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','堺東駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','少路駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','新大阪〔阪急バスターミナル〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','和泉中央駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','大阪駅ＪＲ高速バスターミナル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','りんくうタウン駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','阪急茨木市駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','大阪駅前〔東梅田駅〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','あべのハルカス／天王寺駅〔高速バス〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','樟葉駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','枚方市駅北口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','ＪＲ茨木');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('大坂府','ＪＲ堺市駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','つくばセンター');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','赤塚駅北口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','石岡〔高速バス〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','石川三丁目');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','泉入口(常陸大宮市)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','泉町一丁目(茨城県)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','茨城交通大子営業所');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','大塚(水戸市)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','大塚東');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','鹿島宇宙センター');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','鹿嶋市役所');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','鹿島神宮駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','鹿島セントラルホテル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','県自動車学校');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','常陸太田市高速バスターミナル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','鴻巣');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','下広岡');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','自由ケ丘(茨城県)');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','新田中内');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('茨城県','新原三差路');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','伊香保温泉〔見晴下〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','草津温泉バスターミナル');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','渋川駅前');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','伊勢崎駅');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','伊香保石段街');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','桐生駅南口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','太田駅南口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','ＢＵＳターミナルおおた');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','大泉町役場');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','館林市役所');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','前橋バスセンター');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','前橋駅南口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','ｎパーキング日高');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','高崎バスセンター');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','高崎駅東口');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','藤岡インター');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','邑楽町役場');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','安中市役所');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','温泉口〔中之条町四万〕');
INSERT INTO BUS_STATION(PREFECTURE, BUS_STATION_NAME) VALUES
('群馬県','下仁田');

INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id001','123456','Việt Nam Name 001','member001@gmail.com','07035480001');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id002','123456','Việt Nam Name 002','member002@gmail.com','07035480002');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id003','123456','Việt Nam Name 003','member003@gmail.com','07035480003');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id004','123456','Việt Nam Name 004','member004@gmail.com','07035480004');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id005','123456','Việt Nam Name 005','member005@gmail.com','07035480005');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id006','123456','Việt Nam Name 006','member006@gmail.com','07035480006');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id007','123456','Việt Nam Name 007','member007@gmail.com','07035480007');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id008','123456','Việt Nam Name 008','member008@gmail.com','07035480008');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id009','123456','Việt Nam Name 009','member009@gmail.com','07035480009');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id010','123456','Việt Nam Name 010','member010@gmail.com','07035480010');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id011','123456','Việt Nam Name 011','member011@gmail.com','07035480011');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id012','123456','Việt Nam Name 012','member012@gmail.com','07035480012');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id013','123456','Việt Nam Name 013','member013@gmail.com','07035480013');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id014','123456','Việt Nam Name 014','member014@gmail.com','07035480014');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id015','123456','Việt Nam Name 015','member015@gmail.com','07035480015');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id016','123456','Việt Nam Name 016','member016@gmail.com','07035480016');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id017','123456','Việt Nam Name 017','member017@gmail.com','07035480017');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id018','123456','Việt Nam Name 018','member018@gmail.com','07035480018');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id019','123456','Việt Nam Name 019','member019@gmail.com','07035480019');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id020','123456','Việt Nam Name 020','member020@gmail.com','07035480020');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id021','123456','日本 Name 021','member021@gmail.com','07035480021');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id022','123456','日本 Name 022','member022@gmail.com','07035480022');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id023','123456','日本 Name 023','member023@gmail.com','07035480023');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id024','123456','日本 Name 024','member024@gmail.com','07035480024');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id025','123456','日本 Name 025','member025@gmail.com','07035480025');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id026','123456','日本 Name 026','member026@gmail.com','07035480026');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id027','123456','日本 Name 027','member027@gmail.com','07035480027');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id028','123456','日本 Name 028','member028@gmail.com','07035480028');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id029','123456','日本 Name 029','member029@gmail.com','07035480029');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id030','123456','日本 Name 030','member030@gmail.com','07035480030');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id031','123456','日本 Name 031','member031@gmail.com','07035480031');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id032','123456','日本 Name 032','member032@gmail.com','07035480032');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id033','123456','日本 Name 033','member033@gmail.com','07035480033');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id034','123456','日本 Name 034','member034@gmail.com','07035480034');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id035','123456','日本 Name 035','member035@gmail.com','07035480035');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id036','123456','日本 Name 036','member036@gmail.com','07035480036');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id037','123456','日本 Name 037','member037@gmail.com','07035480037');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id038','123456','日本 Name 038','member038@gmail.com','07035480038');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id039','123456','日本 Name 039','member039@gmail.com','07035480039');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id040','123456','日本 Name 040','member040@gmail.com','07035480040');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id041','123456','日本 Name 041','member041@gmail.com','07035480041');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id042','123456','日本 Name 042','member042@gmail.com','07035480042');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id043','123456','日本 Name 043','member043@gmail.com','07035480043');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id044','123456','日本 Name 044','member044@gmail.com','07035480044');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id045','123456','日本 Name 045','member045@gmail.com','07035480045');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id046','123456','日本 Name 046','member046@gmail.com','07035480046');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id047','123456','日本 Name 047','member047@gmail.com','07035480047');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id048','123456','日本 Name 048','member048@gmail.com','07035480048');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id049','123456','日本 Name 049','member049@gmail.com','07035480049');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id050','123456','日本 Name 050','member050@gmail.com','07035480050');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id051','123456','English Name 051','member051@gmail.com','07035480051');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id052','123456','English Name 052','member052@gmail.com','07035480052');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id053','123456','English Name 053','member053@gmail.com','07035480053');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id054','123456','English Name 054','member054@gmail.com','07035480054');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id055','123456','English Name 055','member055@gmail.com','07035480055');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id056','123456','English Name 056','member056@gmail.com','07035480056');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id057','123456','English Name 057','member057@gmail.com','07035480057');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id058','123456','English Name 058','member058@gmail.com','07035480058');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id059','123456','English Name 059','member059@gmail.com','07035480059');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id060','123456','English Name 060','member060@gmail.com','07035480060');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id061','123456','English Name 061','member061@gmail.com','07035480061');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id062','123456','English Name 062','member062@gmail.com','07035480062');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id063','123456','English Name 063','member063@gmail.com','07035480063');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id064','123456','English Name 064','member064@gmail.com','07035480064');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id065','123456','English Name 065','member065@gmail.com','07035480065');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id066','123456','English Name 066','member066@gmail.com','07035480066');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id067','123456','English Name 067','member067@gmail.com','07035480067');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id068','123456','English Name 068','member068@gmail.com','07035480068');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id069','123456','English Name 069','member069@gmail.com','07035480069');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id070','123456','English Name 070','member070@gmail.com','07035480070');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id071','123456','English Name 071','member071@gmail.com','07035480071');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id072','123456','English Name 072','member072@gmail.com','07035480072');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id073','123456','English Name 073','member073@gmail.com','07035480073');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id074','123456','English Name 074','member074@gmail.com','07035480074');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id075','123456','English Name 075','member075@gmail.com','07035480075');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id076','123456','English Name 076','member076@gmail.com','07035480076');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id077','123456','English Name 077','member077@gmail.com','07035480077');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id078','123456','English Name 078','member078@gmail.com','07035480078');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id079','123456','English Name 079','member079@gmail.com','07035480079');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id080','123456','English Name 080','member080@gmail.com','07035480080');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id081','123456','Member Name 081','member081@gmail.com','07035480081');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id082','123456','Member Name 082','member082@gmail.com','07035480082');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id083','123456','Member Name 083','member083@gmail.com','07035480083');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id084','123456','Member Name 084','member084@gmail.com','07035480084');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id085','123456','Member Name 085','member085@gmail.com','07035480085');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id086','123456','Member Name 086','member086@gmail.com','07035480086');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id087','123456','Member Name 087','member087@gmail.com','07035480087');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id088','123456','Member Name 088','member088@gmail.com','07035480088');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id089','123456','Member Name 089','member089@gmail.com','07035480089');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id090','123456','Member Name 090','member090@gmail.com','07035480090');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id091','123456','Member Name 091','member091@gmail.com','07035480091');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id092','123456','Member Name 092','member092@gmail.com','07035480092');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id093','123456','Member Name 093','member093@gmail.com','07035480093');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id094','123456','Member Name 094','member094@gmail.com','07035480094');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id095','123456','Member Name 095','member095@gmail.com','07035480095');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id096','123456','Member Name 096','member096@gmail.com','07035480096');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id097','123456','Member Name 097','member097@gmail.com','07035480097');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id098','123456','Member Name 098','member098@gmail.com','07035480098');
INSERT INTO MEMBER(login_id, password,member_name, mail_address, phone_number) VALUES
('id099','123456','Member Name 099','member099@gmail.com','07035480099');

-- ROUTE TABLE'S SAMPLES DATA
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('1','41','1500','1','2000-01-01','2050-01-01','2000-01-01 00:00:00','2000-01-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('2','42','1600','2','2001-01-01','2050-01-02','2001-01-01 03:00:00','2001-01-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('3','43','1700','3','2002-01-01','2050-01-03','2002-01-01 06:00:00','2002-01-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('4','44','1800','4','2003-01-01','2050-01-04','2003-01-01 09:00:00','2003-01-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('5','45','1900','5','2004-01-01','2050-01-05','2004-01-01 12:00:00','2004-01-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('6','46','2000','6','2005-01-01','2050-01-06','2005-01-01 15:00:00','2005-01-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('7','47','2100','7','2006-01-01','2050-01-07','2006-01-01 18:00:00','2006-01-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('8','48','2200','8','2007-01-01','2050-01-08','2007-01-01 21:00:00','2007-01-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('9','49','2300','9','2008-01-01','2050-01-09','2008-01-01 00:00:00','2008-01-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('10','50','2400','10','2009-01-01','2050-01-10','2009-01-01 03:00:00','2009-01-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('11','51','2500','11','2010-01-01','2050-01-11','2010-01-01 06:00:00','2010-01-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('12','52','2600','12','2000-02-01','2050-01-12','2000-02-01 09:00:00','2000-02-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('13','53','2700','13','2001-02-01','2050-01-13','2001-02-01 12:00:00','2001-02-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('14','54','2800','14','2002-02-01','2050-01-14','2002-02-01 15:00:00','2002-02-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('15','55','2900','15','2003-02-01','2050-01-15','2003-02-01 18:00:00','2003-02-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('16','56','3000','16','2004-02-01','2050-01-16','2004-02-01 21:00:00','2004-02-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('17','57','3100','17','2005-02-01','2050-01-17','2005-02-01 00:00:00','2005-02-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('18','58','3200','18','2006-02-01','2050-01-18','2006-02-01 03:00:00','2006-02-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('19','59','3300','19','2007-02-01','2050-01-19','2007-02-01 06:00:00','2007-02-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('20','60','3400','20','2008-02-01','2050-01-20','2008-02-01 09:00:00','2008-02-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('21','61','3500','21','2009-02-01','2050-01-21','2009-02-01 12:00:00','2009-02-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('22','62','3600','22','2010-02-01','2050-01-22','2010-02-01 15:00:00','2010-02-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('23','63','3700','23','2001-03-01','2050-01-23','2001-03-01 18:00:00','2001-03-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('24','64','3800','24','2002-03-01','2050-01-24','2002-03-01 21:00:00','2002-03-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('25','65','3900','25','2003-03-01','2050-01-25','2003-03-01 00:00:00','2003-03-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('26','66','4000','26','2004-03-01','2050-01-26','2004-03-01 03:00:00','2004-03-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('27','67','4100','27','2005-03-01','2050-01-27','2005-03-01 06:00:00','2005-03-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('28','68','4200','28','2006-03-01','2050-01-28','2006-03-01 09:00:00','2006-03-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('29','69','4100','29','2007-03-01','2055-01-01','2007-03-01 12:00:00','2007-03-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('30','70','4000','30','2008-03-01','2055-01-02','2008-03-01 15:00:00','2008-03-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('31','71','3900','31','2009-03-01','2055-01-03','2009-03-01 18:00:00','2009-03-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('32','72','3800','32','2010-03-01','2055-01-04','2010-03-01 21:00:00','2010-03-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('33','73','3700','33','2001-04-01','2055-01-05','2001-04-01 00:00:00','2001-04-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('34','74','3600','34','2002-04-01','2055-01-06','2002-04-01 03:00:00','2002-04-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('35','75','3500','35','2004-04-01','2055-01-07','2004-04-01 06:00:00','2004-04-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('36','76','3400','36','2004-04-01','2055-01-08','2004-04-01 09:00:00','2004-04-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('37','77','3300','37','2005-04-01','2055-01-09','2005-04-01 12:00:00','2005-04-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('38','78','3200','38','2006-04-01','2055-01-10','2006-04-01 15:00:00','2006-04-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('39','79','3100','39','2007-04-01','2055-01-11','2007-04-01 18:00:00','2007-04-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('40','80','3000','40','2008-04-01','2055-01-12','2008-04-01 21:00:00','2008-04-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('41','81','2900','41','2009-04-01','2055-01-13','2009-04-01 00:00:00','2009-04-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('42','82','2800','42','2010-04-01','2055-01-14','2010-04-01 03:00:00','2010-04-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('43','83','2700','43','2001-05-01','2055-01-15','2001-05-01 06:00:00','2001-05-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('44','84','2600','44','2002-05-01','2055-01-16','2002-05-01 09:00:00','2002-05-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('45','85','2500','45','2005-05-01','2055-01-17','2005-05-01 12:00:00','2005-05-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('46','86','2400','46','2005-05-01','2055-01-18','2005-05-01 15:00:00','2005-05-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('47','87','2300','47','2005-05-01','2055-01-19','2005-05-01 18:00:00','2005-05-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('48','88','2200','48','2006-05-01','2055-01-20','2006-05-01 21:00:00','2006-05-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('49','89','2100','49','2007-05-01','2055-01-21','2007-05-01 00:00:00','2007-05-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('50','90','2000','50','2008-05-01','2055-01-22','2008-05-01 03:00:00','2008-05-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('51','91','1900','51','2009-05-01','2055-01-23','2009-05-01 06:00:00','2009-05-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('52','92','1800','52','2010-05-01','2055-01-24','2010-05-01 09:00:00','2010-05-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('53','93','1700','53','2001-06-01','2055-01-25','2001-06-01 12:00:00','2001-06-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('54','94','1600','54','2002-06-01','2055-01-26','2002-06-01 15:00:00','2002-06-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('55','95','5000','55','2006-06-01','2055-01-27','2006-06-01 18:00:00','2006-06-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('56','96','5100','56','2006-06-01','2055-01-28','2006-06-01 21:00:00','2006-06-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('57','97','5200','57','2006-06-01','2055-01-01','2006-06-01 00:00:00','2006-06-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('58','98','5300','58','2006-06-01','2055-01-02','2006-06-01 03:00:00','2006-06-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('59','99','5400','59','2007-06-01','2055-01-03','2007-06-01 06:00:00','2007-06-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('60','100','5500','60','2008-06-01','2055-01-04','2008-06-01 09:00:00','2008-06-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('61','1','5600','61','2009-06-01','2055-01-05','2009-06-01 12:00:00','2009-06-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('62','2','5700','62','2010-06-01','2055-01-06','2010-06-01 15:00:00','2010-06-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('63','3','5800','63','2001-07-01','2055-01-07','2001-07-01 18:00:00','2001-07-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('64','4','5900','64','2002-07-01','2055-01-08','2002-07-01 21:00:00','2002-07-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('65','5','6000','65','2007-07-01','2055-01-09','2007-07-01 00:00:00','2007-07-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('66','6','6100','66','2007-07-01','2055-01-10','2007-07-01 03:00:00','2007-07-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('67','7','6200','67','2007-07-01','2055-01-11','2007-07-01 06:00:00','2007-07-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('68','8','6300','68','2007-07-01','2055-01-12','2007-07-01 09:00:00','2007-07-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('69','9','6400','69','2007-07-01','2055-01-13','2007-07-01 12:00:00','2007-07-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('70','10','6500','70','2008-07-01','2055-01-14','2008-07-01 15:00:00','2008-07-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('71','11','6600','71','2009-07-01','2055-01-15','2009-07-01 18:00:00','2009-07-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('72','12','6700','72','2010-07-01','2055-01-16','2010-07-01 21:00:00','2010-07-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('73','13','6800','73','2001-08-01','2055-01-17','2001-08-01 00:00:00','2001-08-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('74','14','6900','74','2002-08-01','2055-01-18','2002-08-01 03:00:00','2002-08-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('75','15','7000','75','2008-08-01','2055-01-19','2008-08-01 06:00:00','2008-08-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('76','16','7100','76','2008-08-01','2055-01-20','2008-08-01 09:00:00','2008-08-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('77','17','7200','77','2008-08-01','2055-01-21','2008-08-01 12:00:00','2008-08-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('78','18','7300','78','2008-08-01','2055-01-22','2008-08-01 15:00:00','2008-08-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('79','19','7400','79','2008-08-01','2055-01-23','2008-08-01 18:00:00','2008-08-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('80','20','7500','80','2008-08-01','2055-01-24','2008-08-01 21:00:00','2008-08-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('81','21','7300','81','2009-08-01','2055-01-25','2009-08-01 00:00:00','2009-08-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('82','22','7200','82','2010-08-01','2055-01-26','2010-08-01 03:00:00','2010-08-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('83','23','7100','83','2001-09-01','2055-01-27','2001-09-01 06:00:00','2001-09-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('84','24','7000','84','2002-09-01','2055-01-28','2002-09-01 09:00:00','2002-09-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('85','25','6900','85','2009-09-01','2030-01-01','2009-09-01 12:00:00','2009-09-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('86','26','6800','86','2009-09-01','2030-01-02','2009-09-01 15:00:00','2009-09-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('87','27','6700','87','2009-09-01','2030-01-03','2009-09-01 18:00:00','2009-09-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('88','28','6600','88','2009-09-01','2030-01-04','2009-09-01 21:00:00','2009-09-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('89','29','6500','89','2009-09-01','2030-01-05','2009-09-01 00:00:00','2009-09-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('90','30','6400','90','2009-09-01','2030-01-06','2009-09-01 03:00:00','2009-09-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('91','31','6300','91','2009-09-01','2030-01-07','2009-09-01 06:00:00','2009-09-01 11:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('92','32','6200','92','2010-09-01','2030-01-08','2010-09-01 09:00:00','2010-09-01 14:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('93','33','6100','93','2001-09-01','2030-01-09','2001-09-01 12:00:00','2001-09-01 17:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('94','34','6000','94','2002-09-01','2030-01-10','2002-09-01 15:00:00','2002-09-01 20:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('95','35','5900','95','2009-09-01','2030-01-11','2009-09-01 18:00:00','2009-09-01 23:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('96','36','5800','96','2009-09-01','2030-01-12','2009-09-01 21:00:00','2009-09-01 02:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('97','37','5700','97','2009-09-01','2030-01-13','2009-09-01 00:00:00','2009-09-01 05:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('98','38','5600','98','2009-09-01','2030-01-14','2009-09-01 03:00:00','2009-09-01 08:00:00');
INSERT INTO ROUTE(DEPARTURE_ID, ARRIVAL_ID, PRICE, BUS_ID, OPERATION_START_DATE, 
OPERATION_END_DATE, SCHEDULED_DEPARTURE_TIME, SCHEDULED_ARRIVAL_TIME) 
VALUES
('98','38','5600','98','2009-09-01','2030-01-14','2009-09-01 03:00:00','2009-09-01 08:00:00');

-- RESERVE TABLE'S SAMPLES DATA
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('13','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('93','14','2022-11-14 11:00:00','2022-11-16');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('66','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('85','20','2022-11-20 12:00:00','2022-11-22');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('81','7','2022-11-07 11:00:00','2022-11-09');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('84','4','2022-11-04 10:00:00','2022-11-06');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('39','7','2022-11-07 11:00:00','2022-11-09');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('76','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('57','1','2022-11-01 10:00:00','2022-11-03');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('47','14','2022-11-14 11:00:00','2022-11-16');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('85','19','2022-11-19 12:00:00','2022-11-21');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('32','16','2022-11-16 11:00:00','2022-11-18');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('74','2','2022-11-02 10:00:00','2022-11-04');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('91','18','2022-11-18 12:00:00','2022-11-20');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('28','7','2022-11-07 11:00:00','2022-11-09');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('3','12','2022-11-12 11:00:00','2022-11-14');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('3','2','2022-11-02 10:00:00','2022-11-04');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('56','11','2022-11-11 11:00:00','2022-11-13');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('75','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('23','9','2022-11-09 11:00:00','2022-11-11');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('72','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('93','20','2022-11-20 12:00:00','2022-11-22');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('6','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('26','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('55','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('5','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('68','2','2022-11-02 10:00:00','2022-11-04');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('5','18','2022-11-18 12:00:00','2022-11-20');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('31','7','2022-11-07 11:00:00','2022-11-09');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('31','4','2022-11-04 10:00:00','2022-11-06');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('78','19','2022-11-19 12:00:00','2022-11-21');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('20','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('29','6','2022-11-06 11:00:00','2022-11-08');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('30','5','2022-11-05 10:00:00','2022-11-07');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('43','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('68','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('68','6','2022-11-06 11:00:00','2022-11-08');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('92','1','2022-11-01 10:00:00','2022-11-03');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('23','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('8','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('67','12','2022-11-12 11:00:00','2022-11-14');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('79','4','2022-11-04 10:00:00','2022-11-06');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('20','20','2022-11-20 12:00:00','2022-11-22');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('52','9','2022-11-09 11:00:00','2022-11-11');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('41','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('6','4','2022-11-04 10:00:00','2022-11-06');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('10','18','2022-11-18 12:00:00','2022-11-20');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('84','5','2022-11-05 10:00:00','2022-11-07');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('35','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('1','4','2022-11-04 10:00:00','2022-11-06');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('91','6','2022-11-06 11:00:00','2022-11-08');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('30','16','2022-11-16 11:00:00','2022-11-18');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('52','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('61','10','2022-11-10 11:00:00','2022-11-12');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('5','6','2022-11-06 11:00:00','2022-11-08');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('25','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('91','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('4','14','2022-11-14 11:00:00','2022-11-16');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('67','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('27','5','2022-11-05 10:00:00','2022-11-07');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('9','6','2022-11-06 11:00:00','2022-11-08');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('6','19','2022-11-19 12:00:00','2022-11-21');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('36','4','2022-11-04 10:00:00','2022-11-06');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('26','9','2022-11-09 11:00:00','2022-11-11');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('6','14','2022-11-14 11:00:00','2022-11-16');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('57','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('37','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('25','11','2022-11-11 11:00:00','2022-11-13');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('14','16','2022-11-16 11:00:00','2022-11-18');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('87','11','2022-11-11 11:00:00','2022-11-13');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('31','12','2022-11-12 11:00:00','2022-11-14');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('62','11','2022-11-11 11:00:00','2022-11-13');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('89','2','2022-11-02 10:00:00','2022-11-04');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('11','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('70','20','2022-11-20 12:00:00','2022-11-22');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('78','7','2022-11-07 11:00:00','2022-11-09');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('54','15','2022-11-15 11:00:00','2022-11-17');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('55','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('73','13','2022-11-13 11:00:00','2022-11-15');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('67','20','2022-11-20 12:00:00','2022-11-22');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('21','11','2022-11-11 11:00:00','2022-11-13');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('46','20','2022-11-20 12:00:00','2022-11-22');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('20','7','2022-11-07 11:00:00','2022-11-09');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('21','17','2022-11-17 12:00:00','2022-11-19');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('7','16','2022-11-16 11:00:00','2022-11-18');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('27','17','2022-11-17 12:00:00','2022-11-19');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('46','14','2022-11-14 11:00:00','2022-11-16');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('75','12','2022-11-12 11:00:00','2022-11-14');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('17','11','2022-11-11 11:00:00','2022-11-13');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('8','2','2022-11-02 10:00:00','2022-11-04');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('4','5','2022-11-05 10:00:00','2022-11-07');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('41','5','2022-11-05 10:00:00','2022-11-07');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('95','9','2022-11-09 11:00:00','2022-11-11');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('89','3','2022-11-03 10:00:00','2022-11-05');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('48','8','2022-11-08 11:00:00','2022-11-10');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('63','6','2022-11-06 11:00:00','2022-11-08');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('64','17','2022-11-17 12:00:00','2022-11-19');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('63','12','2022-11-12 11:00:00','2022-11-14');
INSERT INTO RESERVE(member_id, route_id, reserved_date, departure_date)
VALUES ('61','9','2022-11-09 11:00:00','2022-11-11');

-- SEAT TABLE'S SAMPLES DATA
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','1','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('14','2','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','3','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('20','4','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('7','5','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('4','6','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('7','7','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','8','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('1','9','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('14','10','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('19','11','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('16','12','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('2','13','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('18','14','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('7','15','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('12','16','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('2','17','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('11','18','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','19','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('9','20','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','21','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('20','22','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','23','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','24','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','25','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','26','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('2','27','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('18','28','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('7','29','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('4','30','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('19','31','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','32','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('6','33','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('5','34','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','35','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','36','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('6','37','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('1','38','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','39','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','40','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('12','41','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('4','42','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('20','43','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('9','44','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','45','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('4','46','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('18','47','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('5','48','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','49','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('4','50','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('6','51','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('16','52','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','53','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('10','54','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('6','55','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','56','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','57','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('14','58','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','59','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('5','60','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('6','61','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('19','62','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('4','63','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('9','64','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('14','65','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','66','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','67','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('11','68','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('16','69','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('11','70','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('12','71','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('11','72','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('2','73','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','74','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('20','75','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('7','76','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('15','77','7');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','78','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('13','79','7');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('20','80','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('11','81','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('20','82','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('7','83','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('17','84','1');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('16','85','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('17','86','2');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('14','87','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('12','88','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('11','89','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('2','90','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('5','91','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('5','92','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('9','93','4');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('3','94','7');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('8','95','7');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('6','96','6');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('17','97','3');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('12','98','5');
INSERT INTO SEAT(BUS_ID, RESERVE_ID, SEAT_NUMBER) VALUES('9','99','5');

-- OPERATION_MANAGER TABLE'S SAMPLES DATA 
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('yamada','pwyamada','山田 太郎');
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('tranvu','123456789','TRAN LONG VU');
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('gialong','123456789','DUONG GIA LONG');
INSERT INTO operation_manager(login_id,"password",adminstrator_name)
VALUES('hoangnhan','123456789','HOANG THANH NHAN');