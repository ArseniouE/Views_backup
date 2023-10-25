USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_gift]    Script Date: 25/10/2023 2:03:41 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_gift] as 
select distinct 
     b.id  as Id
	--isnull(b.id,a.EntityId) as [Id]
	,null as [AllowCombinedStmt]
	,[BatchType]
	,[DisplayRounding]	
	,a.EntityId
	,[FinancialTemplate]
	,[Gc4]
	,[Gc7]
	,[Gc8]
	,[HiddenAccounts]
	,[HiddenClasses]
	,[Primary]
	,[ReportRounding]
	,[RmaSubmissionDate]
	,[ShowAccountsWithValue]
	,[SubType]
	,[GiftTc6]
	,case when [GiftTc7] = 'Ετερρόρυθμη εταιρία' then 'Ετερόρρυθμη Εταιρία'
	      else [GiftTc7] end as [GiftTc7]
	,[GiftTc8]
	,[GiftTc11]
	,'FinancialAnalysis' as moduleId_
from dbo.Gift_Historical_AccountBalance a
left join financials b on a.EntityId = b.entityid
where a.entityid = '124209'


GO


