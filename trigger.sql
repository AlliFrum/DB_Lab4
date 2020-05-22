CREATE OR REPLACE TRIGGER DEL_UNIT
BEFORE DELETE ON FAV_UNIT
FOR EACH ROW
DECLARE
    UNIT_PRICE UNIT_PROPERTY.PROPERTY_VALUE%TYPE := 0;
BEGIN
    SELECT UNIT_PROPERTY.PROPERTY_VALUE INTO UNIT_PRICE
    FROM UNIT_PROPERTY 
    WHERE UNIT_PROPERTY.PROPERTY_NAME = 'Gold' AND UNIT_PROPERTY.UNIT_NAME = :OLD.UNIT_NAME;
    IF UNIT_PRICE < 100 THEN
        RAISE_APPLICATION_ERROR(-20002, 'You shouldn`t delete this unit');
    END IF;
END;




