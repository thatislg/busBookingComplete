
-- 路線
--* RestoreFromTempTable
create table ROUTE (
  ID serial not null
  , DEPARTURE_BUS_STOP_ID integer not null
  , ARRIVAL_BUS_STOP_ID integer not null
  , DEPARTURE_TIME time not null
  , ARRIVAL_TIME time not null
  , PRICE integer not null
  , BUS_ID integer not null
  , RUN_START_DATE date not null
  , RUN_END_DATE date
  , constraint ROUTE_PKC primary key (ID)
) ;

-- 停留所
--* RestoreFromTempTable
create table BUS_STOP (
  ID serial not null
  , NAME text not null
  , constraint BUS_STOP_PKC primary key (ID)
) ;

-- バス
--* RestoreFromTempTable
create table BUS (
  ID serial not null
  , ROW_NUM integer not null
  , COLUMN_NUM integer not null
  , NUMBER_PLACE text not null
  , NUMBER_DIVISION text not null
  , NUMBER_KANA text not null
  , NUMBER_FIRST_HALF text not null
  , NUMBER_LATTER_HALF text not null
  , constraint BUS_PKC primary key (ID)
) ;

create unique index BUS_IX1
  on BUS(NUMBER_PLACE,NUMBER_DIVISION,NUMBER_KANA,NUMBER_FIRST_HALF,NUMBER_LATTER_HALF);

-- 運用管理者
--* RestoreFromTempTable
create table MANAGER (
  ID serial not null
  , LOGIN_ID text not null
  , PASSWORD text not null
  , NAME text not null
  , constraint MANAGER_PKC primary key (ID)
) ;

comment on table ROUTE is '路線';
comment on column ROUTE.ID is 'ID';
comment on column ROUTE.DEPARTURE_BUS_STOP_ID is '出発停留所ID';
comment on column ROUTE.ARRIVAL_BUS_STOP_ID is '到着停留所ID';
comment on column ROUTE.DEPARTURE_TIME is '出発時刻';
comment on column ROUTE.ARRIVAL_TIME is '到着時刻';
comment on column ROUTE.PRICE is '料金';
comment on column ROUTE.BUS_ID is 'バスID';
comment on column ROUTE.RUN_START_DATE is '運行開始日';
comment on column ROUTE.RUN_END_DATE is '運行終了日';

comment on table BUS_STOP is '停留所';
comment on column BUS_STOP.ID is 'ID';
comment on column BUS_STOP.NAME is '停留所名';

comment on table BUS is 'バス';
comment on column BUS.ID is 'ID';
comment on column BUS.ROW_NUM is '1列あたりシート数';
comment on column BUS.COLUMN_NUM is 'シート列数';
comment on column BUS.NUMBER_PLACE is 'ナンバー（地名）';
comment on column BUS.NUMBER_DIVISION is 'ナンバー（分類番号）';
comment on column BUS.NUMBER_KANA is 'ナンバー（かな）';
comment on column BUS.NUMBER_FIRST_HALF is 'ナンバー（一連指定番号前半）';
comment on column BUS.NUMBER_LATTER_HALF is 'ナンバー（一連指定番号後半）';

comment on table MANAGER is '運用管理者';
comment on column MANAGER.ID is 'ID';
comment on column MANAGER.LOGIN_ID is 'ログインID';
comment on column MANAGER.PASSWORD is 'パスワード';
comment on column MANAGER.NAME is '管理者氏名';
