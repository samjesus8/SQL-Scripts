#Working

SELECT p."ProjectID", p."Name", s2."Name", p."Status" 
FROM bohemia.studio s
left join bohemia.studioinformation s2 on s."StudioInformationID" = s2."StudioInformationID"
left join bohemia.studioassignment s3 on s."StudioID" = s3."StudioID"
left join bohemia.project p on s3."ProjectID" = p."ProjectID"
WHERE s."StudioID"  = '1';
