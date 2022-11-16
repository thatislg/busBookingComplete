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

