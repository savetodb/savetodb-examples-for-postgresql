-- =============================================
-- Application: Sample 07 - Master Data Editor
-- Version 10.6, December 13, 2022
--
-- Copyright 2017-2022 Gartle LLC
--
-- License: MIT
-- =============================================

REVOKE USAGE ON SCHEMA s07 FROM sample07_user1;

REVOKE ALL    ON ALL TABLES     IN SCHEMA s07 FROM sample07_user1;
REVOKE ALL    ON ALL FUNCTIONS  IN SCHEMA s07 FROM sample07_user1;

DROP USER sample07_user1;

DROP TABLE IF EXISTS s07.employee_territories;
DROP TABLE IF EXISTS s07.employees;
DROP TABLE IF EXISTS s07.territories;
DROP TABLE IF EXISTS s07.regions;

DROP SCHEMA IF EXISTS s07;

-- print Application removed
