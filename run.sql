--SET SERVEROUTPUT ON;

SELECT * FROM TABLE(HEROES_PKG.HERO_INFO(0, 'Boba'));
SELECT * FROM TABLE(HEROES_PKG.HERO_INFO(0, 'Bob'));
SELECT * FROM TABLE(HEROES_PKG.HERO_INFO(700, 'Bob'));


BEGIN 
HEROES_PKG.DELETE_UNIT ('Bob', 'Cyclops');
HEROES_PKG.DELETE_UNIT ('Boba', 'Halberdier'); --will give an error, as planned)))
HEROES_PKG.DELETE_UNIT ('Bob', 'Gorgon');
END;
