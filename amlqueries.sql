-- AML SQL Investigation Queries
-- Author: Tarun Raju

------------------------------------------------
-- 1. Players with Pending KYC but Deposits
------------------------------------------------

SELECT p.player_id,
       p.player_name,
       p.kyc_status,
       t.amount,
       t.transaction_type
FROM players p
JOIN transactions t
ON p.player_id = t.player_id
WHERE p.kyc_status = 'Pending'
AND t.transaction_type = 'deposit';



------------------------------------------------
-- 2. Players with High Deposits (>1000 EUR)
------------------------------------------------

SELECT player_id,
       SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'deposit'
GROUP BY player_id
HAVING SUM(amount) > 1000;



------------------------------------------------
-- 3. Players Requesting Withdrawal with Pending KYC
------------------------------------------------

SELECT p.player_id,
       p.player_name,
       p.kyc_status,
       t.amount,
       t.transaction_type
FROM players p
JOIN transactions t
ON p.player_id = t.player_id
WHERE p.kyc_status = 'Pending'
AND t.transaction_type = 'withdrawal';



------------------------------------------------
-- 4. Players with Abnormally High Winnings
------------------------------------------------

SELECT player_id,
       SUM(bet_amount) AS total_bet,
       SUM(win_amount) AS total_win
FROM game_activity
GROUP BY player_id
HAVING SUM(win_amount) > SUM(bet_amount) * 5;



------------------------------------------------
-- 5. Detect Possible Bonus Abuse
-- Small bets with very high winnings
------------------------------------------------

SELECT player_id,
       bet_amount,
       win_amount
FROM game_activity
WHERE bet_amount <= 5
AND win_amount > 200;



------------------------------------------------
-- 6. Players with Multiple Deposits in Short Time
------------------------------------------------

SELECT player_id,
       COUNT(*) AS deposit_count
FROM transactions
WHERE transaction_type = 'deposit'
GROUP BY player_id
HAVING COUNT(*) > 3;



------------------------------------------------
-- 7. Total Deposits vs Total Withdrawals
------------------------------------------------

SELECT player_id,
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS total_deposits,
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS total_withdrawals
FROM transactions
GROUP BY player_id;



------------------------------------------------
-- 8. Players Winning Big Without Depositing Much
------------------------------------------------

SELECT g.player_id,
       SUM(g.win_amount) AS total_win,
       SUM(t.amount) AS total_deposit
FROM game_activity g
JOIN transactions t
ON g.player_id = t.player_id
WHERE t.transaction_type = 'deposit'
GROUP BY g.player_id
HAVING SUM(g.win_amount) > SUM(t.amount) * 3;



------------------------------------------------
-- 9. Players from High Risk Countries
------------------------------------------------

SELECT player_id,
       player_name,
       country
FROM players
WHERE country IN ('UAE');



------------------------------------------------
-- 10. Players with Pending Withdrawals
------------------------------------------------

SELECT player_id,
       amount,
       status
FROM transactions
WHERE transaction_type = 'withdrawal'
AND status = 'pending';
