--SET SERVEROUTPUT ON;

SELECT * FROM TABLE(HEROES_PKG.HERO_INFO(0, 'Boba'));
SELECT * FROM TABLE(HEROES_PKG.HERO_INFO(0, 'Bob'));
SELECT * FROM TABLE(HEROES_PKG.HERO_INFO(700, 'Bob'));

BEGIN 
DELETE_UNIT ('Bob', 'Cyclops');
DELETE_UNIT ('Boba', 'Halberdier'); --Вызовет ошибку, но так и запланировано)))
DELETE_UNIT ('Bob', 'Gorgon');
END;
