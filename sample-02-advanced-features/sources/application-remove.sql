-- =============================================
-- Application: Sample 02 - Advanced SaveToDB Features
-- Version 10.8, January 9, 2023
--
-- Copyright 2017-2023 Gartle LLC
--
-- License: MIT
-- =============================================

DELETE FROM xls.formats         WHERE TABLE_SCHEMA IN ('s02');
DELETE FROM xls.handlers        WHERE TABLE_SCHEMA IN ('s02');
DELETE FROM xls.objects         WHERE TABLE_SCHEMA IN ('s02');
DELETE FROM xls.translations    WHERE TABLE_SCHEMA IN ('s02');
DELETE FROM xls.workbooks       WHERE TABLE_SCHEMA IN ('s02');

REVOKE USAGE ON SCHEMA s02  FROM sample02_user1;
REVOKE USAGE ON SCHEMA s02  FROM sample02_user2;
REVOKE USAGE ON SCHEMA s02  FROM sample02_user3;
REVOKE USAGE ON SCHEMA xls  FROM sample02_user1;
REVOKE USAGE ON SCHEMA xls  FROM sample02_user2;

REVOKE xls_users            FROM sample02_user2;

REVOKE ALL ON ALL TABLES    IN SCHEMA s02 FROM sample02_user1;
REVOKE ALL ON ALL TABLES    IN SCHEMA s02 FROM sample02_user2;
REVOKE ALL ON ALL TABLES    IN SCHEMA s02 FROM sample02_user3;

REVOKE ALL ON ALL FUNCTIONS IN SCHEMA s02 FROM sample02_user1;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA s02 FROM sample02_user2;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA s02 FROM sample02_user3;

REVOKE ALL ON ALL SEQUENCES IN SCHEMA s02 FROM sample02_user1;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA s02 FROM sample02_user2;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA s02 FROM sample02_user3;

REVOKE SELECT   ON xls.formats    FROM sample02_user1;
REVOKE SELECT   ON xls.workbooks  FROM sample02_user1;
REVOKE SELECT   ON xls.formats    FROM sample02_user2;
REVOKE SELECT   ON xls.workbooks  FROM sample02_user2;

DROP USER sample02_user1;
DROP USER sample02_user2;
DROP USER sample02_user3;

DROP FUNCTION   IF EXISTS s02.usp_cashbook  (integer, integer, integer);
DROP FUNCTION   IF EXISTS s02.usp_cashbook2 (integer, integer, integer, date, date, boolean);
DROP FUNCTION   IF EXISTS s02.usp_cashbook3 (integer, integer, integer);
DROP FUNCTION   IF EXISTS s02.usp_cashbook4 (integer, integer, integer);
DROP FUNCTION   IF EXISTS s02.usp_cashbook5 (integer, integer, integer);

DROP FUNCTION   IF EXISTS s02.usp_cashbook2_insert (date, integer, integer, integer, double precision, double precision, boolean);
DROP FUNCTION   IF EXISTS s02.usp_cashbook2_update (integer, date, integer, integer, integer, double precision, double precision, boolean);
DROP FUNCTION   IF EXISTS s02.usp_cashbook2_delete (integer);
DROP FUNCTION   IF EXISTS s02.usp_cashbook3_change (varchar, varchar, double precision, date, id integer);
DROP FUNCTION   IF EXISTS s02.usp_cashbook4_merge  (integer, date, integer, integer, integer, double precision, double precision, boolean);

DROP FUNCTION   IF EXISTS s02.xl_details_cash_by_months(character varying, integer, integer, integer, integer);
DROP FUNCTION   IF EXISTS s02.xl_list_account_id(character varying);
DROP FUNCTION   IF EXISTS s02.xl_list_company_id(character varying);
DROP FUNCTION   IF EXISTS s02.xl_list_company_id_for_item_id(integer,character varying);
DROP FUNCTION   IF EXISTS s02.xl_list_company_id_with_item_id(character varying);
DROP FUNCTION   IF EXISTS s02.xl_list_item_id(character varying);

DROP FUNCTION   IF EXISTS s02.usp_cash_by_months(integer, character varying);
DROP FUNCTION   IF EXISTS s02.usp_cash_by_months_change(character varying, double precision, smallint, integer, integer, integer);

DROP VIEW       IF EXISTS s02.view_cashbook;
DROP VIEW       IF EXISTS s02.view_cashbook2;
DROP VIEW       IF EXISTS s02.view_cashbook3;
DROP VIEW       IF EXISTS s02.view_translations;
DROP VIEW       IF EXISTS s02.xl_actions_online_help;

DROP TABLE      IF EXISTS s02.cashbook;
DROP TABLE      IF EXISTS s02.accounts;
DROP TABLE      IF EXISTS s02.item_companies;
DROP TABLE      IF EXISTS s02.companies;
DROP TABLE      IF EXISTS s02.items;

DROP SEQUENCE   IF EXISTS s02.cashbook_id_seq;
DROP SEQUENCE   IF EXISTS s02.accounts_id_seq;
DROP SEQUENCE   IF EXISTS s02.companies_id_seq;
DROP SEQUENCE   IF EXISTS s02.items_id_seq;

DROP SCHEMA     IF EXISTS s02;

-- print Application removed
