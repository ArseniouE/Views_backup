USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_c_category]    Script Date: 25/10/2023 1:55:48 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view  [dbo].[dms_c_category] as
 select  distinct 
    c.afm as Afm,
 	c.Id,
	c.EntityId,
	c.ModelId,
	NULL as RmodelVersion,
	c.ModelGrade as Grade,
	c.FinalScore as Score,
	c.ModelPd as Pd,
	c.ActivityOfBusiness ,	
	c.BuildingCondition,	
	c.CompetitionLevel,	
	c.CustomerProgress,	
	c.Distribution,	
	c.Exports, 
	c.FinancialStatementsAreAudited,	
	c.GeographicalCoverage,
	c.InabilityToPayInter,
	c.IndicativeRatingWithTempData,	
	c.Management,	
	c.ManagerAbility,	
	c.MarketingLevel,	
	c.NumberOfProducts,	
	c.OperatingYears,	
	--c.OrganisationChart,	
	c.OwnershipDeliq,
	c.Production,	
	c.ProductsAndServices,	
	c.SectorProgress,	
	c.SuccesionStatus,	
	c.TechnologyLevel,
	Miss,
	OrganizationChart,
    MachineryEquipmentAge,
    CoopYearsAlpha,
	WillinglessToDiscloseInform,
	--c.DelinquenciesRatio,
	--c.PastDuesToFinancing,
	--αριθμοδείκτες  that must be added so the duplication will work in cl--
	'0' as Sales,
	'0' as QuickRatio,
	'0' as DebtToSales,
	'0' as EbtdaToDebt,
	'0' as Receivables,
	'0' as SalesGrowth,
	'0' as CurrentRatio,
	'0' as DebtToEbitda,
	'0' as EbtdaToSales,
	'0' as InventoryDays,
	'0' as SalesToAssets,
	'0' as WorkingCapital,
	'0' as FreeFlowsToSales,
	'0' as InterestCoverage,
	'0' as DebtCoverageRatio,
	'0' as GrossProfitMargin,
	'0' as ReceivablesToSales,
	'0' as AccountsPayableDays,
	'0' as NetMarginToReserves,
	'0' as PastDuesToFinancing,
	'0' as WorkingCapitalToSales,
	'0' as AccountReceivablesDays,
	'0' as NetMarginToTotalAssets,
	'0' as CashToCurrentLiabilities,
	'0' as TotalLiabilitiesToNetWorth
from abrs_c_categ_ratings c 
where is_latestrating = 'Y'
AND C.entityid = '124209'
GO


