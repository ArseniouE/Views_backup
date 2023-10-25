USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_RatingProperty]    Script Date: 25/10/2023 2:07:58 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_RatingProperty] as 
SELECT  distinct
	'RatingScenario' as [embeddedin]
	,[Id] as [refid_]
	,'CONFIGVERSION' as [Name]
	,'5.303.3.0' as [Value]
  FROM [ABRS_Staging ].[dbo].[abrs_ns_ratings]
where NULLIF([EntityId], '') IS NOT NULL

GO


