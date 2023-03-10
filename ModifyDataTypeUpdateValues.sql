----Object.... Modify column data type then update its values
---HL7OUTBOXMESSAGES table was built to save MESSAGETEXT in CLOB format that not support larger data such as hl7 messages and Json
-- first this data Type of this column is altered to BLOB data type that can Support
-- Second We can update the previous invalid date to new data

alter table
   HL7OUTBOXMESSAGES
modify
(
   MESSAGETEXT    BLOB 
);

----------------------------- Updated with Base 64 format ----------------------------------------------------
UPDATE HL7OUTBOXMESSAGES SET MESSAGETEXT =
WHERE ID = 5066319;
----------------------------- Updated with HL7 messages -----------------------------------------------------------------
UPDATE HL7OUTBOXMMESSAGETEXTESSAGES SET MESSAGETEXT =
"MSH|^~\&|Mohamed_Saied|Main Branch ( HQ ),1|LIS|Mohamed_Saied|20230123160900||ORM^O01|6000000000001515549||2.3
PID||test123|||TEST Mohamed^saeed^^^^^L||19860307000000|F|||^^|NA|01017753506^^|||Unknow||||NA||||||||EG
ORC|NW|12309999||01test1230|SC||^^^^^1||20230123162900|||0000022953^^^|NO-ER|||||||||||||||
OBR|0001|12309999|0008213118|120^CBC (COMPLETE BLOOD PICTURE)||20220609001651|||||A|||||0000022953||||||||NO-ER|||^^^^^" 
WHERE ID = 5066371;