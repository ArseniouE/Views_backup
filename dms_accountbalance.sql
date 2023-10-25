USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_accountbalance]    Script Date: 25/10/2023 1:38:28 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_accountbalance] as 
select distinct 
    --a.EntityId
    concat(b.id,StatementId)as [refid_]
	,[embeddedin]
	--,concat(a.EntityId,StatementId)as [refid_]
	--,concat(b.id,StatementId)as [refid_]
	,[Balance]
	,[AccountId]
	,'' as [AsciiFormula]
	,[EntryMethodId]
	,[OriginBalance]
	,[OriginRounding]
from dbo.Gift_Historical_AccountBalance a
join financials b on a.entityid = b.entityid
where AccountId <> '0' and Balance <> '0'
--and b.id = 30377
and a.entityid = '124209'


GO


