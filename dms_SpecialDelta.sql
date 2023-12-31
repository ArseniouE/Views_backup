USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_SpecialDelta]    Script Date: 25/10/2023 2:08:48 �� ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[dms_SpecialDelta] as
select distinct 
	'Active'							as Active,
	'true'								as AuthorizationFlag,
	a.reason							as Comments,
	case when a.reason = 'Empirical rating from Alpha Bank Luxemburg Branch' then 'NAI' else '���'
	end									as IsLux,
	null								as Deactivation,
	a.[EntityId]						as EntityId, 
	'������ ���������� ����� ���������'	as RatingReason, --ref data SpecialDeltaRatingReason ���� ������ �� �������� 
	a.Id								as RatingScenarioId,
	1									as SpecialDeltaSaved,
	1									as SpecialGrade --ref data SpecialNonSystemicGrade
	
from [ABRS_Staging ].[dbo].[abrs_defaults] a
where 
a.FinalGrade = 'SpecialDelta2'
and a.ExpirationDate IS NULL
and a.ApprovedDate = (select max(c.ApprovedDate) 
						from [ABRS_Staging ].[dbo].[abrs_defaults] c
						where c.EntityId = a.[EntityId])

GO


