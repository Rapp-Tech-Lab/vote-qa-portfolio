# County ACME Election Management Portal Requirements

## Business Context
**Note:** This is a QA Portfolio project featuring a minimalist 
application that simulates a small county election administration portal 
used by election staff to manage voters, precincts, elections, and 
summary reporting. The goal is to support correct, traceable handling 
of election-related records in a regulated environment where data 
accuracy and access control matter.

The portal includes four pages:
- Voter List
- Precinct List
- Election List
- Report Page

## Roles
- **Clerk**: Full access to create, edit, and deactivate records, and 
to view reports.

- **View-Only Auditor**: Read-only access to all pages and reports. The 
auditor can review data but cannot create, edit, deactivate, or delete 
records.

## Testable Requirements
### Voter List
**REQ-V1:** Requirement V1

### Precinct List
**REQ-P1:** Requirement P1

### Election List
**REQ-E1:** Requirement E1

### Report Page
**REQ-R1:** Requirement R1

## Assumptions
- The app is a training portfolio project and uses fake data only.
- Dates are evaluated using the election date selected in the app.
- “Active” and “Deactivated” are the only voter status values.
- The first release focuses on correctness and traceability, 
not performance or security hardening.



