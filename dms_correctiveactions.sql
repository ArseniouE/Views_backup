USE [ABRS_Staging ]
GO

/****** Object:  View [dbo].[dms_correctiveactions]    Script Date: 25/10/2023 2:00:47 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







create   view [dbo].[dms_correctiveactions] as 
select 
('10000000-0000-0000-0000-' + replicate('0',12-len(cast(a.master_id as varchar(12)))) + cast(a.master_id as varchar(12))) as CorrectiveActionsMasterId,
end_date as SettlementDate,
case when ok_status = 'Y' then 1 else 2 end as  CorrectiveSettlement,
corr_action_id as FindingsDescriptions, 
corr_action_categ_id as FindingCharacterization,
1 as CorrecdtiveActionsSave
from misrisk.dbo.ENV_SOCIAL_CORR_ACTIONS a
where ('10000000-0000-0000-0000-' + replicate('0',12-len(cast(a.master_id as varchar(12)))) + cast(a.master_id as varchar(12)) in 
( select CorrectiveActionsMasterId from dms_correctiveactionsmaster))





GO


