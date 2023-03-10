-----------------------------------------------------------------------------------------------------
    --- i involved to fill hl7sentmessages table by data from hl7 client page
    ----I have to obay the data types 
    ---I have to be care about the difference between the 2 column's names 
    ---i have to miss the first table id as its constraint primary key in the second table
    ----i have to save all constrained columns for new  table excistance.
---------------------------------------------------------------------------------------------------------------------
------------------------- Fill hl7sentmessages -------------------------------------------------------------------
   Insert into HL7SENTMESSAGES
   ( MESSAGETEXT,
    MESSAGEID,  MESSAGETYPEID, 
    REGISTRATIONID, CREATION_DATE,
      ACKNOWLEDGEMENT,ACTIONTYPE, REFMESSAGEID,CLIENTID, SENTDATE)        
    SELECT MESSAGETEXT,MESSAGEID,MESSAGETYPE,REGISTRATIONID,
            CREATION_DATE,CREATEDBY ,ACTIONTYPE,
            REFMESSAGEID, CLIENTID,CREATION_DATE 
 FROM HL7OUTBOXMESSAGES
 where CREATION_DATE between 
        to_date('09-03-2023 10:00:00 AM','DD-MM-YYYY HH:MI:SS AM') and  
        to_date('09-03-2023 11:00:00 AM','DD-MM-YYYY HH:MI:SS AM')
        ;
    -------------------------------------------------------------------------------------------------------------------
    
   ------------------------- Fill hl7faiedlmessages -------------------------------------------------------------------
   Insert into HL7failedMESSAGES
   ( MESSAGETEXT,
    MESSAGEID,  MESSAGETYPE, 
    REGISTRATIONID, CREATION_DATE,
      FAILEDREASON,ACTIONTYPE, REFMESSAGEID,CLIENTID, SENTDATE)        
    SELECT MESSAGETEXT,MESSAGEID,MESSAGETYPE,REGISTRATIONID,
            CREATION_DATE,CREATEDBY ,ACTIONTYPE,
            REFMESSAGEID, CLIENTID,CREATION_DATE 
 FROM HL7OUTBOXMESSAGES
 where CREATION_DATE between 
        to_date('09-03-2023 10:00:00 AM','DD-MM-YYYY HH:MI:SS AM') and  
        to_date('09-03-2023 11:00:00 AM','DD-MM-YYYY HH:MI:SS AM')
        ;
--------------------------------------------------------------------------------------------------------------