USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_entitysummarymodel]    Script Date: 25/10/2023 2:03:04 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








--drop view [dms_entitysummarymodel]
create view [dbo].[dms_entitysummarymodel] as
SELECT
	 NULL	AS EntitySummaryId
	,EntityId	AS EntityId
	,UtpId		AS UtpId


FROM 
	[ABRS_Staging ].[dbo].[dms_utp]

WHERE
	Active = 'Active' 
    --and EntityId in ('100004')





GO


