CREATE OR REPLACE PROCEDURE update_show (coefficient NUMBER)
IS v_nb_lignes NUMBER;
BEGIN
UPDATE has_price_hpr
SET hpr_seat_price = hpr_seat_price * coefficient
WHERE hpr_shw_id NOT IN (SELECT DISTINCT shw_id FROM booking_bkg);
v_nb_lignes := SQL%ROWCOUNT;
DBMS_OUTPUT.PUT_LINE('Nombre de spectacles mis a jour : ' || v_nb_lignes);
END;