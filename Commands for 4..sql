-- Query to check the insertion script

--a
  SELECT COUNT(bookCode), payMethod
FROM project2.dbo.Booking AS B, project2.dbo.Payment AS  P
WHERE B.payCode = P.payCode
GROUP BY payMethod;
/* Or like that --a
SELECT COUNT (DISTINCT bookCode) AS totalBookingsPerCategory
  FROM project2.dbo.Booking
  GROUP BY payCode
*/

--b
SELECT COUNT(*) as HighestTotalRentals, project2.dbo.Staff.staffName, project2.dbo.Staff.staffSurname
FROM project2.dbo.Booking
INNER JOIN project2.dbo.Staff
ON project2.dbo.Booking.staffNo = project2.dbo.Staff.staffNo
GROUP BY project2.dbo.Staff.staffName, project2.dbo.Staff.staffSurname
HAVING COUNT(*)=(SELECT MAX (y.c) AS m FROM (SELECT COUNT(*) AS c, B.staffNo
FROM project2.dbo.Booking AS B
GROUP BY B.staffNo)y);
/*
SELECT MAX (y.total) FROM (SELECT COUNT(bookCode) AS total, staffNo
FROM project2.dbo.Booking
GROUP BY staffNo)y;
*/
--c 
SELECT COUNT (*) AS totalBookingswithCatA
FROM project2.dbo.Booking
INNER JOIN project2.dbo.Rental
ON project2.dbo.Booking.bookCode = project2.dbo.Rental.bookCode
INNER JOIN project2.dbo.Emplacement
ON project2.dbo.Emplacement.campCode = project2.dbo.Rental.campCode
WHERE catCode ='A'
-- Of course there can be a more efficient way to do the above as well.
--c
SELECT COUNT (bookCode) as totalBookingswithCatA
from project2.dbo.MainTable
Where catCode ='A'


SET STATISTICS TIME  ON
--d
SELECT custSurname, custName, COUNT (*) AS totalBookingsIn2000
from project2.dbo.Customer 
INNER JOIN project2.dbo.Booking
ON project2.dbo.Booking.custCode = project2.dbo.Customer.custCode
Where bookDt BETWEEN '2000-01-01' AND '2000-12-31'
GROUP BY custSurname, custName
ORDER BY custSurname

SET STATISTICS TIME  OFF

/*			 For testing purposes
select count (distinct bookCode), custSurname, custName
from project2.dbo.mainTable
where bookDt between '2000-01-01'and '2001-01-01'
group by custSurname, custName 
order by custSurname
*/

--e
SET STATISTICS TIME  ON
--e
SELECT campName, SUM((DATEDIFF(day, startDt,  endDt)+1) * unitCost * noPers )AS totalCost		
from project2.dbo.Booking, project2.dbo.Camping, project2.dbo.Rental, project2.dbo.Emplacement, project2.dbo.Category
Where Booking.bookCode = Rental.bookCode AND Camping.campCode= Rental.campCode AND Emplacement.campCode=Camping.campCode AND Category.catCode=Emplacement.catCode
GROUP BY campName

SET STATISTICS TIME  OFF


