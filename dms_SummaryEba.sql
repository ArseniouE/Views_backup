USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_SummaryEba]    Script Date: 25/10/2023 2:09:08 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--drop view [dms_SummaryEsPolicy]
create view [dbo].[dms_SummaryEba] as
SELECT
	 NULL	AS SummaryEbaId
	,EntityId	AS EntityId
	,EbaId		AS EbaId

FROM 
	[ABRS_Staging ].[dbo].[dms_ebadefinition]

WHERE
	Active = 'true' 
    --and EntityId in ('100333','100416')




GO


