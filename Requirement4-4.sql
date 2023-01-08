select e."UserName", e."Email"  from employeeinformation e 
inner join contract c on c."EmployeeID" = e."EmployeeInformationID" 
inner join employee e2 on e2."EmployeeID" = "EmployeeInformationID" 
inner join studioassignment s on s."ProjectID"  = e2."CurrentProjectID" 
where s."StudioID" = 1;