CREATE OR REPLACE PACKAGE CAR_UTILS IS
/*  DESCRIPTION: API for object CARS

--------------------------------------------------------------------------------
-- Date        Version   Developer             Changes
--------------------------------------------------------------------------------
-- 2020.07.12  001.00    DMITRIY.TIMOFEYEV    CREATED. CLM-124522
-------------------------------------------------------------------------------  */

  Current_Version VARCHAR(20) := '001.01';
  RESULT_CODE_SUCCESS   constant number := 1; -- код успеха
  RESULT_CODE_FAILS   constant number := 0; --  код ошибки
 /* Доавление новой машины в список такси */
  PROCEDURE ADD_NEW_CAR(P_CARST_ID IN CARS.CARST_CARST_ID%TYPE,
                        P_MODEL IN  CARS.Model%TYPE,
                        P_CAR_NUMBER IN  CARS.CAR_NUMBER%TYPE,
                        P_OWNER_DRV_DRV_ID IN  CARS.OWNER_DRV_DRV_ID%TYPE,
                        P_COMMENTS IN  CARS.COMMENTS%TYPE,
                        RESULT_CODE OUT NUMBER,
                        ERROR_MMESSAGE OUT VARCHAR2);

END CAR_UTILS;
/