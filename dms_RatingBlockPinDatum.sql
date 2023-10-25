USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_RatingBlockPinDatum]    Script Date: 25/10/2023 2:07:48 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_RatingBlockPinDatum] as
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'I.SelectedCategory' as [PinId]
    ,ABRS_Grade_EN collate Greek_CI_AS  as [Value]
    ,'NSRM.RATING_USER' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on [ABRS_Grade_GR]    = FINAL_BATHMOS collate  Greek_CI_AS 
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'I.SelectedCategory' as [PinId]
    ,descr_en collate Greek_CI_AS  as [Value]
    ,'NSRM.SEGMENT' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on [ABRS_Grade_GR]     = FINAL_BATHMOS collate Greek_CI_AS 
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'I.Text' as [PinId]
	,b.Comment
    --,'Migrated Qualitative Data' as [Value] 
    ,'NSRM.Comment' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]    = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'input' as [Name]
    ,'I.Score' as [PinId]
    ,NULL as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]    = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'score' as [Name]
    ,'I.Score' as [PinId]
    ,cast(b.FinalScore as varchar) as [Value] 
    --,'100' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'weight' as [Name]
    ,'I.Score' as [PinId]
    ,'1' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'worstscore' as [Name]
    ,'I.Score' as [PinId]
    ,'10' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'bestscore' as [Name]
    ,'I.Score' as [PinId]
    ,'100' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'O.OrigSysGrade' as [PinId]
    ,'10' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'numeric0' as [Name]
    ,'O.OrigSysPD' as [PinId]
    ,cast(c.PD as varchar) as [Value] 
    --,'0.12' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] c on c.[ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'O.SystemGrade' as [PinId]
    ,'12' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'numeric0' as [Name]
    ,'O.SystemPD' as [PinId]
    ,cast(c.PD as varchar) as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] c on  c.[ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'numeric0' as [Name]
    ,'O.FinalScore' as [PinId]
    ,cast(b.FinalScore as varchar) as [Value] 
    --,'100' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] c on c.[ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'mappedmean' as [Name]
    ,'O.ConstAssmtOut' as [PinId]
    ,'NaN' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'realmean' as [Name]
    ,'O.ConstAssmtOut' as [PinId]
    ,'0' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'realsd' as [Name]
    ,'O.ConstAssmtOut' as [PinId]
    ,'0' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'discretemean' as [Name]
    ,'O.ConstAssmtOut' as [PinId]
    ,'0' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'discretesd' as [Name]
    ,'O.ConstAssmtOut' as [PinId]
    ,'0' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'distribution' as [Name]
    ,'O.ConstAssmtOut' as [PinId]
    ,'0|0|0|0|0|0|0|' as [Value] 
    ,'NSRM.GradePDOverride' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'O.SelectedId' as [PinId]
    ,descr_en collate Greek_CI_AS  as [Value] 
    ,'NSRM.SEGMENT' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'O.SelectedText' as [PinId]
    ,descr collate Greek_CI_AS  as [Value] 
    ,'NSRM.SEGMENT' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'input' as [Name]
    ,'O.Score' as [PinId]
    ,ABRS_Grade_EN collate Greek_CI_AS as [Value] 
    ,'NSRM.RATING_USER' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'score' as [Name]
    ,'O.Score' as [PinId]
    ,cast(b.FinalScore as varchar) as [Value] 
    --,'100' as [Value] 
    ,'NSRM.RATING_USER' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'weight' as [Name]
    ,'O.Score' as [PinId]
    ,'1' as [Value] 
    ,'NSRM.RATING_USER' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'worstscore' as [Name]
    ,'O.Score' as [PinId]
    ,'10' as [Value] 
    ,'NSRM.RATING_USER' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'bestscore' as [Name]
    ,'O.Score' as [PinId]
    ,'100' as [Value] 
    ,'NSRM.RATING_USER' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'input' as [Name]
    ,'O.Score' as [PinId]
    ,NULL as [Value] 
    ,'NSRM.RATING' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'score' as [Name]
    ,'O.Score' as [PinId]
    ,cast(b.FinalScore as varchar) as [Value] 
    --,'100' as [Value] 
    ,'NSRM.RATING' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'weight' as [Name]
    ,'O.Score' as [PinId]
    ,'1' as [Value] 
    ,'NSRM.RATING' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'worstscore' as [Name]
    ,'O.Score' as [PinId]
    ,'10' as [Value] 
    ,'NSRM.RATING' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'bestscore' as [Name]
    ,'O.Score' as [PinId]
    ,'100' as [Value] 
    ,'NSRM.RATING' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR] collate Greek_CI_AS   = FINAL_BATHMOS collate Greek_CI_AS)
union
SELECT 
    'RatingScenarioBlockData' as [embeddedin]
    ,a.[Id] as [refid_]
    ,'text0' as [Name]
    ,'O.Text' as [PinId]
    ,b.comment as [Value] 
    ,'NSRM.Comment' as [BlockId]
FROM dms_RatingScenarioBlockData a
inner join [dbo].[abrs_ns_ratings] b on b.[Id] = a.[Id]
--left join [dbo].[FinalGrade_Lookup] on ([ABRS_Grade_GR]   = FINAL_BATHMOS collate Greek_CI_AS)

GO


