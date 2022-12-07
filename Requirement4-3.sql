#Not Working yet, cant test without test data.

SELECT p."ProjectID", p."Name", s."Name", p."Status" 
FROM bohemia.studioinformation s
left join bohemia.studio s2 on s."StudioInformationID" = s2."StudioInformationID"
left join bohemia.studioassignment s3 on s2."StudioID" = s3."StudioID"
left join bohemia.project p on s3."ProjectID" = p."ProjectID"
WHERE s."Name" = 'Fuzzy Sheep Studios';