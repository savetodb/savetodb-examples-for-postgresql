-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.8, January 9, 2023
--
-- Copyright 2015-2023 Gartle LLC
--
-- License: MIT
-- =============================================

REVOKE USAGE ON SCHEMA information_schema FROM sample01_user1;

REVOKE USAGE ON SCHEMA s01 FROM sample01_user1;

REVOKE ALL ON ALL TABLES    IN SCHEMA s01 FROM sample01_user1;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA s01 FROM sample01_user1;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA s01 FROM sample01_user1;

DROP USER sample01_user1;

REVOKE USAGE ON SCHEMA s01 FROM sample01_user2;

REVOKE ALL ON ALL TABLES    IN SCHEMA s01 FROM sample01_user2;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA s01 FROM sample01_user2;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA s01 FROM sample01_user2;

DROP USER sample01_user2;

DROP FUNCTION   IF EXISTS s01.usp_cash_by_months(smallint);

DROP FUNCTION   IF EXISTS s01.usp_cash_by_months_change(character varying, double precision, smallint, character varying, character varying, smallint);

DROP FUNCTION   IF EXISTS s01.usp_cashbook(character varying, character varying, character varying);
DROP FUNCTION   IF EXISTS s01.usp_cashbook2(character varying, character varying, character varying);
DROP FUNCTION   IF EXISTS s01.usp_cashbook3(character varying, character varying, character varying);
DROP FUNCTION   IF EXISTS s01.usp_cashbook4(character varying, character varying, character varying);

DROP FUNCTION   IF EXISTS s01.usp_cashbook2_insert (date date, account varchar, company varchar, item varchar, debit double precision, credit double precision);
DROP FUNCTION   IF EXISTS s01.usp_cashbook2_update (id integer, date date, account varchar, company varchar, item varchar, debit double precision, credit double precision);
DROP FUNCTION   IF EXISTS s01.usp_cashbook2_delete (id integer);
DROP FUNCTION   IF EXISTS s01.usp_cashbook3_change (column_name varchar, cell_value varchar, cell_number_value double precision, cell_datetime_value date, id integer);
DROP FUNCTION   IF EXISTS s01.usp_cashbook4_merge  (id integer, date date, account varchar, company varchar, item varchar, debit double precision, credit double precision);

DROP VIEW       IF EXISTS s01.view_cashbook;
DROP VIEW       IF EXISTS s01.xl_actions_online_help;

DROP TABLE      IF EXISTS s01.cashbook;
DROP TABLE      IF EXISTS s01.formats;
DROP TABLE      IF EXISTS s01.workbooks;

DROP SEQUENCE   IF EXISTS s01.cashbook_id_seq;

DROP SCHEMA s01;

-- print Application removed
