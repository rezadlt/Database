-- question 6

   -- PART-A
CREATE TRIGGER PRICE-TRIG
    BEFORE UPDATE OF price
    ON transaction
    REFERENCING NEW AS NPRICE
    FOR EACH ROW
    (UPADATE transaction SET transaction.price = NPRICE.price
        WHERE NPRICE.price < 10 and  1 < NPRICE.price )
	-- PART-B
CREATE TRIGGER PLYR-PAY-TRIG
	AFTER UPDATE ON contract
	REFERENCING NEW AS NPLYR
	FOR EACH ROW
	(UPADATE contract
		SET contract.price = contract.price + 10 WHERE contract.id != NPLYR.id)

CREATE TRIGGER PLYR-PAY-TRIG
	AFTER INSERT ON contract
	REFERENCING NEW AS NPLYR
	FOR EACH ROWs
	(UPADATE contract
		SET contract.price = contract.price + 10 WHERE contract.id != NPLYR.id)         