USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_entityrating1]    Script Date: 25/10/2023 2:02:49 ЛЛ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--drop view [dbo].[dms_entityrating]
create view  [dbo].[dms_entityrating1] as
 select
	EntityId as [Id]
	,NULL as [ApprovedGrade]
	,NULL as [ApprovedPd]
	,ApprovalStatus
	,ApproveId 
	,ApprovedDate
	,Approver
	,ConfigVersion
	,NULL as [CascadeGrade]
	,NULL as [CascadeNote]
	,NULL as [CascadePd]
	,NULL as [CascadeReason]
	,NULL as [CascadeType]
	,NULL as [CascadeUserId]
	,NULL as [Comments]
	,NULL as [DefaultComment]
	,NULL as [DefaultDate]
	,NULL as [DefaultGrade]
	,NULL as [DefaultPd]
	,NULL as [DefaultReason]
	,EntityId
	,FinalGrade
	,FinalScore
	,0 as [FinalPd]
	,NULL as FinancialEdfVersion
	,NULL as FinancialRiskCalcVersion
	,IsApproved
	,NULL as [IsDefault]
	,'false' as [IsOutOfDate]
	,NULL as [LatestApprovedRatingVersionId]
	,[Id] as [LatestApprovedScenarioId]
	,NULL as [MasterApprovedGrade]
	,0 as [MasterApprovedPd]
	,NULL as [MasterCascadeGrade]
	,0 as [MasterCascadePd]
	,NULL as [MasterFinalGrade]
	,0 as [MasterFinalPd]
	,NULL as MasterGrade
	,NULL as MasterOverrideGrade
	,0 as MasterOverridePd
	,0 as MasterPd
	,ModelGrade 
	,ModelId
	, ModelPd 	
	,0 as [MasterOverlayPd]
	,NULL as [MasterOverlayRating]
	,NULL as [MasterSourceGrade]
	,0 as [MasterSourcePd]
	,NULL as [OutOfDateReason]
	,0 as OverlayPd
	,NULL as OverlayRating
	,OverrideGrade
	,0 as OverridePd
	,NULL as [SourceEntityId]
	,NULL as [SourceEntityRatingVersionId]
	,NULL as [SourceGrade]
	,NULL as [SourceLongName]
	,0 as [SourcePd]
	,NULL as [TransientApprovedGrade]
	,NULL as [TransientApprovedPd]
	,NULL as [TransientGrade]
	,0 as [TransientPd]
FROM [dbo].[dms_RatingScenario]  
-- where Id in 
--		   (select top(1) CONVERT(uniqueidentifier, ('99000000-8790-0000-0000-' + RIGHT('0000000000000'+CAST(a.aa AS VARCHAR(12)),12))) Id
--			from [MISRISK].[dbo].[EXPORTED_CUSTOMERS_ALL_RATINGS] a 
--			where  a.afm =  [dbo].[dms_RatingScenario].afm
--			and a.res_proelefsi = 'диабахлисг лесы сдпй ц йатгцояиас v.2012'
--			order by a.aa desc)
--and NULLIF([EntityId], '') IS NOT NULL 

GO


