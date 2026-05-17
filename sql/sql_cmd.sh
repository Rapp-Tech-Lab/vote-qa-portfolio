#!/bin/bash

# Define the database file
DB="election_portal.db"
# Define the SQL Query
VERIFICATION_SQL="select e.id AS ElectionId, e.status AS E_status, p.id AS PrecinctId, v.id AS VoterId, v.status AS V_status, ve.isEligable, ve.hasVoted, ROUND((julianday(e.startDate) - julianday(v.dob)) / 365.25, 1) AS YearsBeforeE_start from voter_elections ve join elections e on ve.electionId = e.id join voters v on ve.voterid = v.id join precincts p on v.precinctId = p.id order by ElectionId, PrecinctId, VoterId;"

clear
echo "SQL Command Options:"
echo "1. Enter SQLite shell"
echo "2. Run seed data visualization script"
read -p "Enter choice (1 or 2): " choice

case $choice in
    1)
        # Launch SQLite shell with the database and set output mode
        echo
        echo "Entering SQLite shell for $DB."
        sqlite3 -header -column "$DB"
        ;;
    2)
        # Run the verification script with the specified output format
        echo
        echo "Running verification script"
        sqlite3 -header -column "$DB" "$VERIFICATION_SQL"
        ;;
    *)
        echo
        echo "Invalid choice. Please run the script again and enter 1 or 2."
        exit 1
        ;;
esac
