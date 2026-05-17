-- Fresh Initialization / Database Reset
-- Covers scenario's where the database is either:
--      1) Removed before Schema is ran
--      2) Pre-existing and we want a fresh start when the schema is imported
CREATE TABLE dummy (id INTEGER PRIMARY KEY AUTOINCREMENT);
DROP TABLE dummy;

DELETE FROM sqlite_sequence WHERE EXISTS (
     SELECT 1 FROM sqlite_master WHERE type='table' AND name='sqlite_sequence');   

DROP TABLE IF EXISTS "precincts";
DROP TABLE IF EXISTS "voters";
DROP TABLE IF EXISTS "elections";
DROP TABLE IF EXISTS "voter_elections";


-- Begin the Table Setup
CREATE TABLE IF NOT EXISTS "precincts" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"code"	TEXT NOT NULL UNIQUE,
	"address"	TEXT,
	"maxVoters"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "voters" (
	"id"	INTEGER,
	"firstName"	TEXT NOT NULL,
	"lastName"	TEXT NOT NULL,
	"dob"	TEXT NOT NULL CHECK(dob IS date(dob)),  --format yyyy-mm-dd
	"status"	TEXT NOT NULL CHECK("status" IN ('Active', 'Deactivated')),  -- Active  or  Deactivated
	"precinctId"	INTEGER,
	FOREIGN KEY("precinctId") REFERENCES "precincts"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "elections" (
	"id"	INTEGER,
	"title"	TEXT NOT NULL,
	"startDate"	TEXT NOT NULL,
	"endDate"	TEXT NOT NULL,
	"status"	TEXT NOT NULL CHECK(status IN ('Draft', 'Scheduled','Closed')),  ---- Draft,  Scheduled,  Closed'
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "voter_elections" (
	"id"	INTEGER,
	"voterId"	INTEGER NOT NULL,
	"electionId"	INTEGER NOT NULL,
	"isEligable"	INTEGER NOT NULL DEFAULT 0,
	"hasVoted"	INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY("electionId") REFERENCES "elections"("id"),
	FOREIGN KEY("voterId") REFERENCES "voters"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
