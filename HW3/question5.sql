-- question 5

   -- PART-A
CREATE ASSERTION TOT_TRANSACTION_CHECK
		CHECK (NOT EXISTS (SELECT COUNT(deposit.time) AS  number_deposit, deposit.depositor AS depositor  
			FROM  deposit
			GROUP BY depositor
			HAVING time > time0)
			FULL OUTER JOIN 
    SELECT COUNT(withdraw.time) AS number_withdraw,   withdraw.withdrawer AS withdraw
			FROM  withdraw
			GROUP BY withdrawer
			HAVING time > time0
			ON withdrawer = depositor
			WHERE (number_deposit+number_withdraw > 10) 
          
	-- PART-B
CREATE ASSERTION TOTPLAYER-CHECK
		CHECK (NOT EXISTS (SELECT COUNT(PLAYER_ID) AS PLAYER, TEAM_ID)
			FROM CONTRACT
			GROUP BY (TEAM_ID)
			HAVING (PLAYER>15)                                                                                                                                                                                                                                                                       
