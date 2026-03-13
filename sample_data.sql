-- AML SQL Investigation Project
-- Sample Data
-- Author: Tarun Raju

-- ==============================
-- Players Table Data
-- ==============================

INSERT INTO players VALUES
(1001,'Lukas Weber','Germany','Verified','2026-01-01'),
(1002,'Amir Khan','Germany','Verified','2026-01-05'),
(1003,'Daniel Costa','Portugal','Pending','2026-01-07'),
(1004,'Max Muller','Germany','Verified','2026-01-08'),
(1005,'Sofia Rossi','Italy','Verified','2026-01-10'),
(1006,'John Smith','UK','Pending','2026-01-11'),
(1007,'Carlos Mendes','Spain','Verified','2026-01-12'),
(1008,'Anna Schmidt','Germany','Verified','2026-01-13'),
(1009,'Ahmed Ali','UAE','Pending','2026-01-14'),
(1010,'Peter Novak','Czech Republic','Verified','2026-01-15');


-- ==============================
-- Transactions Table Data
-- ==============================

INSERT INTO transactions VALUES
(5001,1001,'deposit',200,'success','2026-01-02'),
(5002,1001,'withdrawal',500,'pending','2026-01-03'),
(5003,1002,'deposit',50,'success','2026-01-05'),
(5004,1003,'deposit',3000,'success','2026-01-07'),
(5005,1004,'deposit',100,'success','2026-01-08'),
(5006,1005,'deposit',700,'success','2026-01-10'),
(5007,1006,'deposit',2500,'success','2026-01-11'),
(5008,1007,'deposit',150,'success','2026-01-12'),
(5009,1008,'deposit',300,'success','2026-01-13'),
(5010,1009,'deposit',2000,'success','2026-01-14'),
(5011,1010,'deposit',100,'success','2026-01-15'),
(5012,1003,'withdrawal',500,'pending','2026-01-08'),
(5013,1006,'withdrawal',200,'pending','2026-01-12');


-- ==============================
-- Game Activity Table Data
-- ==============================

INSERT INTO game_activity VALUES
(9001,1001,'Slots',10,100,'2026-01-02'),
(9002,1001,'Slots',10,200,'2026-01-02'),
(9003,1002,'Poker',50,0,'2026-01-05'),
(9004,1003,'Slots',5,500,'2026-01-07'),
(9005,1004,'Roulette',20,50,'2026-01-08'),
(9006,1005,'Slots',10,300,'2026-01-10'),
(9007,1006,'Slots',5,800,'2026-01-11'),
(9008,1007,'Poker',25,0,'2026-01-12'),
(9009,1008,'Slots',10,100,'2026-01-13'),
(9010,1009,'Slots',5,600,'2026-01-14'),
(9011,1010,'Blackjack',20,40,'2026-01-15');
