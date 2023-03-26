-- =============================================
-- Application: Sample 02 - Advanced SaveToDB Features
-- Version 10.8, January 9, 2023
--
-- Copyright 2017-2023 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE USER sample02_user1 WITH PASSWORD 'Usr_2011#_Xls4168';
CREATE USER sample02_user2 WITH PASSWORD 'Usr_2011#_Xls4168';
CREATE USER sample02_user3 WITH PASSWORD 'Usr_2011#_Xls4168';

GRANT USAGE ON SCHEMA s02 TO sample02_user1;
GRANT USAGE ON SCHEMA s02 TO sample02_user2;
GRANT USAGE ON SCHEMA s02 TO sample02_user3;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s02 TO sample02_user1;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s02 TO sample02_user2;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s02 TO sample02_user3;

GRANT USAGE, SELECT ON ALL SEQUENCES                IN SCHEMA s02 TO sample02_user1;
GRANT USAGE, SELECT ON ALL SEQUENCES                IN SCHEMA s02 TO sample02_user2;
GRANT USAGE, SELECT ON ALL SEQUENCES                IN SCHEMA s02 TO sample02_user3;

GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s02 TO sample02_user1;
GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s02 TO sample02_user2;
GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s02 TO sample02_user3;

GRANT USAGE ON SCHEMA s02       TO sample02_user1;

GRANT USAGE ON SCHEMA xls       TO sample02_user1;
GRANT USAGE ON SCHEMA xls       TO sample02_user2;

GRANT SELECT  ON xls.formats    TO sample02_user1;
GRANT SELECT  ON xls.workbooks  TO sample02_user1;
GRANT SELECT  ON xls.formats    TO sample02_user2;
GRANT SELECT  ON xls.workbooks  TO sample02_user2;

GRANT xls_users                 TO sample02_user3;
