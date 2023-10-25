USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_coorectiveactionsentity_todelete]    Script Date: 25/10/2023 1:56:35 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--drop view [dms_coorectiveactionsentity]
create view [dbo].[dms_coorectiveactionsentity_todelete] as 
select  master_id as GroupId
	   ,entityid as EntityId	
	   ,date_created as CorrectiveDate	
	   ,user_id as UserCreatedLog
	   ,null as EntityVersionId
	   ,null as CorrectiveActionsId
	   ,case when ok_status = 'Y' then 1 else 2 end as  CorrectiveSettlement
	   ,corr_action_id as FindingsDescriptions
	   ,corr_action_categ_id as FindingCharacterization			   
from [MISRISK].[dbo].ENV_SOCIAL_CORR_ACTIONS a 
join [ABRS_Staging ].[dbo].CL_Entity_Initial_Migration c
        on ISNUMERIC(c.Afm)=1 and cast(a.afm as numeric(10, 0)) = cast(c.afm as numeric(10, 0)) 
where date_created > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) != 0
union
select  
        master_id as GroupId
	   ,entityid as EntityId	
	   ,date_created as CorrectiveDate	
	   ,user_id as UserCreatedLog
	   ,null as EntityVersionId
	   ,null as CorrectiveActionsId
	   ,case when ok_status = 'Y' then 1 else 2 end as  CorrectiveSettlement
	   ,corr_action_id as FindingsDescriptions
	   ,corr_action_categ_id as FindingCharacterization			   
from [MISRISK].[dbo].ENV_SOCIAL_CORR_ACTIONS a 
join [ABRS_Staging ].[dbo].[CL_Entity_Initial_Migration] c
         on a.kwd_pelath=c.cdicode and a.AFM='000000000'
where  date_created > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) = 0




GO


