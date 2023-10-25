USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_ebadefinition]    Script Date: 25/10/2023 2:01:37 ЛЛ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







create   view [dbo].[dms_ebadefinition]
as
select 
row_number() over (order by EntityId asc, CreationDate asc) as EbaId,
1 as EbaSaved,
case when SubstantialDelay = 'Yes' then 'маи' else 'ови' end as SubstantialDelay,
case when DeteriorationOfCreditRisk = 'Yes' then 'маи' else 'ови' end as DeteriorationOfCreditRisk,
[Active]
,[CdFinalValue]
,[CdInitialValue]
,[CdUser]
,[Comment]
,[CooperativeDebtor]
,[CreationDate]
,[DefDesignator]
,[EntityId]
,[FdFinalValue]
,[FdInitialValue]
,[FinancialDifficulty]
,[RatingId]
,[Reason]
,[User]
,[UtpFlag]
,[UtpId]
,[VdFinalValue]
,[VdInitialValue]
,[VdUser]
,[ViableDebtor]
,[FinancialDifficultyEdit]
,[ViableDebtorEdit]
,[CooperativeDebtorEdit]
,[IsNpl]
/*,[SubstantialDelay]*/
/*,[DeteriorationOfCreditRisk]*/
,[EntityVersionId]

from Eba
--where entityid in ('100333','100416')




GO


