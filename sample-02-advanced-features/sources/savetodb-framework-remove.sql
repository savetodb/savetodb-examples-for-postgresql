-- =============================================
-- SaveToDB Framework for PostgreSQL
-- Version 10.6, December 13, 2022
--
-- Copyright 2015-2022 Gartle LLC
--
-- License: MIT
-- =============================================

REVOKE USAGE ON SCHEMA xls FROM xls_developers;
REVOKE USAGE ON SCHEMA xls FROM xls_formats;
REVOKE USAGE ON SCHEMA xls FROM xls_users;

DROP FUNCTION IF EXISTS xls.xl_actions_set_framework_10_mode;
DROP FUNCTION IF EXISTS xls.xl_actions_set_framework_9_mode;
DROP FUNCTION IF EXISTS xls.xl_actions_set_extended_role_permissions;
DROP FUNCTION IF EXISTS xls.xl_actions_revoke_extended_role_permissions;
DROP FUNCTION IF EXISTS xls.xl_actions_set_role_permissions;
DROP FUNCTION IF EXISTS xls.xl_update_table_format (varchar, varchar, text, varchar);

DROP VIEW IF EXISTS xls.view_columns;
DROP VIEW IF EXISTS xls.view_formats;
DROP VIEW IF EXISTS xls.view_handlers;
DROP VIEW IF EXISTS xls.view_objects;
DROP VIEW IF EXISTS xls.view_queries;
DROP VIEW IF EXISTS xls.view_translations;
DROP VIEW IF EXISTS xls.view_workbooks;
DROP VIEW IF EXISTS xls.queries;
DROP VIEW IF EXISTS xls.users;

DROP TABLE IF EXISTS xls.columns;
DROP TABLE IF EXISTS xls.formats;
DROP TABLE IF EXISTS xls.handlers;
DROP TABLE IF EXISTS xls.objects;
DROP TABLE IF EXISTS xls.translations;
DROP TABLE IF EXISTS xls.workbooks;

DROP ROLE IF EXISTS xls_developers;
DROP ROLE IF EXISTS xls_formats;
DROP ROLE IF EXISTS xls_users;

DROP SCHEMA IF EXISTS xls;

-- print SaveToDB Framework removed
