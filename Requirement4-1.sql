# Working

SELECT e."UserName", e."FirstName", e."Lastname", e."Email", c."StartDate" 
FROM employeeinformation e
left join employee e2 on e2."EmployeeInfoID" = e."EmployeeInformationID"
left join contract c on c."ContractID" = e2."EmployeeID"
where c."StartDate" > '01/08/22'
order by (c."StartDate") desc;