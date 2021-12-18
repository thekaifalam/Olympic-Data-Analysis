/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ID] AS 'Competitor ID'
      ,[Name] AS 'Competitor Name'
      , CASE 
	    WHEN [Sex] = 'M' THEN 'Male'
		WHEN [Sex] = 'F' THEN 'Female'
	    END AS 'Competitor Sex'
      , CASE 
	    WHEN [Age] < 18 THEN 'Under 18'
		WHEN [Age] > 18 AND [Age] < 25 THEN '18-25'
		WHEN [Age] > 30 THEN 'Over 30'
		END AS 'Age Group'
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Country Code'
	  ,[Games]
      , PARSENAME(REPLACE([Games] , ' ' , '.') , 1) AS 'Season'
	  , PARSENAME(REPLACE([Games] , ' ' , '.') , 2) As 'Year'
      ,[City]
      ,[Sport]
      ,[Event]
      ,CASE
	   WHEN [Medal] = 'NA' THEN 'Not Registered'
	   ELSE [Medal]
	   END AS 'Medal'
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE PARSENAME(REPLACE([Games] , ' ' , '.') , 1) = 'Summer'
 