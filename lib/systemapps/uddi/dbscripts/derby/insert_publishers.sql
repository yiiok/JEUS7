CONNECT 'jdbc:derby://localhost:1527/UDDIDB;create=true';

INSERT INTO PUBLISHER (PUBLISHER_ID,PUBLISHER_NAME,IS_ADMIN)
VALUES ('admin','Administrator','true');

INSERT INTO PUBLISHER (PUBLISHER_ID,PUBLISHER_NAME,IS_ADMIN)
VALUES ('jeus','JEUS','false');
