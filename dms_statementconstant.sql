USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_statementconstant]    Script Date: 25/10/2023 2:08:58 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_statementconstant] as
  SELECT  distinct 
      [embeddedin]
      ,concat(b.id,StatementId) as [refid_]
      ,'1' [Id]
      ,'Unqualif''d' as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
  union
  SELECT  distinct [embeddedin]  
      ,concat(b.id,StatementId) as [refid_]
      ,'2' [Id]
	  ,'ABRS' as [Value]
      --,(case when NULLIF(alpha_user_modified, '') IS NOT NULL then alpha_user_modified else 'ICAP' end) as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
  union
  SELECT  distinct [embeddedin]	 
       ,concat(b.id,StatementId) as [refid_]
      ,'3' [Id]
      ,(case when NULLIF(alpha_user_modified, '') IS NOT NULL then alpha_user_modified else 'ICAP' end) as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
  union
  SELECT  distinct [embeddedin]    
       ,concat(b.id,StatementId) as [refid_]
      ,'4' [Id]
      ,'Annual' as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
    union
  SELECT  distinct [embeddedin]      
       ,concat(b.id,StatementId) as [refid_]
      ,'5' [Id]
      ,'''''' as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
      union
  SELECT  distinct [embeddedin] 
       ,concat(b.id,StatementId) as [refid_]
      ,'6' [Id]
      ,'Reviewed' as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
      union
  SELECT  distinct [embeddedin]
       ,concat(b.id,StatementId) as [refid_]
      ,'7' [Id]
      ,'Unconsolidated' as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
      union
  SELECT  distinct [embeddedin] 
       ,concat(b.id,StatementId) as [refid_]
      ,'8' [Id]
      ,'EUR' as [Value]
   FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'
	  union
  SELECT  distinct [embeddedin] 
    ,concat(b.id,StatementId) as [refid_]
      ,'9' [Id]
      ,'''''' as [Value]
  FROM  dbo.Gift_Historical_AccountBalance a 
  join financials b on a.entityid = b.entityid
  where a.entityid = '124209'

GO


