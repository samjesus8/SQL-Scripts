CREATE SCHEMA Bohemia;

CREATE TABLE if not exists Region
(
	"RegionID"	bigserial primary key,
	"City"	varchar	not null,
	"Country"	varchar not null
);

CREATE TABLE if not exists Platform
(
	"PlatformID"	bigserial primary key,
	"Platform"	varchar	not null
);

CREATE TABLE if not exists StudioInformation
(
	"StudioInformationID"	bigserial primary key,
	"Name"	varchar(255)	not null,
	"Description"	varchar	not null,
	"Head_Of_Studio_Name"	varchar	not null,
	"Date_Acquired"	date
);

CREATE TABLE if not exists Studio
(
	"StudioID"	bigserial primary key,
	"StudioInformationID"	bigint	constraint Studio_StudioInformtion_StudioInformationID_FK references Bohemia.StudioInformation,
	"PlatformID"	bigint	constraint Studio_Platform_PlatformID_FK references Bohemia.Platform
);

CREATE TABLE if not exists Project
(
	"ProjectID"		bigserial primary key,
	"StudioID"	bigint constraint Project_Studio_StudioID_FK references Bohemia.Studio,
	"PlatformID" bigint constraint Project_Platform_PlatformID_FK references Bohemia.Platform,
	"Name"	varchar	not null,
	"Description"  varchar not null,
	"Genre" varchar	not null,
	"Status" varchar not null
);

CREATE TABLE if not exists StudioAssignment
(
	"StudioAssignmentID"	bigserial primary key,
	"StudioID"	bigint constraint StudioAssignment_Studio_StudioID_FK references Bohemia.Studio,
	"ProjectID"	bigint constraint StudioAssignment_Project_ProjectID_FK references Bohemia.Project
);

CREATE TABLE if not exists EmployeeInformation
(
	"EmployeeInformationID"	bigserial primary key,
	"RegionID" bigint constraint EmployeeInformation_Region_RegionID_FK references Bohemia.Region,
	"FirstName" varchar(255) not null,
	"Lastname" varchar(255) not null,
	"UserName" varchar(255) not null,
	"Email" varchar not null check("Email" like '%@%'),
	"ContactNumber" varchar(10) not null,
	"Postcode" varchar not null,
	"AddressLine1" varchar not null
);

CREATE TABLE if not exists Employee
(
	"EmployeeID"	bigserial primary key,
	"EmployeeInfoID"	bigint constraint Employee_EmployeeInfomation_EmployeeInfoID_FK references Bohemia.EmployeeInformation,
	"StudioID" bigint constraint Employee_Studio_StudioID_FK references Bohemia.Studio,
	"ProjectID" bigint constraint Employee_Project_ProjectID_FK references Bohemia.Project,
	"DateOfEmployment"	date not null,
	"Status" varchar not null,
	"TerminationDate" date check(TerminationDate > DateOfEmployment),
	"Title" varchar not null
);

CREATE TABLE if not exists Contract
(
	"ContractID" bigserial primary key,
	"StudioID" bigint constraint Contract_Studio_StudioID_FK references Bohemia.Studio,
	"EmployeeID" bigint constraint Contract_Employee_EmployeeID_FK references Bohemia.Employee,
	"ContractType" varchar not null,
	"StartDate" date not null,
	"EndDate" date check(EndDate > StartDate),
	"Duration" varchar not null,
	"Salary" bigint not null,
	"CurrentStudioID" bigint constraint Contract_Studio_CurrentStudioID_FK references Bohemia.Studio
);