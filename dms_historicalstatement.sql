USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_historicalstatement]    Script Date: 25/10/2023 2:03:53 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_historicalstatement] as 
select distinct    	
	concat(a.id,StatementId) as [Id]
	,'' as [AuditMethod]
	,[CashFlowReconcileId]
	,'Unconsolidated' as [Consolidation]
	,[Duplicates]
	,a.id as FinancialId
	--,c.EntityId  as FinancialId
	,[FinTemplateId]
	,8 as [Flags]
	,[GrowthReconcileId]
	,2147483647 as [NeedsRecalc]
	,[Periods]
	,'' as [Restated]
	,StatementDate
	,[StatementId]
	,'Annual' as [StatementType]
	,'Reviewed' as [Status]
	,'FinancialAnalysis' as moduleId_
from dbo.Gift_Historical_AccountBalance c
join financials a on a.entityid = c.entityid
where a.entityid = '124209'
GO


