# County ACME Election Management Portal Requirements

## Business Context
**Note:** This is a QA Portfolio project featuring a minimalist 
application that simulates a small county election administration portal 
used by election staff to manage voters, precincts, elections, and 
summary reporting. The goal is to support correct, traceable handling 
of election-related records in a regulated environment where data 
accuracy and access control matter.

The portal includes four pages:
- **Voter List:** the source of truth for the individual voter record and 
precinct assignment
- **Precinct List:** the source of truth for precinct definitions and 
capacity 
- **Election List:** the source of truth for election dates, status, and 
eligibility totals
- **Report Page:** a read-only summary view for validation and oversight 

## Roles
- **Clerk**: Full access to create, edit, and deactivate records, and 
to view reports.

- **View-Only Auditor**: Read-only access to all pages and reports. The 
auditor can review data but cannot create, edit, deactivate, or delete 
records.

## Voter List Page Model
- **Fields shown:** voter ID, first name, last name, date of birth, 
status, precinct name/code, and last updated.
- **Purpose:** manage the individual voter record and show which precinct 
the voter belongs to.
- **Actions:** add voter, edit voter, deactivate voter.

### Voter List Testable Requirements
- **REQ-V1:** The Voter List must display all active and deactivated 
voters with a precinct assignment for each voter.
- **REQ-V2:** A Clerk must be able to add a new voter record with 
first name, last name, date of birth, status, and precinct assignment.
- **REQ-V3:** A voter must be assigned to exactly one precinct at a time.
- **REQ-V4:** A voter must be at least 18 years old on the selected 
election date to be eligible for active election assignment.
- **REQ-V5:** A Clerk must be able to deactivate a voter, and deactivated 
voters must be visually distinguishable in the list.
- **REQ-V6:** A View-Only Auditor must be able to view the voter list but 
must not be able to create, edit, or deactivate voters.

## Precinct List Page Model
- **Fields shown:** precinct ID, name, code, address, capacity, active 
voter count.
- **Purpose:** manage precinct definitions and track capacity.
- **Actions:** add precinct, edit precinct.

### Precinct Testable Requirements
- **REQ-P1:** The Precinct List must display each precinct with its code, 
name, address, and capacity limit.
- **REQ-P2:** A Clerk must be able to add and edit precinct records, 
including capacity values.
- **REQ-P3:** Precinct capacity must be a positive whole number.
- **REQ-P4:** The system must prevent a precinct from being assigned more 
active voters than its capacity allows.
- **REQ-P5:** A View-Only Auditor must be able to view precinct data but 
must not be able to modify precinct records.

## Election List Page Model
- **Fields shown:** election ID, title, start date, end date, status, 
eligible voter count.
- **Purpose:** manage election setup and date rules.
- **Actions:** add election, edit election.

### Election List Testable Requirements
- **REQ-E1:** The Election List must display each election with title, 
start date, end date, and status.
- **REQ-E2:** A Clerk must be able to create and edit elections.
- **REQ-E3:** An election end date must be on or after the start date.
- **REQ-E4:** An election must only be marked Scheduled when its date 
range is valid.
- **REQ-E5:** The system must prevent an inactive voter from being 
assigned as eligible for a new election.
- **REQ-E6:** A View-Only Auditor must be able to view election records 
but must not be able to create or edit elections.

## Reports Page Model
- **Fields shown:** voter count by precinct, inactive voter count, 
election eligibility totals, capacity exceptions.
- **Purpose:** summarize validation results and provide read-only 
oversight.
- **Actions:** filter reports by precinct or election.

### Reports Testable Requirements
- **REQ-R1:** The Report Page must display voter counts by precinct.
- **REQ-R2:** The Report Page must display election-related eligibility 
counts.
- **REQ-R3:** Report totals must match the underlying database records for 
the selected filters or date range.
- **REQ-R4:** The Report Page must show deactivated voters separately from 
active voters.
- **REQ-R5:** A View-Only Auditor must be able to access reports, but only 
as read-only data.

