USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_espolicy]    Script Date: 25/10/2023 2:03:30 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




--drop view [dbo].[dms_espolicy]
create view [dbo].[dms_espolicy] as 
select 
	   EntityId
      ,row_number() over (order by entityid asc, EnSoAssessmentEndDate asc) as EsPolicyId
      ,ActionPlan
      ,ActionPlanAssessDate
      ,ActionPlanEnddate	
      ,ActionPlanUpdate	
      ,AssessmentCreatedDate	
      ,AssessmentUserCreated	
      ,FlagUpdatedDate	
      ,FlagUpdatedUser	
      ,[Authorization]	
      ,AuthorizeChecker	
      ,AuthorizeShow	
      ,CalculateGeneralRisk	
      ,Choice	
      ,EnSoAssessmentEndDate	
      ,EnSoOverrideCategorization	
      ,EnsoCreditCommittee	
      ,Originated	
      ,OverrideReason	
      ,Active	
      ,ExpirationDate	
      ,EntityVersionId
from (
select
	 c.entityid as EntityId 
	,NUll as EsPolicyId
	,Action_plan as ActionPlan
	,action_plan_date_created as ActionPlanAssessDate
	,action_plan_end_date as ActionPlanEnddate
	,case when action_plan_date_created <> date_created 
	        then 'true' else 'false' end as ActionPlanUpdate
	,date_created as AssessmentCreatedDate
	,a.user_id as AssessmentUserCreated
	,auth_date as FlagUpdatedDate
	,auth_user as FlagUpdatedUser
	,case when auth_flag = 'Y'
			then 1 else 2 end as 'Authorization'
	,'true' as AuthorizeChecker
	,case when Action_plan = 1 
			then 'true' else 'false' end as AuthorizeShow
	,case when Risk_Category_code = 1 
			then 'Low'
		  when Risk_Category_code = 2
		    then 'Medium'
          when Risk_Category_code = 3
		    then 'High' else 'Excluded' end as CalculateGeneralRisk
	,null as Choice
	--,case when origination = 'MANUAL'
			--then 1
		 -- when origination = 'SCORECARD_MATRIX_SME'
		   -- then 2 else 3 end as Choice	
	,end_date as EnSoAssessmentEndDate
	,override_risk_category_code as EnSoOverrideCategorization
	,  isnull(b.[Key],'Other') as EnsoCreditCommittee
	, origination as Originated
	,override_comments as OverrideReason  
	,case when is_active = 'Y' then 'Active' else 'Inactive' end as Active
	,date_liksis as ExpirationDate 	
	,isnull(d.EntityVersionId_,1) as EntityVersionId						   
from [MISRISK].[dbo].ENV_SOCIAL_RATINGS a 
left join [ABRS_Staging ].[dbo].[EsPolicyCreditCommittees] b on a.credit_committee = b.Mapping_ABRS
join  [ABRS_Staging ].[dbo].[export_abrs_to_cl] c
        on ISNUMERIC(c.Gc18)=1 and cast(a.afm as numeric(10, 0)) = cast(c.Gc18 as numeric(10, 0)) 
left join [ABRS_Staging ].[dbo].IMP_CL_Entity d on c.entityid =d.EntityId  
where auth_flag = 'Y'
and date_created > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) != 0

--and c.entityid in ('93333')

union
select
	 c.entityid as EntityId 
	,NULL as EsPolicyId
	,Action_plan as ActionPlan
	,action_plan_date_created as ActionPlanAssessDate
	,action_plan_end_date as ActionPlanEnddate
	,case when action_plan_date_created <> date_created 
	        then 'true' else 'false' end as ActionPlanUpdate
	,date_created as AssessmentCreatedDate
	,a.user_id as AssessmentUserCreated
	,auth_date as FlagUpdatedDate
	,auth_user as FlagUpdatedUser
	,case when auth_flag = 'Y'
			then 1 else 2 end as 'Authorization'
	,'true' as AuthorizeChecker
	,case when Action_plan = 1 
			then 'true' else 'false' end as AuthorizeShow
	,case when Risk_Category_code = 1 
			then 'Low'
		  when Risk_Category_code = 2
		    then 'Medium'
          when Risk_Category_code = 3
		    then 'High' else 'Excluded' end as CalculateGeneralRisk
	,null as Choice
	--,case when origination = 'MANUAL'
			--then 1
		 -- when origination = 'SCORECARD_MATRIX_SME'
		   -- then 2 else 3 end as Choice	
	,end_date as EnSoAssessmentEndDate
	,override_risk_category_code as EnSoOverrideCategorization
	,  isnull(b.[Key],'Other') as EnsoCreditCommittee
	, origination as Originated
	,override_comments as OverrideReason  
	,case when is_active = 'Y' then 'Active' else 'Inactive' end as Active
	,date_liksis as ExpirationDate 	
	,isnull(d.EntityVersionId_,1) as EntityVersionId 
from [MISRISK].[dbo].ENV_SOCIAL_RATINGS a 
left join [ABRS_Staging ].[dbo].[EsPolicyCreditCommittees] b on a.credit_committee = b.Mapping_ABRS
join  [ABRS_Staging ].[dbo].[export_abrs_to_cl] c on a.kwd_pelath=CdiCode and a.AFM='000000000'
left join [ABRS_Staging ].[dbo].IMP_CL_Entity d on c.entityid =d.EntityId
where auth_flag = 'Y'
and date_created > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) = 0

--and c.entityid in ('93333')

)x





GO


