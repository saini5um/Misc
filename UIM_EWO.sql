select * from costreference; -- BOM

select * from user_tables where table_name like 'ACT%CHAR%';

select * from activityspecification;

select * from activity_char;

-- BI Hierarchy
select * from biitem_biitem;
select * from ENTITYIDSPECIFICATION;
select * from SPECIFICATIONREL where parent = 251100003;

select entityclass, count(*) 
from businessinteraction
group by entityclass; -- 190 BI

-- EWO Specs
select * from workflowspecification order by 1; -- Defines the EWO
select * from BUSINESSINTERACTIONSPEC order by 1; -- 3150131 = EWO
select * from SPECIFICATION where entityid in (4725013, 3150131);
select * from SPECIFICATIONTYPE; -- null table
select * from specification where entityclass = 'BusinessInteractionSpecDAO';

-- EWO Instance
select * from businessinteraction 
where entityclass = 'BusinessInteractionDAO'
and specification = 3150131 -- 135
and id = 1125001; -- entityid = 42075009

-- EWO Activities is in XML BLOB!!!
select * from BUSINESSINTERACTIONATTACHMENT where businessinteraction = 42075009;
select * from BUSINESSINTERACTIONITEM where businessinteraction = 42075009;

-- Activity Definition
select instructions, duration, iscritical, ismilestone, entityid 
from activityspecification
where entityid in (35250720, 35250702);
select name, description, entityid from activitytype; -- 1200000 = EWO Activity

-- Activities in EWO/Projects
select * from activity_char;
select * from activityitem where parentactivity in (34575065, 34575059, 34575053);
select * from activityitemaction; -- Defines action for each activity like Groom Rehome etc
select * from activity where entityid in (34575065, 34575059, 34575053);
select entityclass, count(*) from activity group by entityclass;
select * from activity where assignedto = 'llatham01';
select * from activityitem where entityid = 34575065;

-- Checklists
select * from checklist;
select * from checklistitem;
select * from checklistspecification;

-- Projects
select * from projectspecification; -- 4725006
select * from project_char;
select entityid, createddate, activity, adminstate, description, enddate, name, objectstate, startdate 
from project
order by createddate desc;
select * from activity where project = 25500013;

select specification, count(*) from project --Dynamic Table
group by specification;
