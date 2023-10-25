USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_b_category]    Script Date: 25/10/2023 1:55:32 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create  view [dbo].[dms_b_category] as 
select
	[Id]
	,[AmountPastDue]
	,[Balance]
	,[BankDept]
	,BusinessOfActivity
--	,[CompanyName]
	,[CompetitionLevel]
	,[CooperationYears]
	,[CreditHistory]
	,[CustomerConcentration]
	,[DateInterimVatStmmnt1]
    ,DateInterimVatStmmnt2 
	,InterimVatStmmnt1      
	,InterimVatStmmnt2          
	,[Debt]
	,[DelinqDateFrom1]
	,[DelinqDateFrom2]
	,[DelinqDateFrom3]
	,[DelinqDateTo1]
	,[DelinqDateTo2]
	,[DelinqDateTo3] 
	,[EntityId]
	,[Exports]
	,[Grade]
	,[InabilityToPayInter]
	,[InvestmentInProgress]
	,[IrregularUsageCurrentAccounts]
	,IndicativeRatingWithTempData
	,[Job]
	,[ManagerAbility]
	,[ModelId]
	,case when [Months1] is null then 0 else months1 end as [Months1]
	,case when [Months2] is null then 0 else months1 end as [Months2]
	,case when [Months3] is null then 0 else months1 end as [Months3]
	,[NumberOfEmployees]
	,[OperatingYears]
	,[OtherRiskPoints]
	,[Pd]
	,[PersonalPropertyLending]
	,[ProblemWithInsuranseAwareness]
	,[ProblemWithTaxesAwareness]
	,[ProfitLoss1]
	,[ProfitLoss2]
	,[ProfitLoss3]
	,[RecentDamages]
	,[Sales1]
	,[Sales2]
	,[Sales3]
	,[Score]
	,[SeriousLiquitidyProblems]
	,[ShareHoldersCreditHistory]
	,[ShareholdersDeliquencies]
	,[SuccessorStatus]
	,[SuitabilityOfBuildingsAndEquip]
	,[Token]
	,[TotalDelinqYear1]
	,[TotalDelinqYear2]
	,[TotalDelinqYear3]
	,[WillingnessToDisclseInfo]
	,[Year1]
	,[Year2]
	,[Year3]
from abrs_b_categ_ratings a
--WHERE EntityId = 1182057
--where is_latestrating = 'Y'


GO


