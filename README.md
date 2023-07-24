# SQL-Cinema-DB

The purpose of the Cinema Database was to organize and store data containing information on guests buying specific tickets for a given screening, employees data, seat availability, and revenue.
The database consists of 17 tables.

The database provides access to information about:
- personal data of employees along with their schedule
- the type of tickets purchased for a given screening in a selected room for a specific movie, for a specific price stored in the price list
- personal data of customers

The code consists of:
- creating tables
- adding foreigh keys, constraints and checks
- functions such as:
  - check film availability
  - seat for screening
- views such as:
  - screenings for a given day
  - available seats
- procedures such as:
  - increase ticket prise for a given type of a ticket
  - create a login for an employee
- triggers such as:
  - if an insterted genre name already exists
  - free seats for a screening
- example data insertion
