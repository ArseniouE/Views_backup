USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_PdModelRealEstateLondon]    Script Date: 25/10/2023 2:06:26 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create  view [dbo].[dms_PdModelRealEstateLondon] as

select  distinct [Id]
        ,b.pd as [Pd]
		,b.clgrade as Grade
		,b.pd as  Score
		,1 as Reason
		,a.[ModelId] as ModelId
		,a.remarks as Remarks
		,a.EntityId as EntityId
		,b.UpperBound as SpecialGrade
		,c.entityversionid_  as EntityVersionId
		,4 as OriginationOfEntity
FROM [ABRS_Staging].[dbo].abrs_lon_ratings a
left join [ABRS_Staging].[dbo].[FinalGradeLux_Lookup] b on a.FinalGrade collate  SQL_Latin1_General_CP1253_CI_AS  = b.ABRSGrade 
												      and a.LuxModelId collate  SQL_Latin1_General_CP1253_CI_AS = b.ModelId
left join [ABRS_Staging ].[dbo].[IMP_CL_Entity] c on a.entityid = c.entityid
where  NULLIF(a.EntityId, '') IS NOT NULL
and a.LuxModelid = 'PdModelRealEstateSlotting'
GO


