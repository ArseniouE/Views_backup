USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_entityindustry]    Script Date: 25/10/2023 2:02:24 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE   VIEW  [dbo].[dms_entityindustry] AS
SELECT 
	 a.EntityId as [EntityId],
	case when IndustryCode is null then '9999' else IndustryCode end AS [IndustryCode.Code] ,
	 'NACE' AS [IndClassification],
	 'NACE' AS Classification,
	 NULL AS [Inactive],
	 'true' as 'IsPrimary',
	'1' AS [Percentage]
FROM [ABRS_Staging ].[dbo].[export_abrs_to_cl] a
where entityid not in ( select entityid from ExistingIndustryCodes)
     and entityid = 142894


GO


