CREATE TYPE HERO_ROW_TYPE AS OBJECT(
    USER_NAME VARCHAR2 (26 BYTE),
    UNIT_NAME VARCHAR2 (26 BYTE),
    CASTLE VARCHAR2 (26 BYTE),
    GOLD VARCHAR2 (26 BYTE)
);
/    
CREATE TYPE HERO_TABLE_PARAMS_TYPE is TABLE of HERO_ROW_TYPE;
/
CREATE OR REPLACE FUNCTION HERO_INFO(MIN_PRICE INT DEFAULT 0, USER1 VARCHAR2 DEFAULT 'Bob')
RETURN HERO_TABLE_PARAMS_TYPE
PIPELINED
AS
    CURSOR MY_CUR IS 
        SELECT FAV_UNIT.USER_NAME, UNIT_PROPERTY.UNIT_NAME, UNIT_CASTLE.CASTLE_NAME, PROPERTY_VALUE AS GOLD
        FROM UNIT_PROPERTY JOIN UNIT_CASTLE ON UNIT_PROPERTY.UNIT_NAME = UNIT_CASTLE.UNIT_NAME
        JOIN FAV_UNIT ON FAV_UNIT.UNIT_NAME = UNIT_CASTLE.UNIT_NAME
        WHERE PROPERTY_NAME = 'Gold' AND PROPERTY_VALUE > MIN_PRICE AND USER_NAME = USER1;
    USER_NAME VARCHAR2 (26 BYTE);
    UNIT_NAME VARCHAR2 (26 BYTE);
    CASTLE VARCHAR2 (26 BYTE);
    GOLD VARCHAR2 (26 BYTE);
BEGIN  
    OPEN MY_CUR;
    LOOP
        FETCH MY_CUR INTO USER_NAME, UNIT_NAME, CASTLE, GOLD;
        EXIT WHEN MY_CUR%NOTFOUND;
        PIPE ROW(HERO_ROW_TYPE(USER_NAME, UNIT_NAME, CASTLE, GOLD));
    END LOOP;
END;
