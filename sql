Welcome to the miniprojects wiki!
/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */

/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT *
FROM `Facilities`
WHERE `membercost` > 0
LIMIT 0 , 30

Squash Court = 3.5 (membercost) / 17.5 (guestcost)
Tennis Court 1 = 5.0 (membercost) / 25.0 (guestcost)
Tennis Court 2 = 5.0 (membercost) / 25.0 (guestcost)
Massage Room 1 = 9.9 (membercost) / 80.0 (guestcost)
Massage Room 2 = 9.9 (membercost) / 80.0 (guestcost)

/* Q2: How many facilities do not charge a fee to members? */

SELECT *
FROM `Facilities`
WHERE `membercost` =0
LIMIT 0 , 30

4

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid, name, membercost, monthlymaintenance FROM Facilities
WHERE membercost < monthlymaintenance * 0.2 and membercost != 0

Facid = 0 Squash Court = 3.5 (membercost) / 17.5 (monthlymaintenance)
Facid = 1 Tennis Court 1 = 5.0 (membercost) / 200 (monthlymaintenance)
Facid = 4 Tennis Court 2 = 5.0 (membercost) / 200 (monthlymaintenance)
Facid = 5 Massage Room 1 = 9.9 (membercost) / 3000 (monthlymaintenance)
Facid = 6 Massage Room 2 = 9.9 (membercost) / 3000 (monthlymaintenance)

/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT * FROM Facilities 
WHERE facid IN (1,5)


Facid = 1 Tennis Court 2 = 5.0 (membercost) / 25.0 (guestcost) / 8000 (initialoutlay) / 200 (monthlymaintenance)
Facid = 5 Massage Room 2 = 9.9 (membercost) / 80.0 (guestcost) / 4000 (initialoutlay) / 3000 (monthlymaintenance)

/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT name, monthlymaintenance, 
CASE WHEN monthlymaintenance > 100 THEN 'expensive'
     ELSE 'cheap' END AS label
FROM Facilities

 name 	monthlymaintenance 	label 	
Tennis Court 1 	200 	expensive
Tennis Court 2 	200 	expensive
Badminton Court 	50 	cheap
Table Tennis 	10 	cheap
Massage Room 1 	3000 	expensive
Massage Room 2 	3000 	expensive
Squash Court 	80 	cheap
Snooker Table 	15 	cheap
Pool Table 	15 	cheap

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

SELECT  firstname, surname, joindate FROM Members
ORDER BY joindate DESC

firstname 	surname 	joindate Descending 	
Darren 	Smith 	2012-09-26 18:08:45
Erica 	Crumpet 	2012-09-22 08:36:38
John 	Hunt 	2012-09-19 11:32:45
Hyacinth 	Tupperware 	2012-09-18 19:32:05
Millicent 	Purview 	2012-09-18 19:04:01
Henry 	Worthington-Smyth 	2012-09-17 12:27:15
David 	Farrell 	2012-09-15 08:22:05
Henrietta 	Rumney 	2012-09-05 08:42:35
Douglas 	Jones 	2012-09-02 18:43:05
Ramnaresh 	Sarwin 	2012-09-01 08:44:42
Joan 	Coplin 	2012-08-29 08:32:41
Anna 	Mackenzie 	2012-08-26 09:32:05
Matthew 	Genting 	2012-08-19 14:55:55
David 	Pinker 	2012-08-16 11:32:47
Timothy 	Baker 	2012-08-15 10:34:25
Florence 	Bader 	2012-08-10 17:52:03
Jack 	Smith 	2012-08-10 16:22:05
Jemima 	Farrell 	2012-08-10 14:28:01
Anne 	Baker 	2012-08-10 14:23:22
David 	Jones 	2012-08-06 16:32:55
Charles 	Owen 	2012-08-03 19:42:37
Ponder 	Stibbons 	2012-07-25 17:09:05
Tim 	Boothe 	2012-07-25 16:02:35
Nancy 	Dare 	2012-07-25 08:59:12
Burton 	Tracy 	2012-07-15 08:52:55
Gerald 	Butters 	2012-07-09 10:44:09
Janice 	Joplette 	2012-07-03 10:25:05
Tim 	Rownam 	2012-07-03 09:32:15
Tracy 	Smith 	2012-07-02 12:08:23
Darren 	Smith 	2012-07-02 12:02:05

/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT DISTINCT concat(firstname, ' ', surname) AS member_name, name FROM Bookings
JOIN Members
ON Bookings.memid = Members.memid
JOIN Facilities
ON Bookings.facid = Facilities.facid
WHERE name LIKE "Tennis Court%"
ORDER BY firstname 

 member_name 	name 	
Anne Baker 	Tennis Court 2
Anne Baker 	Tennis Court 1
Burton Tracy 	Tennis Court 2
Burton Tracy 	Tennis Court 1
Charles Owen 	Tennis Court 1
Charles Owen 	Tennis Court 2
Darren Smith 	Tennis Court 2
David Pinker 	Tennis Court 1
David Farrell 	Tennis Court 2
David Jones 	Tennis Court 1
David Jones 	Tennis Court 2
David Farrell 	Tennis Court 1
Douglas Jones 	Tennis Court 1
Erica Crumpet 	Tennis Court 1
Florence Bader 	Tennis Court 2
Florence Bader 	Tennis Court 1
Gerald Butters 	Tennis Court 2
Gerald Butters 	Tennis Court 1
GUEST GUEST 	Tennis Court 1
GUEST GUEST 	Tennis Court 2
Henrietta Rumney 	Tennis Court 2
Jack Smith 	Tennis Court 1
Jack Smith 	Tennis Court 2
Janice Joplette 	Tennis Court 1
Janice Joplette 	Tennis Court 2
Jemima Farrell 	Tennis Court 1
Jemima Farrell 	Tennis Court 2
Joan Coplin 	Tennis Court 1
John Hunt 	Tennis Court 2
John Hunt 	Tennis Court 1

/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT DISTINCT firstname, CASE WHEN firstname = 'GUEST' THEN guestcost ELSE membercost END AS cost,
name, concat(firstname, ' ', surname) AS member_name FROM Bookings
JOIN Members
ON Bookings.memid = Members.memid
JOIN Facilities
ON Bookings.facid = Facilities.facid
WHERE starttime LIKE "2012-09-14%"
ORDER BY cost DESC 

 firstname 	cost Descending 	name 	member_name 	
GUEST 	80.0 	Massage Room 1 	GUEST GUEST
GUEST 	80.0 	Massage Room 2 	GUEST GUEST
GUEST 	25.0 	Tennis Court 1 	GUEST GUEST
GUEST 	25.0 	Tennis Court 2 	GUEST GUEST
GUEST 	17.5 	Squash Court 	GUEST GUEST
Florence 	9.9 	Massage Room 2 	Florence Bader
Ponder 	9.9 	Massage Room 1 	Ponder Stibbons
Jack 	9.9 	Massage Room 1 	Jack Smith
Matthew 	9.9 	Massage Room 1 	Matthew Genting
Jemima 	9.9 	Massage Room 1 	Jemima Farrell
Burton 	9.9 	Massage Room 1 	Burton Tracy
Gerald 	5.0 	Tennis Court 1 	Gerald Butters
Tim 	5.0 	Tennis Court 2 	Tim Boothe
David 	5.0 	Tennis Court 1 	David Pinker
David 	5.0 	Tennis Court 2 	David Jones
Tim 	5.0 	Tennis Court 1 	Tim Rownam
Burton 	5.0 	Tennis Court 1 	Burton Tracy
Douglas 	5.0 	Tennis Court 1 	Douglas Jones
David 	3.5 	Squash Court 	David Pinker
Anne 	3.5 	Squash Court 	Anne Baker
Timothy 	3.5 	Squash Court 	Timothy Baker
Anna 	0.0 	Badminton Court 	Anna Mackenzie
Timothy 	0.0 	Pool Table 	Timothy Baker
David 	0.0 	Pool Table 	David Jones
Matthew 	0.0 	Table Tennis 	Matthew Genting
Ponder 	0.0 	Snooker Table 	Ponder Stibbons
Ramnaresh 	0.0 	Pool Table 	Ramnaresh Sarwin
Ponder 	0.0 	Badminton Court 	Ponder Stibbons
Anna 	0.0 	Pool Table 	Anna Mackenzie
Darren 	0.0 	Badminton Court 	Darren Smith

/* Q9: This time, produce the same result as in Q8, but using a subquery. */

SELECT firstname, CASE WHEN firstname = 'GUEST' THEN guestcost ELSE membercost END AS cost,
name, concat(firstname, ' ', surname) AS member_name FROM (
SELECT *
FROM Bookings
WHERE starttime LIKE "2012-09-14%"
) AS test
JOIN Members
ON test.memid = Members.memid
JOIN Facilities
ON test.facid = Facilities.facid
ORDER BY cost DESC

 firstname 	cost Descending 	name 	member_name 	
GUEST 	80.0 	Massage Room 2 	GUEST GUEST
GUEST 	80.0 	Massage Room 1 	GUEST GUEST
GUEST 	80.0 	Massage Room 1 	GUEST GUEST
GUEST 	80.0 	Massage Room 1 	GUEST GUEST
GUEST 	25.0 	Tennis Court 1 	GUEST GUEST
GUEST 	25.0 	Tennis Court 2 	GUEST GUEST
GUEST 	25.0 	Tennis Court 1 	GUEST GUEST
GUEST 	25.0 	Tennis Court 2 	GUEST GUEST
GUEST 	17.5 	Squash Court 	GUEST GUEST
GUEST 	17.5 	Squash Court 	GUEST GUEST
GUEST 	17.5 	Squash Court 	GUEST GUEST
Ponder 	9.9 	Massage Room 1 	Ponder Stibbons
Jack 	9.9 	Massage Room 1 	Jack Smith
Matthew 	9.9 	Massage Room 1 	Matthew Genting
Jemima 	9.9 	Massage Room 1 	Jemima Farrell
Jemima 	9.9 	Massage Room 1 	Jemima Farrell
Burton 	9.9 	Massage Room 1 	Burton Tracy
Florence 	9.9 	Massage Room 2 	Florence Bader
David 	5.0 	Tennis Court 2 	David Jones
David 	5.0 	Tennis Court 1 	David Pinker
Tim 	5.0 	Tennis Court 1 	Tim Rownam
Burton 	5.0 	Tennis Court 1 	Burton Tracy
Tim 	5.0 	Tennis Court 2 	Tim Boothe
Douglas 	5.0 	Tennis Court 1 	Douglas Jones
Gerald 	5.0 	Tennis Court 1 	Gerald Butters
Anne 	3.5 	Squash Court 	Anne Baker
Anne 	3.5 	Squash Court 	Anne Baker
David 	3.5 	Squash Court 	David Pinker
Timothy 	3.5 	Squash Court 	Timothy Baker
Ponder 	0.0 	Badminton Court 	Ponder Stibbons

/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT *
FROM (
SELECT name, SUM(CASE WHEN firstname = 'GUEST' THEN guestcost ELSE membercost END) AS cost
FROM Bookings     
JOIN Members
ON Bookings.memid = Members.memid
JOIN Facilities
ON Bookings.facid = Facilities.facid
Group By name
ORDER BY cost DESC
) AS test
Where cost < 1000

 name 	cost Descending
Badminton Court 	604.5
Pool Table 	265.0
Snooker Table 	115.0
Table Tennis 	90.0
