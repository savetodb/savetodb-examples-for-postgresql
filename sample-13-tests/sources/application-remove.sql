-- =============================================
-- Application: Sample 13 - Tests
-- Version 10.13, April 29, 2024
--
-- Copyright 2021-2024 Gartle LLC
--
-- License: MIT
-- =============================================

DO $$
BEGIN
IF (SELECT rolname FROM pg_roles WHERE rolname = 'sample13_user1') IS NOT NULL THEN

    REVOKE USAGE ON SCHEMA information_schema FROM sample13_user1;

    REVOKE USAGE ON SCHEMA s13 FROM sample13_user1;

    REVOKE ALL ON ALL TABLES    IN SCHEMA s13 FROM sample13_user1;
    REVOKE ALL ON ALL FUNCTIONS IN SCHEMA s13 FROM sample13_user1;
    REVOKE ALL ON ALL SEQUENCES IN SCHEMA s13 FROM sample13_user1;

    DROP USER IF EXISTS sample13_user1;
END IF;
END;
$$;

DROP FUNCTION  IF EXISTS s13.usp_datatypes();
DROP PROCEDURE IF EXISTS s13.usp_datatypes_delete(integer);
DROP PROCEDURE IF EXISTS s13.usp_datatypes_insert(bigint, bit, boolean, box, bytea, character, character, cidr, circle, date, double precision, inet, integer, interval, json, jsonb, line, lseg, macaddr, money, money, numeric, numeric, real, path, point, polygon, text, time without time zone, time without time zone, time without time zone, time with time zone, time with time zone, time with time zone, timestamp without time zone, timestamp without time zone, timestamp without time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone, uuid, bit varying, character varying, xml);
DROP PROCEDURE IF EXISTS s13.usp_datatypes_update(integer, bigint, bit, boolean, box, bytea, character, character, cidr, circle, date, double precision, inet, integer, interval, json, jsonb, line, lseg, macaddr, money, money, numeric, numeric, real, path, point, polygon, text, time without time zone, time without time zone, time without time zone, time with time zone, time with time zone, time with time zone, timestamp without time zone, timestamp without time zone, timestamp without time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone, uuid, bit varying, character varying, xml);

DROP FUNCTION  IF EXISTS s13.usp_odbc_datatypes(refcursor);
DROP PROCEDURE IF EXISTS s13.usp_odbc_datatypes_delete(integer);
DROP PROCEDURE IF EXISTS s13.usp_odbc_datatypes_insert(bigint, bit, boolean, box, bytea, character, character, cidr, circle, date, double precision, inet, integer, interval, json, jsonb, line, lseg, macaddr, money, money, numeric, numeric, real, path, point, polygon, text, time without time zone, time without time zone, time without time zone, time with time zone, time with time zone, time with time zone, timestamp without time zone, timestamp without time zone, timestamp without time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone, uuid, bit varying, character varying, xml);
DROP PROCEDURE IF EXISTS s13.usp_odbc_datatypes_update(integer, bigint, bit, boolean, box, bytea, character, character, cidr, circle, date, double precision, inet, integer, interval, json, jsonb, line, lseg, macaddr, money, money, numeric, numeric, real, path, point, polygon, text, time without time zone, time without time zone, time without time zone, time with time zone, time with time zone, time with time zone, timestamp without time zone, timestamp without time zone, timestamp without time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone, uuid, bit varying, character varying, xml);

DROP VIEW IF EXISTS s13.view_datatype_columns;
DROP VIEW IF EXISTS s13.view_datatype_parameters;

DROP TABLE IF EXISTS s13.datatypes;

DROP SEQUENCE IF EXISTS s13.datatypes_id_seq;

DROP FUNCTION IF EXISTS s13.usp_quotes(refcursor);
DROP FUNCTION IF EXISTS s13.usp_quotes_delete(character varying, character varying, character varying, character varying, character varying, character varying);
DROP FUNCTION IF EXISTS s13.usp_quotes_insert(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);
DROP FUNCTION IF EXISTS s13.usp_quotes_update(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

DROP TABLE IF EXISTS s13.quotes;

DROP SCHEMA s13;

-- print Application removed
