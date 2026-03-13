# AML-Fraud-Investigation-using-SQL

# Overview

This project demonstrates how SQL can be used for Anti-Money Laundering (AML) and fraud investigation in an online gaming environment.The objective is to analyse player activity including deposits, withdrawals, and gaming behaviour to detect suspicious patterns such as:

* Players depositing funds with pending KYC

* High deposit activity from individual players

* Abnormal winnings compared to bets

* Potential bonus abuse patterns

The analysis is performed using SQL queries on a structured relational database.

# Database Structure

The project uses three tables to simulate a gaming platform database.

**Players Table**

Stores customer information and KYC status.

| Column	| Description |

player_id - Unique player identifier 
player_name - Player name 
country - Player country
kyc_status - KYC verification status
registration_date -	Account creation date

**Transactions Table**

Stores deposit and withdrawal transactions.

| Column |	Description |

transaction_id - Unique transaction identifier
player_id -	Player identifier
transaction_type - Deposit or Withdrawal
amount - Transaction amount
status - Transaction status
transaction_date - Transaction timestamp

**Game Activity Table**

Stores betting and winnings activity.

| Column |	Description |

activity_id	Activity identifier
player_id	Player identifier
game_name	Game played
bet_amount	Amount wagered
win_amount	Winnings
activity_date	Game timestamp


## Example AML Investigation Queries

**1 Detect Players Depositing with Pending KYC**

SELECT player_name, kyc_status, transaction_type
FROM players
JOIN transactions
ON players.player_id = transactions.player_id
WHERE kyc_status = 'pending'
AND transaction_type = 'deposit';

Purpose:
Detects players who are making deposits without completing KYC verification, which can indicate potential compliance risk.

**2 Identify High Deposit Players**

SELECT player_id, SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'deposit'
GROUP BY player_id
HAVING SUM(amount) > 1000;

Purpose:
Identifies players depositing unusually large amounts, which could indicate money laundering behaviour.

**3 Detect Abnormal Winnings**

SELECT player_id, SUM(win_amount) AS total_winnings
FROM game_activity
GROUP BY player_id
HAVING SUM(win_amount) > 500;

Purpose:
Detects players with unusually high winnings which may indicate bonus abuse or exploit patterns.

**4 Detect Suspicious Betting Patterns**

SELECT player_id, bet_amount, win_amount
FROM game_activity
WHERE win_amount > bet_amount * 20;

Purpose:
Identifies cases where winnings are disproportionately higher than bets, which can indicate suspicious activity.

Skills Demonstrated

SQL Query Writing
Transaction Monitoring
AML Investigation Concepts
Fraud Pattern Analysis
Relational Database Analysis
Data Investigation

Tools Used

Database: PostgreSQL
Query Interface: pgAdmin
Version Control: GitHub

Project Objective

The goal of this project is to demonstrate how data analysis using SQL can support AML and fraud detection processes in financial and gaming platforms.

This project simulates real-world investigation scenarios typically handled by risk, compliance, and fraud monitoring teams.

Author

Tarun Raju 
| Technical Support | AML & Risk Operations
