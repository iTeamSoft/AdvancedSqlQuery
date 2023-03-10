select * from PENDINGNOTIFICATIONS WHERE SENDASTYPE = 4;

select * from PENDINGNOTIFICATIONS_BK;

drop table PENDINGNOTIFICATIONS_BK;

create table PENDINGNOTIFICATIONS_BK as
 select * from PENDINGNOTIFICATIONS WHERE SENDASTYPE = 4;
 
select * from PENDINGNOTIFICATIONS_BK;

select ACCESSIONNUMBER from PENDINGNOTIFICATIONS_BK;

select * from pendingnotificationsurls 
where ID in (select ACCESSIONNUMBER from PENDINGNOTIFICATIONS_BK);

drop table pendingnotificationsurls_bk ;

create table pendingnotificationsurls_bk as 
select * from pendingnotificationsurls 
where ID in (select ACCESSIONNUMBER from PENDINGNOTIFICATIONS_BK);