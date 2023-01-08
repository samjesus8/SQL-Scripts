# Working

SELECT s3."Name", p."Name", p."Description", p."Platform"  
FROM project p
left join studioassignment s ON s."ProjectID" = p."ProjectID"
left join studio s2 on s."StudioID" = s2."StudioID"
left join studioinformation s3 on s3."StudioInformationID" = s2."StudioInformationID" 
order by (p."Platform");