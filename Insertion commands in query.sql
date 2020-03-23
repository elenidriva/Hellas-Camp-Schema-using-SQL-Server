-- Inserting data into Staff table
INSERT INTO project2.dbo.Staff(staffNo, staffName, staffSurname)SELECT DISTINCT staffNo, staffName, staffSurname FROM project2.dbo.MainTable; -- RICHTIG
--Select * from project2.dbo.Staff

--Inserting data into Payment table
INSERT INTO project2.dbo.Payment(payCode, payMethod)SELECT DISTINCT payCode, payMethod FROM project2.dbo.MainTable;
--Select * from project2.dbo.Payment

--Inserting data into Customer table
INSERT INTO project2.dbo.Customer(custCode, custName, custSurname, custPhone)SELECT DISTINCT custCode, custName, custSurname, custPhone FROM project2.dbo.MainTable;
--Select * from project2.dbo.Customer
--Select distinct custCode, custName, custSurname, custPhone from  project2.dbo.MainTable

--Inserting data into Booking table
INSERT INTO project2.dbo.Booking(bookCode, bookDt, payCode, custCode, staffNo)SELECT DISTINCT bookCode, bookDt, payCode, custCode, staffNo FROM project2.dbo.MainTable;
--Select * from project2.dbo.Booking
--Select * from project2.dbo.MainTable

--Inserting data into Camping table
INSERT INTO project2.dbo.Camping(campCode, campName, numOfEmp)SELECT DISTINCT campCode, campName, numOfEmp FROM project2.dbo.MainTable;
--Select * from project2.dbo.Camping

--Inserting data into Category table
INSERT INTO project2.dbo.Category(catCode, areaM2, unitCost)SELECT DISTINCT catCode, areaM2, unitCost FROM project2.dbo.MainTable;
--Select * from project2.dbo.Category

--Inserting data into Emplacement table
INSERT INTO project2.dbo.Emplacement(campCode, empNo, catCode)SELECT DISTINCT campCode, empNo, catCode FROM project2.dbo.MainTable;
--Select * from project2.dbo.Emplacement

--Inserting data into Rental table
INSERT INTO project2.dbo.Rental(bookCode, campCode, empNo, startDt, endDt, noPers)SELECT DISTINCT bookCode, campCode, empNo, startDt, endDt, noPers FROM project2.dbo.MainTable;
--Select * from project2.dbo.Rental



/* In the following section there are other ways to implement the insertion. Of course, in some cases using INNER JOIN - LEFT JOIN is more effective than using "SELECT DISTINCT".
	The same works vice versa and about other commands like "WHERE NOT EXISTS", "WHERE ... NOT IN (SELECT...) " etc.

Select * from project2.dbo.MainTable
INSERT INTO  project2.dbo.Staff(staffNo, staffName, staffSurname)
SELECT staffNo, staffName,staffSurname
FROM
     project2.dbo.MainTable
WHERE NOT EXISTS (SELECT  project2.dbo.Staff.staffNo FROM  project2.dbo.Staff WHERE  project2.dbo.Staff.staffNo =  project2.dbo.MainTable.staffNo);



INSERT INTO  project2.dbo.Staff(staffNo, staffName, staffSurname)
SELECT staffNo, staffName,staffSurname
FROM
     project2.dbo.MainTable
WHERE project2.dbo.MainTable.staffNo NOT IN (SELECT staffNo
                       FROM project2.dbo.Staff)


SELECT s.staffNo, s.staffName, s.staffSurname, d.staffNo, d.staffName, d.staffSurname
FROM project2.dbo.MainTable AS d
INNER JOIN project2.dbo.Staff AS s
ON s.StaffNo = d.StaffNo
WHERE d.StaffNo IS NULL

INSERT INTO project2.dbo.Staff(staffNo, staffName, staffSurname)
SELECT staffNo, staffName,staffSurname
FROM project2.dbo.MainTable AS b
WHERE NOT EXISTS (SELECT NULL FROM b WHERE project2.dbo.Staff.staffNo=b.staffNo AND project2.dbo.Staff.staffName=b.staffName AND project2.dbo.Staff.staffSurname=b.staffSurname);


*/