-- =============================================
-- Application: Sample 13 - Tests
-- Version 10.13, April 29, 2024
--
-- Copyright 2021-2024 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE USER sample13_user1 WITH PASSWORD 'Usr_2011#_Xls4168';

GRANT USAGE ON SCHEMA s13 TO sample13_user1;

GRANT USAGE ON SCHEMA information_schema TO sample13_user1;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s13   TO sample13_user1;
GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s13   TO sample13_user1;
GRANT USAGE, SELECT ON ALL SEQUENCES                IN SCHEMA s13   TO sample13_user1;
