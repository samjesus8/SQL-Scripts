#not working / un tested

SELECT s."Name", count(s3."ProjectID") 
FROM bohemia.studioinformation s
left join bohemia.studio s2 on s."StudioInformationID" = s2."StudioInformationID"
left join bohemia.studioassignment s3 on s2."StudioID" = s3."StudioID"
group by (s."Name")

