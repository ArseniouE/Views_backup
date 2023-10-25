USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_RatingScenarioBlockData]    Script Date: 25/10/2023 2:08:34 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view  [dbo].[dms_RatingScenarioBlockData] as 
SELECT  
	[Id]
	,[Id] as [RatingScenarioId]
FROM dms_RatingScenario
GO


