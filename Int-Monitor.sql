select count(distinct(NAME)) from hl7clients;
------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------SENT INTEGRATION MESAGES--------------------------
SELECT COUNT(S.ID) SENTMESSAGES FROM HL7SENTMESSAGES S
  JOIN REGISTRATION  R
    ON S.REGISTRATIONID = R.id
        where R.RegistrationDATE between 
        to_date('01-02-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM') and  
        to_date('08-03-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM')
        order by S.SENTDATE;
-------------------------------------------------------------------------------------------------------------------------------        
SELECT * FROM INTEG_DELETEDMESSAGES ;
-------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------DELETED INTEGRATION MESAGES--------------------------
SELECT COUNT(D.ID) DELETEDMESSAGES FROM integ_deletedmessages D
  JOIN REGISTRATION  R
    ON D.REGISTRATIONID = R.id
        where R.RegistrationDATE between 
        to_date('01-03-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM') and  
        to_date('09-03-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM')
        order by D.CREATIONDATE;
-------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------FAILED INTEGRATION MESAGES--------------------------
SELECT COUNT(F.ID) FAILEDMESSAGES FROM HL7FAILEDMESSAGES F
  JOIN REGISTRATION  R
    ON F.REGISTRATIONID = R.id
        where R.RegistrationDATE between 
        to_date('01-02-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM') and  
        to_date('08-03-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM')
        order by F.SENTDATE;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Custiumized Pending INTEGRATION MESAGES--------------------------
Select M.REFMESSAGEID,T.NAME AS MESSAGETYPE,M.CREATION_DATE,R.ACCESSIONNUMBER,
       R.PATIENTNUMBER, R.FIRSTNAME||' '||R.MIDDLENAME||' '||R.LASTNAME as PATIENTNAME,
       R.DOB,R.REGISTRATIONDATE,B.NAME AS BRANCH,P.NAME AS PAYER,C.NAME AS CONTRACT,
       H.NAME As Hl7Client 
from HL7FAILEDMESSAGES M
  JOIN REGISTRATION  R
ON M.REGISTRATIONID = R.id
  JOIN HL7CLIENTS  H
on  M.CLIENTID =H.ID 
 JOIN HL7MESSAGETYPE  T
on M.MESSAGETYPE = T.ID 
 JOIN BRANCH  B
on R.BRANCHID = B.ID
 JOIN CONTRACT  C
on R.CONTRACTID = C.ID
 JOIN PAYER P
on C.PAYERID = P.ID
where R.RegistrationDATE between 
to_date('01-02-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM') and to_date('08-03-2023 12:00:00 AM','DD-MM-YYYY HH:MI:SS AM') 
AND M.REGISTRATIONID is not NULL 
AND R.ID  is not NULL 
AND M.CLIENTID is not NULL 
AND H.ID  is not NULL 
AND M.MESSAGETYPE is not NULL
AND T.ID is not NULL
AND R.BRANCHID is not NULL
AND B.ID is not NULL
AND C.ID is not NULL
AND R.CONTRACTID is not NULL
AND P.ID is not NULL
AND C.PAYERID is not NULL
and R.ACCESSIONNUMBER = 991230017
--The following line is the Only Changeable in Our Query You can custimize it to retrieve your own Query
--or P.NAME ='Auditing' And C.ID = 500113
order by M.SENTDATE;