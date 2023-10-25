USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_RatingScenario]    Script Date: 25/10/2023 2:08:24 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view  [dbo].[dms_RatingScenario] as
SELECT distinct a.Id
      ,[AmUser]
      ,[ApprovalStatus]
      ,[ApproveId]
	  ,c.PrevRatingId
      ,CONVERT(datetime,a.ApprovedDate AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC')AS ApprovedDate
      ,[Approver]
      ,[ConfigVersion]
      ,CONVERT(datetime,[Creditcommitteedate] AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC') AS [Creditcommitteedate]
	  ,CONVERT(datetime,[ExpirationDate] AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC') AS [ExpirationDate]
      ,a.EntityId 
      ,b.clgrade as  [FinalGrade]
      ,b.pd as [FinalScore] 
      ,[FinancialContext]
      ,[FinancialEdfVersion]
      ,[FinancialRiskCalcVersion]
      ,[IsApproved]
      ,[IsLatestApprovedScenario] 
      ,[IsPrimary]
      ,[LatestStatementId]
      ,[MasterGrade]
      ,[MasterOverrideGrade]
      ,[MasterOverridePd]
      ,[MasterPd]
      ,b.clgrade as [ModelGrade]
      ,a.[ModelId]
      ,[ModelInputsChanged]
      ,b.pd as  [ModelPd] 
      ,[ModelVersion]
      ,[Name]
      ,CONVERT(datetime,[NextReviewDate] AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC') AS [NextReviewDate]
	  ,CONVERT(datetime,[ExtendedReviewDate] AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC') AS [ExtendedReviewDate]
      ,[OverlayPd]  
      ,[OverlayRating]
      ,[OverrideGrade]
      ,[OverridePd]
      ,[ProjectionId]
      ,[ProposedRating]
      ,[RatingStatus]
      ,[RiskCalcInfoVersion]
      ,[ScenarioTypeRef]
      ,[SelectedFinancialId] 
      ,[StatementCount]
      ,[UsedFinancial] 
FROM [ABRS_Staging].[dbo].abrs_lux_ratings a
left join [ABRS_Staging].[dbo].[FinalGradeLux_Lookup] b on a.FinalGrade collate  SQL_Latin1_General_CP1253_CI_AS  = b.ABRSGrade 
												      and a.ModelId collate  SQL_Latin1_General_CP1253_CI_AS = b.ModelId
JOIN [ABRS_Staging].[dbo].[AllRatingsToCl] c on a.Id = c.Id 
where  NULLIF(a.entityId, '') IS NOT NULL

GO


