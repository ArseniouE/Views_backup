USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_entity1]    Script Date: 25/10/2023 2:02:01 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




--drop view [dbo].[dms_entity]
create view [dbo].[dms_entity1] as
	select  top(1)
	--'Unknown' as Bankruptcy
	(case when NULLIF(BusinessPortfolio, '') IS NOT NULL then BusinessPortfolio else '9999' end) as BusinessPortfolio
	,BusinessType
	,a.CdiCode
	,ConsolidatedBalanceSheet
	,'GRC' as CountryOfRisk
	,(case when [CreditCommittee] = (select [Key]
	from [ABRS_Staging ].[dbo].[Credit_Committee_Lookup] d
	where a.[CreditCommittee] = d.[Key] ) then [CreditCommittee] else 'Other' end) as CreditCommittee /* CREDIT COMMITTEE INTRAGROUP LOANS */
	,CreditPortfolio
	,Currency
	,cast([CustomerSince] as date) as [CustomerSince]
--	,a.EntityId /* place in Comment when importing with No Entitiy from ABRS */
	,EntityType
	,cast([DateOfIncorporation] as date) as EstablishmentDate
	,'PRV' as FirmType
	,[SubstantialDelay] as Gc115
	,[DeteriorationofCreditRisk] as Gc116
	,Gc13
	--,999999999 as Gc18
	,cast(Gc18 as numeric) as Gc18
	,'Migration_kleanthis1' as [Gc19]
	,Gc22
	,GroupId
	,'0' as [IdType] /* problematic with NULL set to zero */
	,IndClassification
	,(case
		when [IndustryCode] = (select b.key_
								from [ABRS_Staging ].[dbo].[Nace_Industry_Lookup] b
								where a.[IndustryCode] = b.key_ ) THEN [IndustryCode] ELSE NULL end) as [IndustryCode] -- OK
	,LegalEntity
	,LongName
	, (case
	when [Prospect] = 'YES' THEN 'true'
	when [Prospect] = 'NO' THEN 'false'
	else 'false'
	end) as [Prospect]
	,RelationShipType
	,(case when [ResponsibleOfficer] = (select [Mapping name]
	from [ABRS_Staging ].[dbo].[Responsible_Officer_Lookup] c
	where a.[ResponsibleOfficer] = c.[Mapping name] ) then [ResponsibleOfficer] else 'Migration_UniSystems6' end) as ResponsibleOfficer 
	,(case
	when [LimitsReviewType] = 'ΤΑΚΤΙΚΗ ΑΝΑΘΕΩΡΗΣΗ ΟΡΙΩΝ' then 'Τακτική Αναθεώρηση Ορίων'
	when [LimitsReviewType] = 'ΕΝΔΙΑΜΕΣΗ ΑΝΑΘΕΩΡΗΣΗ ΟΡΙΩΝ' then 'Ενδιάμεση Αναθεώρηση Ορίων'
	else NULL
	end) as ReviewType
	,[Alias] as ShortName
	,is_wholesale as Is_Wholesale
	,is_NPL as Is_Npl
	,1 as Marker
	,'Yes' as Nplchanged
FROM [ABRS_Staging ].[dbo].[export_abrs_to_cl] a
--left join [dbo].[CL_Entity_Initial_Migration] b on b.cdicode = a.CdiCode
where NULLIF(a.EntityId, '') IS not NULL


GO


