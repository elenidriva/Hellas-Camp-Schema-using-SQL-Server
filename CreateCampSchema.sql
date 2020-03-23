
CREATE TABLE Staff
 (
	staffNo int primary key,
	staffName varchar(30) NOT NULL,
	staffSurname varchar(30) NOT NULL
); 

CREATE TABLE Payment
(
	payCode int primary key,
	payMethod varchar (20) NOT NULL 
	          constraint ck_pm check (payMethod='CC' OR payMethod='CH'
			                          OR payMethod='CA')
); 

CREATE TABLE Customer
(
	custCode int primary key,
	custName varchar(30) NOT NULL,
	custSurname varchar(30) NOT NULL,
	custPhone varchar(20) NOT NULL
); 

CREATE TABLE Booking
  (
	bookCode int primary key,
	bookDt date NOT NULL,
	payCode int NOT NULL,
	custCode int NOT NULL,
	staffNo int NOT NULL,
	
	Foreign Key (payCode) references payment(payCode),
	Foreign Key (custCode) references Customer(custCode),
	Foreign Key (staffNo) references Staff(staffNo)
); 

CREATE TABLE Camping(
	campCode char(3) primary key,
	campName varchar(50) NOT NULL,
	numOfEmp int NOT NULL
); 

CREATE TABLE Category
(
	catCode char(1) primary key,
	areaM2 int NOT NULL,
	unitCost numeric(4,2)not NULL
);

CREATE TABLE Emplacement
(
	campCode char(3) NOT NULL,
	empNo int NOT NULL,
	catCode char(1) NOT NULL,
	Primary Key (campCode,empNo),
	Foreign Key (campCode) references Camping (campCode),
	Foreign Key (catCode) references Category (catCode)
);

CREATE TABLE Rental(
	bookCode int NOT NULL,
	campCode char(3) NOT NULL,
	empNo int NOT NULL,
	startDt date NOT NULL,
	endDt date NOT NULL,
	noPers int NOT NULL,
	
	Primary Key (bookCode,campCode,empNo,startDt),
	Foreign Key (bookCode) references Booking (bookCode),
	Foreign Key (campCode,empNo) references Emplacement (campCode,empNo)
);

CREATE TABLE MainTable(
	bookCode int NULL,
	bookDt date NULL,
	payCode int NULL,
	payMethod char(2) NULL,
	custCode int NULL,
	custName varchar(30) NULL,
	custSurname varchar (30) NULL,
	custPhone varchar (20) NULL,
	staffNo int NULL,
	staffName varchar (30) NULL,
	staffSurname varchar (30) NULL,
	totalCost numeric(19, 2) NULL,
	campCode char(3) NULL,
	campName varchar (50) NULL,
	numOfEmp int NULL,
	empNo int NULL,
	catCode char (1) NULL,
	areaM2 int NULL,
	unitCost numeric(4,2) NULL,
	startDt date NULL,
	endDt date NULL,
	noPers int NULL,
	costPerRental numeric(19, 2) NULL
); 