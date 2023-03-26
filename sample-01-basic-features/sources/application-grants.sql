-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.8, January 9, 2023
--
-- Copyright 2015-2023 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE USER sample01_user1 WITH PASSWORD 'Usr_2011#_Xls4168';
CREATE USER sample01_user2 WITH PASSWORD 'Usr_2011#_Xls4168';

GRANT USAGE ON SCHEMA s01 TO sample01_user1;
GRANT USAGE ON SCHEMA s01 TO sample01_user2;

GRANT USAGE ON SCHEMA information_schema TO sample01_user1;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s01   TO sample01_user1;
GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s01   TO sample01_user1;
GRANT USAGE, SELECT ON ALL SEQUENCES                IN SCHEMA s01   TO sample01_user1;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s01   TO sample01_user2;
GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s01   TO sample01_user2;
GRANT USAGE, SELECT ON ALL SEQUENCES                IN SCHEMA s01   TO sample01_user2;
