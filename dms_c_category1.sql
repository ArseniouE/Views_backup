USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_c_category1]    Script Date: 25/10/2023 1:56:13 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--drop view [dbo].[dms_c_category]
create view  [dbo].[dms_c_category1] as
 select  distinct 
    '99000000-8790-8790-0000-000000007740' as Id,
 	--d.Id,
	d.EntityId,
	d.ModelId,
	NULL as RmodelVersion,
 -- a.Score,
	d.ModelGrade as Grade,
--	d.ModelPd,
 	c.BusinessOfActivity as  ActivityOfBusiness,	
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
	c.OrganisationChart,	
	c.OwnershipDeliq,
	c.Production,	
	c.ProductsAndServices,	
	c.SectorProgress,	
	c.SuccesionStatus,	
	c.TechnologyLevel	
from abrs_c_categ_ratings c
inner join dms_entityrating d on d.ApproveId = c.Id


GO


