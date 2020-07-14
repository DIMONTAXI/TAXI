
PROMPT > Table "ORDER_STATUSES"
CREATE  TABLE "ORDER_STATUSES" (
    "ORDST_ID"                        NUMBER(10) NOT NULL,
    "DEF"                            VARCHAR2(100) NOT NULL,
    CONSTRAINT "ORDST_PK"
       PRIMARY KEY ( ORDST_ID )
   );
;
-- Add comments to the table 

PROMPT > Comment "ORDER_STATUSES"
comment on table Order_statuses
  is 'Order statuses for Orders';
comment on column Order_statuses.Ordst_id
  is 'Primary key identifier.';
comment on column Order_statuses.def
  is 'status description';
  
  PROMPT > Insert rows into "ORDER_STATUSES"
insert into Order_statuses (ORDST_ID, DEF) values (1, 'Новый');
insert into Order_statuses (ORDST_ID, DEF) values (2, 'закреплен водитель');
insert into Order_statuses (ORDST_ID, DEF) values (3, 'клиент сел в машину');
insert into Order_statuses (ORDST_ID, DEF) values (4, 'отменен по вине клиента до посадки в машину');
insert into Order_statuses (ORDST_ID, DEF) values (5, 'отменен по вине водителя до посадки в машину');
insert into Order_statuses (ORDST_ID, DEF) values (6, 'отменен по вине клиента во время поездки');
insert into Order_statuses (ORDST_ID, DEF) values (7, 'отменен по вине водителя во время поездки');
insert into Order_statuses (ORDST_ID, DEF) values (8, 'успешно выполнен, оплачен');
COMMIT;


-- table  CAR_STATUSES
PROMPT > Table "CAR_STATUSES"
CREATE  TABLE "CAR_STATUSES" (
    "CARST_ID"                        NUMBER(10) NOT NULL,
    "DEF"                            VARCHAR2(100) NOT NULL,
    CONSTRAINT "CARST_PK"
       PRIMARY KEY ( CARST_ID )
   );
;
-- Add comments to the table 

PROMPT > Comment "CAR_STATUSES"
comment on table CAR_STATUSES
  is 'CAR statuses for table CARS';
comment on column CAR_STATUSES.CARST_ID
  is 'Primary key identifier.';
comment on column CAR_STATUSES.DEF
  is 'status description';
  
  PROMPT > Insert rows into "CAR_STATUSES"
insert into CAR_STATUSES (CARST_ID, DEF) values (1, 'Исправно');
insert into CAR_STATUSES (CARST_ID, DEF) values (2, 'Не работае');
insert into CAR_STATUSES (CARST_ID, DEF) values (3, 'Не работает на такси');
COMMIT;

-- table  DRIVER_STATUSES
PROMPT > Table "DRIVER_STATUSES"
CREATE  TABLE "DRIVER_STATUSES" (
    "DRVST_ID"                        NUMBER(10) NOT NULL,
    "DEF"                            VARCHAR2(100) NOT NULL,
    CONSTRAINT "DRVST_PK"
       PRIMARY KEY ( DRVST_ID )
   );
;
-- Add comments to the table 

PROMPT > Comment "DRIVER_STATUSES"
comment on table DRIVER_STATUSES
  is 'Driver statuses for table DRIVERs';
comment on column DRIVER_STATUSES.DRVST_ID
  is 'Primary key identifier.';
comment on column DRIVER_STATUSES.DEF
  is 'status description';
  
  PROMPT > Insert rows into "DRIVER_STATUSES"
insert into DRIVER_STATUSES (DRVST_ID, DEF) values (1, 'Работает со своей машиной');
insert into DRIVER_STATUSES (DRVST_ID, DEF) values (2, 'Работает на машине такси');
insert into DRIVER_STATUSES (DRVST_ID, DEF) values (3, 'В отпуске');
insert into DRIVER_STATUSES (DRVST_ID, DEF) values (4, 'Контракт расторгнут');
COMMIT;


PROMPT > Table "WORKING_SHIFT_STATUSES"
CREATE  TABLE "WORKING_SHIFT_STATUSES" (
    "WRKST_ID"                        NUMBER(10) NOT NULL,
    "DEF"                            VARCHAR2(100) NOT NULL,
    CONSTRAINT "WRKST_PK"
       PRIMARY KEY ( WRKST_ID )
   );
;
-- Add comments to the table 

comment on table WORKING_SHIFT_STATUSES
  is 'Driver statuses for table DRIVERs';
comment on column WORKING_SHIFT_STATUSES.WRKST_ID
  is 'Primary key identifier.';
comment on column WORKING_SHIFT_STATUSES.DEF
  is 'status description';
  
insert into WORKING_SHIFT_STATUSES (WRKST_ID, DEF) values (1, 'Готов брать заказы');
insert into WORKING_SHIFT_STATUSES (WRKST_ID, DEF) values (2, 'Перерыв во время смены');
insert into WORKING_SHIFT_STATUSES (WRKST_ID, DEF) values (3, 'Завершил смену');
COMMIT;

PROMPT > Table "CLIENTS"
CREATE TABLE CLIENTS
(
   CLNT_ID  NUMBER(10) NOT NULL,
   PHONE VARCHAR(11) NOT NULL,
    FULL_NAME VARCHAR(100) NULL,
   BLCK_BLCK_ID NUMBER(10) NULL,
   BNS_BNS_ID NUMBER(10) NULL,
   GOOD_TRIPS NUMBER(10) DEFAULT 0  NOT NULL ,
   BAD_TRIPS NUMBER(10) DEFAULT 0 NOT NULL, 
   CONSTRAINT CLNT_ID_PK PRIMARY KEY (CLNT_ID)
 );  

 
comment on table CLIENTS
  is 'Clients of taxi';
comment on column CLIENTS.CLNT_ID
  is 'Primary key identifier';
comment on column CLIENTS.PHONE
  is 'client phone'
comment on column CLIENTS.BLCK_BLCK_ID
  is 'If client in black list, reference to black list table'
comment on column CLIENTS.BNS_BNS_ID
  is 'cient in bonus program, reference to bonus program'
comment on column CLIENTS.GOOD_TRIPS
  is 'total count of successfull trips'
comment on column CLIENTS.BAD_TRIPS
  is 'total count of failed trips'
  
PROMPT > Table "CLIENT_HISTORIES" 

CREATE TABLE CLIENT_HISTORIES
(
  CLNT_CLNT_ID  NUMBER(10) NOT NULL,
   PHONE VARCHAR(11) NOT NULL,
   FULL_NAME VARCHAR(100) NULL,
   ADDRESS VARCHAR(100) NULL,
   COMMENTS VARCHAR2(200), 
   UPDATE_DATE DATE, 
   UPDATE_USER VARCHAR2(50),
   START_DATE DATE,
   END_DATE DATE,
   CONSTRAINT CLNT_HISTORIES_PK PRIMARY KEY (CLNT_CLNT_ID,START_DATE, END_DATE),
   CONSTRAINT "CLH_CLNT_CLNT__FK"
   FOREIGN KEY ( "CLNT_CLNT_ID" )    REFERENCING "CLIENTS"  ( "CLNT_ID" )            
 
 );         
 
 comment on table CLIENTS
  is 'Clients of taxi';
comment on column CLIENTS.CLNT_ID
  is 'Primary key identifier';
comment on column CLIENTS.COMMENTS
  is 'any comment about client'
comment on column CLIENTS.UPDATE_DATE
  is 'last update date';
comment on column CLIENTS.UPDATE_USER
  is 'user name updated current row'
comment on column CLIENTS.START_DATE
  is 'start date of the row'
comment on column CLIENTS.END_DATE
  is 'end date of the row'

PROMPT > Table "CARS" 
   

CREATE TABLE CARS
(
   CAR_ID  NUMBER(10) NOT NULL,
   CARST_CARST_ID NUMBER(10) NOT NULL,
   MODEL VARCHAR2(200) NOT NULL,
   CAR_NUMBER VARCHAR(100) NOT NULL,
   OWNER_DRV_DRV_ID NUMBER(10) NULL,
   COMMENTS VARCHAR2(200) NOT NULL,
   UPDATE_DATE DATE,
   CONSTRAINT CAR_PK PRIMARY KEY (CAR_ID),
   CONSTRAINT "CAR_CARST_CARST_FK"
       FOREIGN KEY ( "CARST_CARST_ID" )
       REFERENCING "CAR_STATUSES"
                   ( "CARST_ID" ),
   CONSTRAINT "CAR_OWNER_DRV_FK"
       FOREIGN KEY ( "OWNER_DRV_DRV_ID" )
       REFERENCING "DRIVERS"
                   ( "DRV_ID" )             
 );
 
 COMMENT ON COLUMN CARS.CAR_ID
  IS 'PRIMARY KEY';
COMMENT ON COLUMN CARS.CARST_CARST_ID
  IS 'REFERENCE TO CAR STATUSES';
COMMENT ON COLUMN CARS.MODEL
  IS 'MODEL OF CAR';
COMMENT ON COLUMN CARS.CAR_NUMBER
  IS 'CAR NUMBER';
COMMENT ON COLUMN CARS.OWNER_DRV_DRV_ID
  IS 'REFEREMCE TO OWNER OF CAR IF CAR DOESN''T BELONG TO TAXI PARK';
COMMENT ON COLUMN CARS.UPDATE_DATE
  IS 'LAST UPDATE OF INFORMATION';

  
PROMPT > Table "DRIVERS"
  
  CREATE TABLE DRIVERS
(  DRV_ID  NUMBER(10) NOT NULL,
   DRVST_DRVST_ID NUMBER(10) NOT NULL,
   FULL_NAME VARCHAR2(200) NOT NULL,
   PASPORT VARCHAR(100) NOT NULL,
   COMMENTS VARCHAR2(200) NOT NULL,
   RATE_PLAN_PERCENT NUMBER(10,2),
   UPDATE_DATE DATE,
   CONSTRAINT DRV_PK PRIMARY KEY (DRV_ID),
   CONSTRAINT "DRV_DRVST_DRVST_FK"  FOREIGN KEY ( "DRVST_DRVST_ID" )
   REFERENCING "DRIVER_STATUSES" ( "DRVST_ID" )            
 );

 COMMENT ON COLUMN DRIVERS.DRV_ID
  IS 'PRIMARY KEY';
COMMENT ON COLUMN DRIVERS.DRVST_DRVST_ID
  IS 'REFERENCE';
COMMENT ON COLUMN DRIVERS.FULL_NAME
  IS 'FULL NAME';
COMMENT ON COLUMN DRIVERS.PASPORT
  IS 'PASSPORT NUMBER';
COMMENT ON COLUMN DRIVERS.RATE_PLAN_PERCENT
  IS 'DRIVER SHOUL PAY TO TAXI PARK PERCENT OF REVENUE ';
COMMENT ON COLUMN DRIVERS.UPDATE_DATE
  IS 'LAST UPDATE OF INFORMATION';

  
PROMPT > Table "WORKING_SHIFT"


CREATE TABLE WORKING_SHIFT
(
   WRK_ID  NUMBER(10) NOT NULL,
   WRKST_WRKST_ID NUMBER(10) NOT NULL,
   CAR_CAR_ID   NUMBER(10) NOT NULL,
   DRV_DRV_ID  NUMBER(10) NOT NULL,
   START_DATE DATE NOT NULL,
   END_DATE DATE,
   TOTAL_INCOME NUMBER(10,2),
   PAID_TAXI_PARK NUMBER(10,2),
   REST_MONEY_TO_TAXI_PAK  NUMBER(10,2),
   CONSTRAINT WRK_PK primary key (WRK_ID),
  CONSTRAINT "WRK_WRKST_WRKST_FK"  FOREIGN KEY ( "WRKST_WRKST_ID" )
   REFERENCING "WORKING_SHIFT_STATUSES" ( "WRKST_ID" )     
);    

PROMPT > Table "ORDERS"


CREATE TABLE ORDERS
(
   ORD_ID  NUMBER(10) NOT NULL,
   ORDST_ORDST_ID NUMBER(10) NOT NULL,
   ADREESS_FROM VARCHAR2(200) NOT NULL,
   ADDRESS_TO VARCHAR2(200) NOT NULL,
   PRICE NUMBER(10,2), 
   DESIRED_ARRIVAL_DATE DATE,
   ACTUAL_ARRIVAL_DATE DATE,
   CLNT_CLNT_ID NUMBER(10),
   WRK_WRK_ID NUMBER(10),
   START_DATE_ORDER DATE,
   END_DATE_ORDER DATE,
       CONSTRAINT ORD_PK PRIMARY KEY (ORD_ID),
         CONSTRAINT "ORD_ORDST_ORDST_FK"
       FOREIGN KEY ( "ORDST_ORDST_ID" )
       REFERENCING "ORDER_STATUSES"
                   ( "ORDST_ID" ),
         CONSTRAINT "ORD_WRK_WRK_FK"
       FOREIGN KEY ( "WRK_WRK_ID" )
       REFERENCING "WORKING_SHIFT"
                   ( "WRK_ID" ),
         CONSTRAINT "ORD_CLNT_CLNT_FK"
       FOREIGN KEY ( "CLNT_CLNT_ID" )
       REFERENCING "CLIENTS"
                   ( "CLNT_ID" )             
 );

PROMPT > Table "ORDER_HISTORIES"
 
CREATE TABLE ORDER_HISTORIES
(
   ORD_ORD_ID  NUMBER(10) NOT NULL,
   ORDST_ORDST_ID NUMBER(10) NOT NULL,
   ADREESS_FROM VARCHAR2(200) NOT NULL,
   ADDRESS_TO VARCHAR2(200) NOT NULL,
   PRICE NUMBER(10,2), 
   DESIRED_ARRIVAL_DATE DATE,
   ACTUAL_ARRIVAL_DATE DATE,
   WRK_WRK_ID NUMBER(10), 
   START_DATE_ORDER DATE,
   END_DATE_ORDER DATE,
   UPDATE_DATE DATE,
   UPDATE_USER VARCHAR2(50),
   START_DATE DATE,
   END_DATE DATE,
   COMMENTS VARCHAR2(100),
       CONSTRAINT ORH_PK PRIMARY KEY (ORD_ORD_ID, START_DATE, END_DATE),
       CONSTRAINT "ORH_ORD_ORD_FK"
       FOREIGN KEY ( "ORD_ORD_ID" )
       REFERENCING "ORDERS"
                   ( "ORD_ID" ),
       CONSTRAINT "ORH_ORDST_ORDST_FK"
       FOREIGN KEY ( "ORDST_ORDST_ID" )
       REFERENCING "ORDER_STATUSES"
                   ( "ORDST_ID" ),
         CONSTRAINT "ORH_WRK_WRK_FK"
       FOREIGN KEY ( "WRK_WRK_ID" )
       REFERENCING "WORKING_SHIFT"
                   ( "WRK_ID" )
                                             
 );

 
PROMPT > View "REVENUE_30_DAYS"


CREATE OR REPLACE VIEW REVENUE_30_DAYS AS
/*  DESCRIPTION: CUMULATIVE REVENUE FOR LAST 30 DAYS 

--------------------------------------------------------------------------------
-- Date        Version   Developer             Changes
--------------------------------------------------------------------------------
-- 2020.07.12  001.00    DMITRIY.TIMOFEYEV    CREATED. CLM-124522
-------------------------------------------------------------------------------  */

SELECT TO_CHAR(DAY, 'YYYY.MM.DD') "DAY", 
      SM AS "REVENUE PER DAY",
      SUM(SM) OVER (ORDER BY DAY) AS "CUMULATIVE REVENUE", 
      SUM(SM)  OVER () AS "TOTAL REVENUE",
      ROUND( 100.0 * SUM(SM) OVER (ORDER BY DAY)  /   SUM(SM) OVER (), 2 ) AS "PERCENT OF REVENUE"
	  FROM 
     ( SELECT TRUNC(O.END_DATE_ORDER) DAY, SUM(O.PRICE) SM FROM ORDERS O
          WHERE O.END_DATE_ORDER > TRUNC(SYSDATE-30) 
          AND O.ORDST_ORDST_ID = 8 /* УСПЕШНЫЕ ЗАКАЗЫ */ 
          GROUP BY TRUNC(O.END_DATE_ORDER));




