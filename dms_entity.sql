USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_entity]    Script Date: 25/10/2023 2:01:48 ЛЛ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




--drop view [dbo].[dms_entity]
create    view [dbo].[dms_entity]
as
select top 10000 
       (case          
            when BusinessPortfolio = '99' then '22'
            when BusinessPortfolio is null then '9999'
			else BusinessPortfolio
        end
       ) as BusinessPortfolio,
       BusinessType,
       CdiCode,
       (case
            when ConsolidatedBalanceSheet = 'No' then
                'ови'
            when ConsolidatedBalanceSheet = 'Yes' then
                'маи'
            else
                'ови'
        end
       ) as ConsolidatedBalanceSheet,
       'GRC' as CountryOfRisk,	   
	   case when CreditCommittee = 'DEFAULT' then '-' 
		    when CreditCommittee = 'NOT RATED' then '-'
			when CreditCommittee = 'New_Customer' then '-'
			when CreditCommittee = 'ABC FACTORS-тлгла аниок йимдумоу ожеикетым
' then 'ABC FACTORS-тлгла аниок йимдумоу ожеикетым'
            when CreditCommittee='ABC FACTORS-сулбоукио еяцасиым ии
' then 'ABC FACTORS-сулбоукио еяцасиым ии' 
            when CreditCommittee='ABC FACTORS-цемийг диеухумсг
' then 'ABC FACTORS-цемийг диеухумсг'
            when CreditCommittee='сулб. йахустея. киам. тяап. иии - упо том д/мтг
' then 'сулб. йахустея. киам. тяап. иии - упо том д/мтг'
            when CreditCommittee='сулб. йахустея. киам. тяап - сулбоукио и
' then 'сулб. йахустея. киам. тяап - сулбоукио и'
            when CreditCommittee='ABC FACTORS-сулбоукио еяцасиым и
' then 'ABC FACTORS-сулбоукио еяцасиым и'
	   else CreditCommittee end as CreditCommittee,	   
       CreditPortfolio,
        case when currency is null then '-' else currency end as Currency,
       cast([CustomerSince] as date) as [CustomerSince],
	   customercategory as CustomerCategory,  
       EntityId, /* ******* Comment when importing with No Entitiy ******* */
       EntityType,
       cast([DateOfIncorporation] as date) as EstablishmentDate,
       'PRV' as FirmType,
       (case
            when SubstantialDelay = 'No' then
                'ови'
            when SubstantialDelay = 'Yes' then
                'маи'
            else
                'ови'
        end
       ) as Gc115,
       (case
            when DeteriorationofCreditRisk = 'No' then
                'ови'
            when DeteriorationofCreditRisk = 'Yes' then
                'маи'
            else
                'ови'
        end
       ) as Gc116,
       Gc13,
       cast(Gc18 as numeric) as Gc18,
       'Migration_UniSystems09082023' as [Gc19],
       cast(getdate() as date) as Gc22,
       GroupId,
       '0' as [IdType],
       'NACE' as IndClassification,
       (case
            when [IndustryCode] =
            (
                select b.key_
                from [ABRS_Staging ].[dbo].[Nace_Industry_Lookup] b
                where a.[IndustryCode] = b.key_
            ) THEN
                [IndustryCode]
            ELSE
                '9999'
        end
       ) as [IndustryCode],
	   idnumber as IdNumberOds,
	   (case
            when [is_NPL] = '1' THEN
                'Yes'
            else
                'No'
        end
       ) as [IsNpl],

	   (case
            when is_wholesale = '1' THEN
                'Yes'
            else
                'No'
        end
       ) as IsWholesale,
       LegalEntity as LegalEntityType,
       LongName,
       0 as Marker,
	   'No' as NplChanged,
       (case
            when [Prospect] = 'YES' THEN
                'true'
            when [Prospect] = 'NO' THEN
                'false'
            else
                'false'
        end
       ) as [Prospect],
       'пЕКэТГР' as RelationShipType,
	   case when c.[Mapping name] is null then '-' else c.[Mapping name] end as ResponsibleOfficer,	   
       (case
            when [LimitsReviewType] = 'тайтийг амахеыягсг ояиым' then
                'тАЙТИЙч аМАХЕЧЯГСГ оЯъЫМ'
            when [LimitsReviewType] = 'емдиалесг амахеыягсг ояиым' then
                'еМДИэЛЕСГ аМАХЕЧЯГСГ оЯъЫМ'
            else
                'Not Rated'
        end
       ) as ReviewType,
	   [Alias] as ShortName,
	   arrear_unit as ArrearUnit,
	   monitoring_unit as MonitoringUnit,   
	   total_exposures_dwh as TotalExposuresDwh,
	   total_delays_ods as TotalDelaysOds,
	   total_balance_ods as TotalBalanceOds,
	   delays_over_balances_ratio_ods as DelaysOverBalancesRatioOdds ,
	   delaydaysods as DelayDaysOds,
	   on_balances_dwh as OnBalancesDwh,
	   off_balances_dwh as OffBalancesDwh ,
	   ODS_insert_date as  OdsInsertDate,
	   ODS_insert_date as OdsUpdateDate 
FROM [export_abrs_to_cl] a
left join [Responsible_Officer_Lookup] c on a.ResponsibleOfficer = c.[аЯИХЛЭР лГТЯЧОУ]

--where entityid in (100066,128884,143105,128881,145061, 195076,159953, 121961,143911, 
--                   123449, 143203, 128416, 148193, 142433, 153388,127837,220395,122216,
--				   196777,122265,153707,198831,147691,161053,122242,128956,189757)



GO


