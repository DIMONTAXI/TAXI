CREATE OR REPLACE PACKAGE BODY CAR_UTILS IS
/*  DESCRIPTION: API for object CARS

--------------------------------------------------------------------------------
-- Date        Version   Developer             Changes
--------------------------------------------------------------------------------
-- 2020.07.12  001.00    DMITRIY.TIMOFEYEV    CREATED. CLM-124522
-------------------------------------------------------------------------------  */

/* ���������� ����� ������ � ������ ����� */
  PROCEDURE ADD_NEW_CAR(P_CARST_ID IN CARS.CARST_CARST_ID%TYPE,
                        P_MODEL IN  CARS.Model%TYPE,
                        P_CAR_NUMBER IN  CARS.CAR_NUMBER%TYPE,
                        P_OWNER_DRV_DRV_ID IN  CARS.OWNER_DRV_DRV_ID%TYPE,
                        P_COMMENTS IN  CARS.COMMENTS%TYPE,
                        RESULT_CODE OUT NUMBER,
                        ERROR_MMESSAGE OUT VARCHAR2) IS
    flag NUMBER := NULL;
    max_car_id number;
  BEGIN
    RESULT_CODE:=RESULT_CODE_SUCCESS;
  /* �������� ��� ��������� �� ��������*/
   IF upper(P_MODEL) like '%���������%' THEN
       RESULT_CODE :=RESULT_CODE_FAIL;
       ERROR_MMESSAGE:= '��������� ��������'
       return;
    END IF;
      /* �������� ������ ���������� */
    SELECT count(1) into flag from CAR_STATUSES C
      WHERE C.CARST_ID =P_CARST_ID;
    IF flag = 0  THEN
       RESULT_CODE :=RESULT_CODE_FAILS;
       ERROR_MMESSAGE:= '������� P_CARST_ID='||P_CARST_ID||' �� ����������';
       RETURN;
    END IF;
      /* ������� ����� ������, ������� ����� ����������� ������������ SEQUENCE */
    SELECT NVL(MAX(C.CAR_ID),1) into MAX_CAR_ID from CARS C;
    INSERT INTO CARS(CAR_ID,CARST_CARST_ID,MODEL,CAR_NUMBER,OWNER_DRV_DRV_ID,COMMENTS,UPDATE_DATE)
    VALUES (MAX_CAR_ID,P_CARST_ID,P_MODEL,P_CAR_NUMBER,P_OWNER_DRV_DRV_ID,P_COMMENTS,SYSDATE);

    RESULT_CODE :=RESULT_CODE_SUCCESS;
     ERROR_MMESSAGE:= '������ ��������� ������ CAR_ID='||MAX_CAR_ID;
    RETURN;

  EXCEPTION
    WHEN OTHERS THEN
       RESULT_CODE :=RESULT_CODE_FAILS;
       ERROR_MMESSAGE:= '����������� ������' ||dbms_utility.format_error_stack || chr(13) || dbms_utility.format_error_backtrace;

   END;
END CAR_UTILS;
/