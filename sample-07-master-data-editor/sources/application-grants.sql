-- =============================================
-- Application: Sample 07 - Master Data Editor
-- Version 10.6, December 13, 2022
--
-- Copyright 2017-2022 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE USER sample07_user1 WITH PASSWORD 'Usr_2011#_Xls4168';

GRANT USAGE ON SCHEMA s07 TO sample07_user1;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA s07 TO sample07_user1;
GRANT EXECUTE ON ALL FUNCTIONS                      IN SCHEMA s07 TO sample07_user1;
