USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_SummaryEsPolicy]    Script Date: 25/10/2023 2:09:19 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--drop view [dms_SummaryEsPolicy]
create view [dbo].[dms_SummaryEsPolicy] as
SELECT
	 NULL	AS SummaryEsPolicyId
	,EntityId	AS EntityId
	,EsPolicyId		AS EsPolicyId

FROM 
	[ABRS_Staging ].[dbo].[dms_espolicy]

WHERE
	Active = 'Active' 
  --  and EntityId in ('93333')





GO


