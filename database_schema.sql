-- AML SQL Investigation Project
-- Database Schema
-- Author: Tarun Raju

-- ==============================
-- Table 1: Players
-- ==============================

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100),
    country VARCHAR(50),
    kyc_status VARCHAR(20),
    registration_date DATE
);

-- ==============================
-- Table 2: Transactions
-- ==============================

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    player_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    status VARCHAR(20),
    transaction_date DATE,
);

-- ==============================
-- Table 3: Game Activity
-- ==============================

CREATE TABLE game_activity (
    activity_id INT PRIMARY KEY,
    player_id INT,
    game_name VARCHAR(50),
    bet_amount DECIMAL(10,2),
    win_amount DECIMAL(10,2),
    activity_date DATE,    
);
