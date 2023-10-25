USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_utp]    Script Date: 25/10/2023 2:09:39 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--drop view dms_utp
create view [dbo].[dms_utp] as

select EntityId
       ,row_number() over (order by entityid asc, AuthorizationDate asc) as UtpId
	  ,UtpBoolHidden
	  ,Origination
	  ,UtpObligor
	  ,UtpComments
	  ,CreditCommittee	
	  ,UtpAssessmentDate	
	  ,UtpAuthorizationDate
	  ,ModificationsId	
	  ,MultipleId	
	  ,BorrowersId	
	  ,FinancialId	
	  ,EbitdaId	
	  ,CdsId	
	  ,LossId	
	  ,ConnectedId	
	  ,RestrictedId	
	  ,ExpectationId	
	  ,DisappearanceId	
	  ,BorrowerId	
	  ,Negativeid	
	  ,AdverseId	
	  ,ThirdpartyId	
	  ,DelayedId	
	  ,BorrowerExposuresId	
	  ,NpvId	
	  ,FplMonthId	
	  ,FplmeasuresId	
	  ,ReductionId	
	  ,LicenseId	
	  ,PostponementsId	
	  ,BorrowerIncomeId	
	  ,FraudId	
	  ,BreachId	
	  ,DisActiveMarketId	
	  ,CreditInstitutionId	
	  ,IsdaId	
	  ,OutOfCourtId	
	  ,ObligorId	
	  ,BankId	
	  ,LoanId	
	  ,WriteoffId	
	  ,SaleId	
	  ,NpvBiggerId	
	  ,ArrearsId	
	  ,AuthorizationDate	
	  ,UtpCatchTriggers	
	  ,Active	
	  ,UtpAuthorizedUser	
	  ,UtpAssessmentUser	
	  ,UtpAuthorizationSysDate	
	  ,EntityVersionId
from (
select  
	b.entityid as EntityId
	,NULL as UtpId
	,'true' as UtpBoolHidden
	,origination as Origination
	,case when utp_obligor = 'Y' then 1 
	     else 2 end as UtpObligor
	,utp_comment as UtpComments 
	,isnull(e.[key],'Other') as  CreditCommittee
	,utp_assessment_date as UtpAssessmentDate
	,utp_auth_date as UtpAuthorizationDate
    ,case when soft_trigger_events like '%35;%' 
		    then 'true' else 'false' end as ModificationsId
	,case when soft_trigger_events like '%36;%' 
	        then 'true' else 'false' end as MultipleId
	,case when soft_trigger_events like '%37;%' 
	        then 'true' else 'false' end as BorrowersId
	,case when soft_trigger_events like '%38;%' 
	        then 'true' else 'false' end as FinancialId
	,case when soft_trigger_events like '%39;%' 
	        then 'true' else 'false' end as EbitdaId
	,case when soft_trigger_events like '%40;%' 
	        then 'true' else 'false' end as CdsId	
	,case when soft_trigger_events like '%41;%' 
	        then 'true' else 'false' end as LossId
	,case when soft_trigger_events like '%43;%' 
	        then 'true' else 'false' end as ConnectedId
	,case when soft_trigger_events like '%44;%' 
	        then 'true' else 'false' end as RestrictedId
	,case when soft_trigger_events like '%45;%' 
	        then 'true' else 'false' end as ExpectationId
	,case when soft_trigger_events like '%46;%' 
	        then 'true' else 'false' end as DisappearanceId
	,case when soft_trigger_events like '%47;%' 
	        then 'true' else 'false' end as BorrowerId
	,case when soft_trigger_events like '%48;%' 
	        then 'true' else 'false' end as Negativeid
	,case when soft_trigger_events like '%49;%' 
	        then 'true' else 'false' end as AdverseId
	,case when soft_trigger_events like '%50;%' 
	        then 'true' else 'false' end as ThirdpartyId
	,case when soft_trigger_events like '%51;%' 
	        then 'true' else 'false' end as DelayedId
	,case when soft_trigger_events like '%52;%' 
	        then 'true' else 'false' end as BorrowerExposuresId
	,case when soft_trigger_events like '%53;%' 
	        then 'true' else 'false' end as NpvId
	,case when soft_trigger_events like '%54;%' 
	        then 'true' else 'false' end as FplMonthId
	,case when soft_trigger_events like '%55;%' 
	        then 'true' else 'false' end as FplmeasuresId 
	,case when soft_trigger_events like '%56;%' 
	        then 'true' else 'false' end as ReductionId	
	,case when hard_trigger_events like '%38;%' 
		    then 'true' else 'false' end as LicenseId
	,case when hard_trigger_events like '%39;%' 
	        then 'true' else 'false' end as PostponementsId
	,case when hard_trigger_events like '%40;%' 
	        then 'true' else 'false' end as BorrowerIncomeId	 
	,case when hard_trigger_events like '%41;%' 
	        then 'true' else 'false' end as FraudId
	,case when hard_trigger_events like '%42;%' 
	        then 'true' else 'false' end as BreachId
	,case when hard_trigger_events like '%43;%' 
	        then 'true' else 'false' end as DisActiveMarketId
	,case when hard_trigger_events like '%46;%' 
	        then 'true' else 'false' end as CreditInstitutionId
	,case when hard_trigger_events like '%47;%' 
	        then 'true' else 'false' end as IsdaId
	,case when hard_trigger_events like '%48;%' 
	        then 'true' else 'false' end as OutOfCourtId
	,case when hard_trigger_events like '%49;%' 
	        then 'true' else 'false' end as ObligorId
	,case when hard_trigger_events like '%50;%' 
	        then 'true' else 'false' end as BankId
	,case when hard_trigger_events like '%51;%' 
	        then 'true' else 'false' end as LoanId
	,case when hard_trigger_events like '%52;%' 
	        then 'true' else 'false' end as WriteoffId
	,case when hard_trigger_events like '%53;%' 
	        then 'true' else 'false' end as SaleId
	,case when hard_trigger_events like '%54;%' 
	        then 'true' else 'false' end as NpvBiggerId
	,case when hard_trigger_events like '%55;%' 
	        then 'true' else 'false' end as ArrearsId
   ,utp_auth_date as AuthorizationDate
   ,1 as UtpCatchTriggers  
   ,case when my_index = (select max(t1.my_index) from [MISRISK].[dbo]. utp_ratings t1 where t1.utp_auth_flag = 'Y' and t1.afm = a.afm) then 'Active' else 'Inactive' end as Active
   ,utp_auth_user as UtpAuthorizedUser
   ,utp_assessment_user as UtpAssessmentUser
   ,utp_auth_log_date as UtpAuthorizationSysDate
   ,isnull(d.EntityVersionId_,1) as EntityVersionId
from [MISRISK].[dbo].[UTP_RATINGS] a
 join [ABRS_Staging].[dbo].[export_abrs_to_cl] b on cast(a.afm as numeric(10, 0)) = cast(b.Gc18 as numeric(10, 0))
left join [ABRS_Staging].[dbo].IMP_CL_Entity d on b.entityid =d.EntityId  
left join [ABRS_Staging].[dbo].[utp_Credit_Committee] e on cast(a.[utp_credit_commitee] as varchar)  = e.[Mappings_ABRS] 
where utp_auth_flag='Y'
and utp_assessment_date > '2018-01-01 00:00:00.000'
and cast(a.afm as numeric(10, 0)) != 0
--and b.entityid in ('100004','100025','100068')
union
select 
	b.entityid as EntityId
	,NULL as UtpId
	,'true' as UtpBoolHidden
	,origination as Origination
	,case when utp_obligor = 'Y' then 1 
	      else 2 end as UtpObligor	 
	,utp_comment as UtpComments
	,isnull(e.[key],'Other') as  CreditCommittee
	,utp_assessment_date as UtpAssessmentDate	
	,utp_auth_date as UtpAuthorizationDate
    ,case when soft_trigger_events like '%35;%' 
		    then 'true' else 'false' end as ModificationsId
	,case when soft_trigger_events like '%36;%' 
	        then 'true' else 'false' end as MultipleId
	,case when soft_trigger_events like '%37;%' 
	        then 'true' else 'false' end as BorrowersId
	,case when soft_trigger_events like '%38;%' 
	        then 'true' else 'false' end as FinancialId
	,case when soft_trigger_events like '%39;%' 
	        then 'true' else 'false' end as EbitdaId
	,case when soft_trigger_events like '%40;%' 
	        then 'true' else 'false' end as CdsId	
	,case when soft_trigger_events like '%41;%' 
	        then 'true' else 'false' end as LossId
	,case when soft_trigger_events like '%43;%' 
	        then 'true' else 'false' end as ConnectedId
	,case when soft_trigger_events like '%44;%' 
	        then 'true' else 'false' end as RestrictedId
	,case when soft_trigger_events like '%45;%' 
	        then 'true' else 'false' end as ExpectationId
	,case when soft_trigger_events like '%46;%' 
	        then 'true' else 'false' end as DisappearanceId
	,case when soft_trigger_events like '%47;%' 
	        then 'true' else 'false' end as BorrowerId
	,case when soft_trigger_events like '%48;%' 
	        then 'true' else 'false' end as Negativeid
	,case when soft_trigger_events like '%49;%' 
	        then 'true' else 'false' end as AdverseId
	,case when soft_trigger_events like '%50;%' 
	        then 'true' else 'false' end as ThirdpartyId
	,case when soft_trigger_events like '%51;%' 
	        then 'true' else 'false' end as DelayedId
	,case when soft_trigger_events like '%52;%' 
	        then 'true' else 'false' end as BorrowerExposuresId
	,case when soft_trigger_events like '%53;%' 
	        then 'true' else 'false' end as NpvId
	,case when soft_trigger_events like '%54;%' 
	        then 'true' else 'false' end as FplMonthId
	,case when soft_trigger_events like '%55;%' 
	        then 'true' else 'false' end as FplmeasuresId
	,case when soft_trigger_events like '%56;%' 
	        then 'true' else 'false' end as ReductionId	
	,case when hard_trigger_events like '%38;%' 
		    then 'true' else 'false' end as LicenseId
	,case when hard_trigger_events like '%39;%' 
	        then 'true' else 'false' end as PostponementsId
	,case when hard_trigger_events like '%40;%' 
	        then 'true' else 'false' end as BorrowerIncomeId	 
	,case when hard_trigger_events like '%41;%' 
	        then 'true' else 'false' end as FraudId
	,case when hard_trigger_events like '%42;%' 
	        then 'true' else 'false' end as BreachId
	,case when hard_trigger_events like '%43;%' 
	        then 'true' else 'false' end as DisActiveMarketId
	,case when hard_trigger_events like '%46;%' 
	        then 'true' else 'false' end as CreditInstitutionId
	,case when hard_trigger_events like '%47;%' 
	        then 'true' else 'false' end as IsdaId
	,case when hard_trigger_events like '%48;%' 
	        then 'true' else 'false' end as OutOfCourtId
	,case when hard_trigger_events like '%49;%' 
	        then 'true' else 'false' end as ObligorId
	,case when hard_trigger_events like '%50;%' 
	        then 'true' else 'false' end as BankId
	,case when hard_trigger_events like '%51;%' 
	        then 'true' else 'false' end as LoanId
	,case when hard_trigger_events like '%52;%' 
	        then 'true' else 'false' end as WriteoffId
	,case when hard_trigger_events like '%53;%' 
	        then 'true' else 'false' end as SaleId
	,case when hard_trigger_events like '%54;%' 
	        then 'true' else 'false' end as NpvBiggerId
	,case when hard_trigger_events like '%55;%' 
	        then 'true' else 'false' end as ArrearsId
	,utp_auth_date as AuthorizationDate
	,1 as UtpCatchTriggers
	,case when my_index = (select max(t1.my_index) from [MISRISK].[dbo]. utp_ratings t1 where t1.utp_auth_flag = 'Y' and t1.kwd_pelath = a.kwd_pelath) then 'Active' else 'Inactive' end as Active  
	,utp_auth_user as UtpAuthorizedUser
	,utp_assessment_user as UtpAssessmentUser
	,utp_auth_log_date as UtpAuthorizationSysDate
	,isnull(d.EntityVersionId_,1) as EntityVersionId
from [MISRISK].[dbo].[UTP_RATINGS] a
 join [ABRS_Staging ].[dbo].[export_abrs_to_cl] b on a.kwd_pelath=b.cdicode  and a.afm = '000000000'
left join [ABRS_Staging ].[dbo].IMP_CL_Entity d on b.entityid  =d.EntityId  
left join [ABRS_Staging].[dbo].[utp_Credit_Committee] e on cast(a.[utp_credit_commitee] as varchar)  = e.[Mappings_ABRS] 
where utp_auth_flag='Y'
and cast(a.afm as numeric(10, 0)) = 0 
and utp_assessment_date > '2018-01-01 00:00:00.000'

--and b.entityid in ('100004','100025','100068')
)x
--order by utpid







GO


