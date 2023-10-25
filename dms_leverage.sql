USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_leverage]    Script Date: 25/10/2023 2:04:05 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








create    view [dbo].[dms_leverage] as
select top (1000000)  
	 EntityId
	,row_number() over (order by EntityId asc, SysDate asc) as LeverageId
	, EntityVersionId
	, CreatedUser
	,CreatedDate
	,CreditCommitteeDate
	,LeverageFinancialIndication
	, LeverageFinancingReason	
	, LeverageTypeReview
	, SysDate	
	,LeverageSaved
	,Active	
from (

select 
	-- a.serial_id
	  c.entityid as EntityId
	  ,null as LeverageId
	 ,isnull(d.EntityVersionId_,1) as EntityVersionId
	 ,lf_user as CreatedUser
	 ,lf_log_date as CreatedDate
     ,lf_date as CreditCommitteeDate
	 ,case when lf_value = 'Y'
	        then 2 else 3 end as LeverageFinancialIndication
	,case when lf_reason = 1
			then 2
		  when lf_reason = 2
		    then 3 else 4 end as LeverageFinancingReason	
	,case when lf_type_of_review = 1
			then 2 else 3 end as LeverageTypeReview
	,lf_log_date as SysDate	
	,1 as LeverageSaved
	,case when active = 'Y' then 'Active' else 'Inactive' end as Active	
from [MISRISK].[dbo].LEV_FIN_2020_INDICATIONS a
join [ABRS_Staging ].[dbo].[export_abrs_to_cl] c on cast(a.afm as numeric(10, 0)) = cast(c.Gc18 as numeric(10, 0)) 
left join [ABRS_Staging ].[dbo].IMP_CL_Entity d on cast(c.entityid as int) =cast(d.EntityId as int)
where  ISNUMERIC(a.afm) = 1
and lf_date > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) != 0
--and c.entityid = '100004'
union
select 
	 --a.serial_id
	 c.entityid as EntityId
	 ,null as LeverageId
	,isnull(d.EntityVersionId_,1) as EntityVersionId
	 ,lf_user as CreatedUser
	 ,lf_log_date as CreatedDate
     ,lf_date as CreditCommitteeDate
	 ,case when lf_value = 'Y'
	        then 2 else 3 end as LeverageFinancialIndication
	,case when lf_reason = 1
			then 2
		  when lf_reason = 2
		    then 3 else 4 end as LeverageFinancingReason	
	,case when lf_type_of_review = 1
			then 2 else 3 end as LeverageTypeReview
	,lf_log_date as SysDate	
	,1 as LeverageSaved
	,case when active = 'Y' then 'Active' else 'Inactive' end as Active			
from [MISRISK].[dbo].LEV_FIN_2020_INDICATIONS a
join [ABRS_Staging ].[dbo].[export_abrs_to_cl] c on a.kwd_pelath=c.cdicode and a.afm = '000000000'
left join [ABRS_Staging ].[dbo].IMP_CL_Entity d on cast(c.entityid as int) =cast(d.EntityId as int)
where a.active='Y' 
and ISNUMERIC(a.afm) = 1
and lf_date > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) = 0 
--and c.entityid = '100004'
) x

order by EntityId,SysDate 








GO


