USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_SummaryLeverage]    Script Date: 25/10/2023 2:09:28 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











--drop view [dms_SummaryLeverage]
create view [dbo].[dms_SummaryLeverage] as
SELECT
	 NULL	AS SummaryLeverageId
	,EntityId	AS EntityId
	,LeverageId	AS LeverageId


FROM 
	[ABRS_Staging ].[dbo].[dms_leverage]

WHERE
	Active = 'Active' 
    --and EntityId in ('100004')








GO


