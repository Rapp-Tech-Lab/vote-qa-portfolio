
INSERT INTO precincts (name, code, address, maxVoters) VALUES
('Vulcan Science District', 'NKX-01', '123 Cedar Ln, New Vulcan, TN', 2),
('Mos Eisley Outpost', 'SKX-02', '456 Maple Dr, Tatooine City, TN', 2),
('Atlantis Expedition Zone', 'AND-03', '789 Oak St, Lantea, TN', 4),
('Macross Frontier Sector', 'BLC-04', '321 Pine Rd, New Macross, TN', 5);

INSERT INTO elections (title, startDate, endDate, status) VALUES
('Federation Council Election', '2026-11-01', '2026-11-01', 'Scheduled'),
('Jedi High Council Appointment', '2026-08-15', '2026-08-15', 'Scheduled'),
('Goa''uld System Lord Summit', '2026-03-01', '2026-03-01', 'Closed'),
('UNSC Colonial Budget Vote', '2026-06-10', '2026-06-12', 'Scheduled'),
('Prime Directive Review Draft', '2026-12-01', '2026-12-05', 'Draft'),
('Zentraedi War Tribunal', '2025-11-05', '2025-11-05', 'Closed'),
('Wraith Territory Council', '2026-09-20', '2026-09-20', 'Scheduled');

INSERT INTO voters (firstName, lastName, dob, status, precinctId) VALUES
-- Precinct 1 (At Capacity: 2 Active)
('James', 'Kirk', '1985-04-12', 'Active', 1),
('Leia', 'Organa', '1992-07-23', 'Active', 1),
('Spock', 'SonOfSarek', '1999-09-09', 'Deactivated', 1),
-- Precinct 2 (At Capacity: 2 Active)
('Luke', 'Skywalker', '2000-01-15', 'Active', 2),
('Han', 'Solo', '1988-03-18', 'Active', 2),
('Anakin', 'Skywalker', '1982-08-14', 'Deactivated', 2),
-- Precinct 3 (Under Capacity)
('Jean-Luc', 'Picard', '1965-06-05', 'Active', 3),
('Samantha', 'Carter', '2008-12-03', 'Active', 3),
('Teal''c', 'Jaffa', '1970-12-01', 'Deactivated', 3),
-- Precinct 4 (Under Capacity)
('Hikaru', 'Sulu', '1995-05-25', 'Active', 4),
('Kara', 'Thrace', '2003-10-10', 'Active', 4),
('Nyota', 'Uhura', '1978-11-30', 'Deactivated', 4);

INSERT INTO voter_elections (voterId, electionId, isEligable, hasVoted) VALUES
-- Eligible & Voted (1,1) → Closed elections
(1, 3, 1, 1),
(2, 3, 1, 1),
(4, 3, 1, 1),
(5, 6, 1, 1),
(7, 6, 1, 1),
(10, 3, 1, 1),
-- Eligible & Not Voted (1,0) → Scheduled elections
(1, 1, 1, 0),
(2, 2, 1, 0),
(4, 1, 1, 0),
(5, 2, 1, 0),
(7, 4, 1, 0),
(10, 1, 1, 0),
(11, 7, 1, 0),
-- Not Eligible & Not Voted (0,0)
-- Edge Case 1: Deactivated voters
(3, 1, 0, 0),
(6, 2, 0, 0),
(9, 4, 0, 0),
(12, 7, 0, 0),
-- Edge Case 2: Age restriction (under 18)
(8, 2, 0, 0),
-- Edge Case 3: Draft election (everyone ineligible)
(1, 5, 0, 0),
(4, 5, 0, 0),
(10, 5, 0, 0);
