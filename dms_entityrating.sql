USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_entityrating]    Script Date: 25/10/2023 2:02:38 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view  [dbo].[dms_entityrating] as (
select 
       cast(Id as int) as Id
	  ,CONVERT(datetime,ExpDate AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC') AS ExpDate
      --,ExpDate 
      ,ApprovalStatus
      ,cast(ApproveId as varchar(100)) as ApproveId
      ,CONVERT(datetime,ApprovedDate AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC')AS ApprovedDate
	  --,ApprovedDate
	  ,CONVERT(datetime,CreditCommDate AT TIME ZONE 'GTB STANDARD TIME' AT TIME ZONE 'UTC') AS CreditCommDate
      --,CreditCommDate
      ,Approver collate Greek_CI_AS as Approver
      ,ConfigVersion collate Greek_CI_AS as ConfigVersion
      ,cast(Id as int) as EntityId
      ,FinalGrade collate Greek_CI_AS as FinalGrade
      ,FinalScore
      ,IsApproved
      ,IsDefault
      ,IsOutOfDate
      ,cast(LatestApprovedScenarioId as varchar(100)) as LatestApprovedScenarioId
      ,ModelGrade collate Greek_CI_AS as ModelGrade
      ,ModelPd
      ,FinalPd
      ,OverrideGrade as OverrideGrade
      ,cast(OverridePd as decimal(18,2)) as OverridePd
      --,cast(SourcePd as varchar) collate Greek_CI_AS as SourcePd
	  	,SourcePd
      ,cast(Comments as varchar) as  Comments
from dbo.latestapprovedade2migr

)
GO


