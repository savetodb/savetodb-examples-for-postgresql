-- =============================================
-- SaveToDB Framework Extension for PostgreSQL
-- Version 10.8, January 9, 2023
--
-- Copyright 2022-2023 Gartle LLC
--
-- License: MIT
-- =============================================

DELETE FROM xls.formats   WHERE table_schema = 'xls' AND table_name IN ('view_columns', 'view_formats', 'view_handlers', 'view_objects', 'view_queries', 'view_translations', 'view_workbooks');
DELETE FROM xls.handlers  WHERE table_schema = 'xls' AND table_name IN ('view_columns', 'view_formats', 'view_handlers', 'view_objects', 'view_queries', 'view_translations', 'view_workbooks', 'savetodb_framework_extension');
DELETE FROM xls.workbooks WHERE TABLE_SCHEMA = 'xls' AND name IN ('savetodb_user_configuration.xlsx');

DELETE FROM xls.handlers  WHERE table_schema = 'xls' AND table_name = 'users' AND handler_name IN ('xl_actions_set_framework_10_mode', 'xl_actions_set_framework_9_mode', 'xl_actions_set_extended_role_permissions', 'xl_actions_revoke_extended_role_permissions');

DROP FUNCTION IF EXISTS xls.xl_actions_set_framework_10_mode;
DROP FUNCTION IF EXISTS xls.xl_actions_set_framework_9_mode;
DROP FUNCTION IF EXISTS xls.xl_actions_set_extended_role_permissions;
DROP FUNCTION IF EXISTS xls.xl_actions_revoke_extended_role_permissions;
DROP FUNCTION IF EXISTS xls.xl_update_table_format (varchar, varchar, text, varchar);

DROP VIEW IF EXISTS xls.view_columns;
DROP VIEW IF EXISTS xls.view_formats;
DROP VIEW IF EXISTS xls.view_handlers;
DROP VIEW IF EXISTS xls.view_objects;
DROP VIEW IF EXISTS xls.view_queries;
DROP VIEW IF EXISTS xls.view_translations;
DROP VIEW IF EXISTS xls.view_workbooks;

-- print SaveToDB Framework Extension removed
