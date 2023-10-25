USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_correctiveactionsmaster]    Script Date: 25/10/2023 2:01:24 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--drop view [dbo].[dms_correctiveactionsmaster]
create view [dbo].[dms_correctiveactionsmaster] as 
select top(100000) * 
from (
select 
	distinct('10000000-0000-0000-0000-' + replicate('0',12-len(cast(a.master_id as varchar(12)))) + cast(a.master_id as varchar(12))) as CorrectiveActionsMasterId,
	b.EntityId , 
	convert(varchar(20),a.[DATE_CREATED],120) as [Date],
	a.user_id as [User],
	1 as EsPolicyVersionId,
	d.grade_value as EsPolicyCategorization,
	isnull(e.EntityVersionId_,1) as EntityVersionId			
from misrisk.dbo.ENV_SOCIAL_CORR_ACTIONS a
inner join [dbo].[export_abrs_to_cl]  b on cast(a.afm as numeric(10,0))=  cast(b.Gc18 as numeric(10,0))
join misrisk.dbo.ENV_SOCIAL_RATINGS c on a.env_social_rating_id=c.my_index
left join misrisk.dbo.ENV_SOCIAL_Grade_params d on d.grade_id=c.final_risk_category_code
left join [ABRS_Staging ].[dbo].IMP_CL_Entity e on b.entityid =e.EntityId
where cast(a.afm as int)!=0
union
select 
	distinct('10000000-0000-0000-0000-' + replicate('0',12-len(cast(a.master_id as varchar(12)))) + cast(a.master_id as varchar(12))) as CorrectiveActionsMasterId,
	b.EntityId , 
	convert(varchar(20),a.[DATE_CREATED],120) as [Date],
	a.user_id as [User],
	1 as EsPolicyVersionId,
	d.grade_value as EsPolicyCategorization,
	isnull(e.EntityVersionId_,1) as EntityVersionId	
from misrisk.dbo.ENV_SOCIAL_CORR_ACTIONS a 
inner join [dbo].[export_abrs_to_cl]  b on a.kwd_pelath = b.cdicode and a.afm='000000000'
left join misrisk.dbo.ENV_SOCIAL_RATINGS c on a.env_social_rating_id=c.my_index
left join misrisk.dbo.ENV_SOCIAL_Grade_params d on d.grade_id=c.final_risk_category_code
left join [ABRS_Staging ].[dbo].IMP_CL_Entity e on b.entityid =e.EntityId
where cast(a.afm as int)=0)x
order by x.[Date]







GO


