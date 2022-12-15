CREATE SCHEMA if not exists Bohemia;

CREATE TABLE if not exists Bohemia.Region
(
	"RegionID"	bigserial primary key,
	"City"	varchar	not null,
	"Country"	varchar not null
);

CREATE TABLE if not exists Bohemia.StudioInformation
(
	"StudioInformationID"	bigserial primary key,
	"Name"	varchar(255)	not null,
	"Description"	varchar	not null,
	"Head_Of_Studio_Name"	varchar	not null,
	"Date_Acquired"	date,
	"Address" varchar not null,
	"ContactNumber" varchar(13) not null,
	"AlternativeNumber" varchar(13) not null,
	"Email" varchar not null check("Email" like '%@%')
);

CREATE TABLE if not exists Bohemia.Studio
(
	"StudioID"	bigserial primary key,
	"StudioInformationID"	bigint	constraint Studio_StudioInformtion_StudioInformationID_FK references Bohemia.StudioInformation,
	"Platform" varchar not null
);

CREATE TABLE if not exists Bohemia.Project
(
	"ProjectID"		bigserial primary key,
	"Platform" varchar not null,
	"Name"	varchar	not null,
	"Description"  varchar not null,
	"Genre" varchar	not null,
	"Status" varchar not null
);

CREATE TABLE if not exists Bohemia.StudioAssignment
(
	"StudioAssignmentID"	bigserial primary key,
	"StudioID"	bigint constraint StudioAssignment_Studio_StudioID_FK references Bohemia.Studio,
	"ProjectID"	bigint constraint StudioAssignment_Project_ProjectID_FK references Bohemia.Project
);

CREATE TABLE if not exists Bohemia.EmployeeInformation
(
	"EmployeeInformationID"	bigserial primary key,
	"RegionID" bigint constraint EmployeeInformation_Region_RegionID_FK references Bohemia.Region,
	"FirstName" varchar(255) not null,
	"Lastname" varchar(255) not null,
	"UserName" varchar(255) not null,
	"Email" varchar not null check("Email" like '%@%'),
	"ContactNumber" varchar(13) not null,
	"Postcode" varchar not null,
	"AddressLine1" varchar not null
);

CREATE TABLE if not exists Bohemia.Employee
(
	"EmployeeID"	bigserial primary key,
	"EmployeeInfoID"	bigint constraint Employee_EmployeeInfomation_EmployeeInfoID_FK references Bohemia.EmployeeInformation,
	"CurrentProjectID" bigint constraint Employee_Project_CurrentProjectID_FK references Bohemia.Project,
	"DateOfEmployment"	date not null,
	"Status" varchar not null,
	"TerminationDate" date check(Employee."TerminationDate" > Employee."DateOfEmployment"),
	"Title" varchar
);

CREATE TABLE if not exists Bohemia.Contract
(
	"ContractID" bigserial primary key,
	"StudioID" bigint constraint Contract_Studio_StudioID_FK references Bohemia.Studio,
	"EmployeeID" bigint constraint Contract_Employee_EmployeeID_FK references Bohemia.Employee,
	"ContractType" varchar not null,
	"StartDate" date not null,
	"EndDate" date check(Contract."EndDate" > Contract."StartDate"),
	"Duration" varchar not null,
	"Salary" bigint not null,
	"CurrentStudioID" bigint constraint Contract_Studio_CurrentStudioID_FK references Bohemia.Studio
);

CREATE TABLE if not exists Bohemia.PastProject
(
	"PastProjectID" bigserial primary key,
	"EmployeeID" bigint constraint PastProject_Employee_EmployeeID_FK references Bohemia.Employee,
	"ProjectID" bigint constraint PastProject_Project_ProjectID_FK references Bohemia.Project
);