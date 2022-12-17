-- =============================================
-- Application: Sample 13 - Tests
-- Version 10.6, December 13, 2022
--
-- Copyright 2021-2022 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE SCHEMA s13;

CREATE TABLE s13.quotes (
      "'" varchar(50) NOT NULL
    , "''" varchar(50) NOT NULL
    , "," varchar(50) NOT NULL
    , "-" varchar(50) NOT NULL
    , "@" varchar(50) NOT NULL
    , "@@" varchar(50) NOT NULL
    , "`" varchar(50) NULL
    , "``" varchar(50) NULL
    , """" varchar(50) NULL
    , """""" varchar(50) NULL
    , "]" varchar(50) NULL
    , "[" varchar(50) NULL
    , "[]" varchar(50) NULL
    , "+" varchar(50) NULL
    , "*" varchar(50) NULL
    , "%" varchar(50) NULL
    , "%%" varchar(50) NULL
    , "=" varchar(50) NULL
    , ";" varchar(50) NULL
    , ":" varchar(50) NULL
    , "<>" varchar(50) NULL
    , "&" varchar(50) NULL
    , "." varchar(50) NULL
    , ".." varchar(50) NULL
    , PRIMARY KEY ("'", "''", ",", "-", "@", "@@")
);

CREATE TABLE s13.datatypes (
    "id" serial NOT NULL
    , "bigint" bigint NULL
    , "bit3" bit(3) NULL
    , "boolean" boolean NULL
    , "box" box NULL
    , "bytea" bytea NULL
    , "char" char(10) NULL
    , "char36" char(36) NULL
    , "cidr" cidr NULL
    , "circle" circle NULL
    , "date" date NULL
    , "double_precision" double precision NULL
    , "inet" inet NULL
    , "integer" integer NULL
    , "interval" interval NULL
    , "json" json NULL
    , "jsonb" jsonb NULL
    , "line" line NULL
    , "lseg" lseg NULL
    , "macaddr" macaddr NULL
    , "money" money NULL
    , "money15" money NULL
    , "numeric" numeric NULL
    , "numeric152" numeric(15,2) NULL
    , "real" real NULL
    , "path" path NULL
    , "point" point NULL
    , "polygon" polygon NULL
    , "text" text NULL
    , "time" time NULL
    , "time0" time(0) NULL
    , "time3" time(3) NULL
    , "timetz" time with time zone NULL
    , "timetz0" time(0) with time zone NULL
    , "timetz3" time(3) with time zone NULL
    , "timestamp" timestamp NULL
    , "timestamp0" timestamp(0) NULL
    , "timestamp3" timestamp(3) NULL
    , "timestamptz" timestamp with time zone NULL
    , "timestamptz0" timestamp(0) with time zone NULL
    , "timestamptz3" timestamp(3) with time zone NULL
    , "uuid" uuid NULL
    , "varbit" varbit(8) NULL
    , "varchar" varchar(255) NULL
    , "xml" xml NULL
    , PRIMARY KEY (id)
);

CREATE OR REPLACE VIEW s13.view_datatype_columns
AS
SELECT
    c.table_schema
    , c.table_name
    , c.column_name
    , c.ordinal_position
    , CASE WHEN kcu1.column_name IS NOT NULL THEN 'YES' ELSE 'NO' END as is_primary_key
    , c.is_nullable
    , CASE WHEN substring(c.column_default, 1, 7) = 'nextval' THEN 'YES' ELSE 'NO' END AS is_identity
    , null as is_computed
    , c.column_default
    , c.data_type
    , c.character_maximum_length AS max_length
    , COALESCE(c.numeric_precision, c.datetime_precision) AS precision
    , c.numeric_scale AS scale
FROM
    information_schema.columns c
    LEFT OUTER JOIN information_schema.table_constraints tc1 ON tc1.table_schema = c.table_schema AND tc1.table_name = c.table_name AND tc1.constraint_type = 'PRIMARY KEY'
    LEFT OUTER JOIN information_schema.key_column_usage kcu1 ON kcu1.table_schema = tc1.table_schema AND kcu1.table_name = tc1.table_name AND kcu1.constraint_name = tc1.constraint_name AND kcu1.column_name = c.column_name
WHERE
    c.table_schema NOT IN ('pg_catalog')
    AND c.table_schema = 's13' AND c.table_name = 'datatypes';

CREATE OR REPLACE VIEW s13.view_datatype_parameters
AS
SELECT
    r.routine_schema
    , r.routine_name
    , p.ordinal_position
    , p.parameter_mode
    , p.parameter_name
    , p.data_type
    , p.character_maximum_length AS max_length
    , p.numeric_precision AS precision
    , p.numeric_scale AS scale
FROM
    information_schema.parameters p
    INNER JOIN information_schema.routines r ON r.specific_schema = p.specific_schema AND r.specific_name = p.specific_name
WHERE
    NOT p.specific_schema IN ('information_schema', 'pg_catalog')
    AND p.specific_schema = 's13'
    AND p.specific_name LIKE 'usp_datatypes%';

CREATE OR REPLACE FUNCTION s13.usp_quotes (
    ref refcursor
    )
    RETURNS refcursor
    LANGUAGE plpgsql
AS $$
BEGIN

OPEN ref FOR
SELECT
      t."'"
    , t."''"
    , t.","
    , t."-"
    , t."@"
    , t."@@"
    , t."`"
    , t."``"
    , t.""""
    , t.""""""
    , t."]"
    , t."["
    , t."[]"
    , t."+"
    , t."*"
    , t."%"
    , t."%%"
    , t."="
    , t.";"
    , t.":"
    , t."<>"
    , t."&"
    , t."."
    , t.".."
FROM
    s13.quotes t;

RETURN ref;
END
$$;

CREATE OR REPLACE FUNCTION s13.usp_quotes_delete (
    _x0027_ varchar(50)
    , _x0027__x0027_ varchar(50)
    , _x002C_ varchar(50)
    , _x002D_ varchar(50)
    , _x0040_ varchar(50)
    , _x0040__x0040_ varchar(50)
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

DELETE FROM s13.quotes
WHERE
    "'" = _x0027_
    AND "''" = _x0027__x0027_
    AND "," = _x002C_
    AND "-" = _x002D_
    AND "@" = _x0040_
    AND "@@" = _x0040__x0040_;

END
$$;

CREATE OR REPLACE FUNCTION s13.usp_quotes_insert (
    _x0027_ varchar(50)
    , _x0027__x0027_ varchar(50)
    , _x002C_ varchar(50)
    , _x002D_ varchar(50)
    , _x0040_ varchar(50)
    , _x0040__x0040_ varchar(50)
    , _x0060_ varchar(50)
    , _x0060__x0060_ varchar(50)
    , _x0022_ varchar(50)
    , _x0022__x0022_ varchar(50)
    , _x005D_ varchar(50)
    , _x005B_ varchar(50)
    , _x005B__x005D_ varchar(50)
    , _x002B_ varchar(50)
    , _x002A_ varchar(50)
    , _x0025_ varchar(50)
    , _x0025__x0025_ varchar(50)
    , _x003D_ varchar(50)
    , _x003B_ varchar(50)
    , _x003A_ varchar(50)
    , _x003C__x003E_ varchar(50)
    , _x0026_ varchar(50)
    , _x002E_ varchar(50)
    , _x002E__x002E_ varchar(50)
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

INSERT INTO s13.quotes
    ( "'"
    , "''"
    , ","
    , "-"
    , "@"
    , "@@"
    , "`"
    , "``"
    , """"
    , """"""
    , "]"
    , "["
    , "[]"
    , "+"
    , "*"
    , "%"
    , "%%"
    , "="
    , ";"
    , ":"
    , "<>"
    , "&"
    , "."
    , ".."
    )
VALUES
    ( _x0027_
    , _x0027__x0027_
    , _x002C_
    , _x002D_
    , _x0040_
    , _x0040__x0040_
    , _x0060_
    , _x0060__x0060_
    , _x0022_
    , _x0022__x0022_
    , _x005D_
    , _x005B_
    , _x005B__x005D_
    , _x002B_
    , _x002A_
    , _x0025_
    , _x0025__x0025_
    , _x003D_
    , _x003B_
    , _x003A_
    , _x003C__x003E_
    , _x0026_
    , _x002E_
    , _x002E__x002E_
    );

END
$$;

CREATE OR REPLACE FUNCTION s13.usp_quotes_update (
    _x0027_ varchar(50)
    , _x0027__x0027_ varchar(50)
    , _x002C_ varchar(50)
    , _x002D_ varchar(50)
    , _x0040_ varchar(50)
    , _x0040__x0040_ varchar(50)
    , _x0060_ varchar(50)
    , _x0060__x0060_ varchar(50)
    , _x0022_ varchar(50)
    , _x0022__x0022_ varchar(50)
    , _x005D_ varchar(50)
    , _x005B_ varchar(50)
    , _x005B__x005D_ varchar(50)
    , _x002B_ varchar(50)
    , _x002A_ varchar(50)
    , _x0025_ varchar(50)
    , _x0025__x0025_ varchar(50)
    , _x003D_ varchar(50)
    , _x003B_ varchar(50)
    , _x003A_ varchar(50)
    , _x003C__x003E_ varchar(50)
    , _x0026_ varchar(50)
    , _x002E_ varchar(50)
    , _x002E__x002E_ varchar(50)
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

UPDATE s13.quotes
SET
    "`" = _x0060_
    , "``" = _x0060__x0060_
    , """" = _x0022_
    , """""" = _x0022__x0022_
    , "]" = _x005D_
    , "[" = _x005B_
    , "[]" = _x005B__x005D_
    , "+" = _x002B_
    , "*" = _x002A_
    , "%" = _x0025_
    , "%%" = _x0025__x0025_
    , "=" = _x003D_
    , ";" = _x003B_
    , ":" = _x003A_
    , "<>" = _x003C__x003E_
    , "&" = _x0026_
    , "." = _x002E_
    , ".." = _x002E__x002E_
WHERE
    "'" = _x0027_
    AND "''" = _x0027__x0027_
    AND "," = _x002C_
    AND "-" = _x002D_
    AND "@" = _x0040_
    AND "@@" = _x0040__x0040_;

END
$$;

CREATE OR REPLACE FUNCTION s13.usp_datatypes (
    )
    RETURNS table (
    "id" integer
    , "bigint" bigint
    , "bit3" bit(3)
    , "boolean" boolean
    , "box" box
    , "bytea" bytea
    , "char" char(10)
    , "char36" char(36)
    , "cidr" cidr
    , "circle" circle
    , "date" date
    , "double_precision" double precision
    , "inet" inet
    , "integer" integer
    , "interval" interval
    , "json" json
    , "jsonb" jsonb
    , "line" line
    , "lseg" lseg
    , "macaddr" macaddr
    , "money" money
    , "money15" money
    , "numeric" numeric
    , "numeric152" numeric(15,2)
    , "real" real
    , "path" path
    , "point" point
    , "polygon" polygon
    , "text" text
    , "time" time
    , "time0" time(0)
    , "time3" time(3)
    , "timetz" time with time zone
    , "timetz0" time(0) with time zone
    , "timetz3" time(3) with time zone
    , "timestamp" timestamp
    , "timestamp0" timestamp(0)
    , "timestamp3" timestamp(3)
    , "timestamptz" timestamp with time zone
    , "timestamptz0" timestamp(0) with time zone
    , "timestamptz3" timestamp(3) with time zone
    , "uuid" uuid
    , "varbit" varbit(8)
    , "varchar" varchar(255)
    , "xml" xml
    )
    LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT
    t."id"
    , t."bigint"
    , t."bit3"
    , t."boolean"
    , t."box"
    , t."bytea"
    , t."char"
    , t."char36"
    , t."cidr"
    , t."circle"
    , t."date"
    , t."double_precision"
    , t."inet"
    , t."integer"
    , t."interval"
    , t."json"
    , t."jsonb"
    , t."line"
    , t."lseg"
    , t."macaddr"
    , t."money"
    , t."money15"
    , t."numeric"
    , t."numeric152"
    , t."real"
    , t."path"
    , t."point"
    , t."polygon"
    , t."text"
    , t."time"
    , t."time0"
    , t."time3"
    , t."timetz"
    , t."timetz0"
    , t."timetz3"
    , t."timestamp"
    , t."timestamp0"
    , t."timestamp3"
    , t."timestamptz"
    , t."timestamptz0"
    , t."timestamptz3"
    , t."uuid"
    , t."varbit"
    , t."varchar"
    , t."xml"
FROM
    s13.datatypes t;

END
$$;

CREATE OR REPLACE PROCEDURE s13.usp_datatypes_delete (
    id integer
    )
    LANGUAGE plpgsql
AS $$
DECLARE
    p_id ALIAS FOR id;
BEGIN
DELETE FROM s13.datatypes t
WHERE
    t.id = p_id;

END
$$;

CREATE OR REPLACE PROCEDURE s13.usp_datatypes_insert (
    "bigint" bigint
    , "bit3" bit(3)
    , "boolean" boolean
    , "box" box
    , "bytea" bytea
    , "char" char(10)
    , "char36" char(36)
    , "cidr" cidr
    , "circle" circle
    , "date" date
    , "double_precision" double precision
    , "inet" inet
    , "integer" integer
    , "interval" interval
    , "json" json
    , "jsonb" jsonb
    , "line" line
    , "lseg" lseg
    , "macaddr" macaddr
    , "money" money
    , "money15" money
    , "numeric" numeric
    , "numeric152" numeric(15,2)
    , "real" real
    , "path" path
    , "point" point
    , "polygon" polygon
    , "text" text
    , "time" time
    , "time0" time(0)
    , "time3" time(3)
    , "timetz" time with time zone
    , "timetz0" time(0) with time zone
    , "timetz3" time(3) with time zone
    , "timestamp" timestamp
    , "timestamp0" timestamp(0)
    , "timestamp3" timestamp(3)
    , "timestamptz" timestamp with time zone
    , "timestamptz0" timestamp(0) with time zone
    , "timestamptz3" timestamp(3) with time zone
    , "uuid" uuid
    , "varbit" varbit(8)
    , "varchar" varchar(255)
    , "xml" xml
    )
    LANGUAGE plpgsql
AS $$
BEGIN

INSERT INTO s13.datatypes
    ( "bigint"
    , "bit3"
    , "boolean"
    , "box"
    , "bytea"
    , "char"
    , "char36"
    , "cidr"
    , "circle"
    , "date"
    , "double_precision"
    , "inet"
    , "integer"
    , "interval"
    , "json"
    , "jsonb"
    , "line"
    , "lseg"
    , "macaddr"
    , "money"
    , "money15"
    , "numeric"
    , "numeric152"
    , "real"
    , "path"
    , "point"
    , "polygon"
    , "text"
    , "time"
    , "time0"
    , "time3"
    , "timetz"
    , "timetz0"
    , "timetz3"
    , "timestamp"
    , "timestamp0"
    , "timestamp3"
    , "timestamptz"
    , "timestamptz0"
    , "timestamptz3"
    , "uuid"
    , "varbit"
    , "varchar"
    , "xml"
    )
VALUES
    ( "bigint"
    , "bit3"
    , "boolean"
    , "box"
    , "bytea"
    , "char"
    , "char36"
    , "cidr"
    , "circle"
    , "date"
    , "double_precision"
    , "inet"
    , "integer"
    , "interval"
    , "json"
    , "jsonb"
    , "line"
    , "lseg"
    , "macaddr"
    , "money"
    , "money15"
    , "numeric"
    , "numeric152"
    , "real"
    , "path"
    , "point"
    , "polygon"
    , "text"
    , "time"
    , "time0"
    , "time3"
    , "timetz"
    , "timetz0"
    , "timetz3"
    , "timestamp"
    , "timestamp0"
    , "timestamp3"
    , "timestamptz"
    , "timestamptz0"
    , "timestamptz3"
    , "uuid"
    , "varbit"
    , "varchar"
    , "xml"
    );

END
$$;

CREATE OR REPLACE PROCEDURE s13.usp_datatypes_update (
    id integer
    , "bigint" bigint
    , "bit3" bit(3)
    , "boolean" boolean
    , "box" box
    , "bytea" bytea
    , "char" char(10)
    , "char36" char(36)
    , "cidr" cidr
    , "circle" circle
    , "date" date
    , "double_precision" double precision
    , "inet" inet
    , "integer" integer
    , "interval" interval
    , "json" json
    , "jsonb" jsonb
    , "line" line
    , "lseg" lseg
    , "macaddr" macaddr
    , "money" money
    , "money15" money
    , "numeric" numeric
    , "numeric152" numeric(15,2)
    , "real" real
    , "path" path
    , "point" point
    , "polygon" polygon
    , "text" text
    , "time" time
    , "time0" time(0)
    , "time3" time(3)
    , "timetz" time with time zone
    , "timetz0" time(0) with time zone
    , "timetz3" time(3) with time zone
    , "timestamp" timestamp
    , "timestamp0" timestamp(0)
    , "timestamp3" timestamp(3)
    , "timestamptz" timestamp with time zone
    , "timestamptz0" timestamp(0) with time zone
    , "timestamptz3" timestamp(3) with time zone
    , "uuid" uuid
    , "varbit" varbit(8)
    , "varchar" varchar(255)
    , "xml" xml
    )
    LANGUAGE plpgsql
AS $$
DECLARE
    p_id ALIAS FOR id;
    p_bigint ALIAS FOR "bigint";
    p_bit3 ALIAS FOR "bit3";
    p_boolean ALIAS FOR "boolean";
    p_box ALIAS FOR "box";
    p_bytea ALIAS FOR "bytea";
    p_char ALIAS FOR "char";
    p_char36 ALIAS FOR "char36";
    p_cidr ALIAS FOR "cidr";
    p_circle ALIAS FOR "circle";
    p_date ALIAS FOR "date";
    p_double_precision ALIAS FOR "double_precision";
    p_inet ALIAS FOR "inet";
    p_integer ALIAS FOR "integer";
    p_interval ALIAS FOR "interval";
    p_json ALIAS FOR "json";
    p_jsonb ALIAS FOR "jsonb";
    p_line ALIAS FOR "line";
    p_lseg ALIAS FOR "lseg";
    p_macaddr ALIAS FOR "macaddr";
    p_money ALIAS FOR "money";
    p_money15 ALIAS FOR "money15";
    p_numeric ALIAS FOR "numeric";
    p_numeric152 ALIAS FOR "numeric152";
    p_real ALIAS FOR "real";
    p_path ALIAS FOR "path";
    p_point ALIAS FOR "point";
    p_polygon ALIAS FOR "polygon";
    p_text ALIAS FOR "text";
    p_time ALIAS FOR "time";
    p_time0 ALIAS FOR "time0";
    p_time3 ALIAS FOR "time3";
    p_timetz ALIAS FOR "timetz";
    p_timetz0 ALIAS FOR "timetz0";
    p_timetz3 ALIAS FOR "timetz3";
    p_timestamp ALIAS FOR "timestamp";
    p_timestamp0 ALIAS FOR "timestamp0";
    p_timestamp3 ALIAS FOR "timestamp3";
    p_timestamptz ALIAS FOR "timestamptz";
    p_timestamptz0 ALIAS FOR "timestamptz0";
    p_timestamptz3 ALIAS FOR "timestamptz3";
    p_uuid ALIAS FOR "uuid";
    p_varbit ALIAS FOR "varbit";
    p_varchar ALIAS FOR "varchar";
    p_xml ALIAS FOR "xml";
BEGIN

UPDATE s13.datatypes t
SET
    "bigint" = p_bigint
    , "bit3" = p_bit3
    , "boolean" = p_boolean
    , "box" = p_box
    , "bytea" = p_bytea
    , "char" = p_char
    , "char36" = p_char36
    , "cidr" = p_cidr
    , "circle" = p_circle
    , "date" = p_date
    , "double_precision" = p_double_precision
    , "inet" = p_inet
    , "integer" = p_integer
    , "interval" = p_interval
    , "json" = p_json
    , "jsonb" = p_jsonb
    , "line" = p_line
    , "lseg" = p_lseg
    , "macaddr" = p_macaddr
    , "money" = p_money
    , "money15" = p_money15
    , "numeric" = p_numeric
    , "numeric152" = p_numeric152
    , "real" = p_real
    , "path" = p_path
    , "point" = p_point
    , "polygon" = p_polygon
    , "text" = p_text
    , "time" = p_time
    , "time0" = p_time0
    , "time3" = p_time3
    , "timetz" = p_timetz
    , "timetz0" = p_timetz0
    , "timetz3" = p_timetz3
    , "timestamp" = p_timestamp
    , "timestamp0" = p_timestamp0
    , "timestamp3" = p_timestamp3
    , "timestamptz" = p_timestamptz
    , "timestamptz0" = p_timestamptz0
    , "timestamptz3" = p_timestamptz3
    , "uuid" = p_uuid
    , "varbit" = p_varbit
    , "varchar" = p_varchar
    , "xml" = p_xml
WHERE
    t.id = p_id;

END
$$;

CREATE OR REPLACE FUNCTION s13.usp_odbc_datatypes (
    ref refcursor
    )
    RETURNS refcursor
    LANGUAGE plpgsql
AS $$
BEGIN

OPEN ref FOR
SELECT
    t."id",
    t."bigint",
    CAST(t."bit3" AS char(3)) AS "bit3",
    t."boolean",
    CAST(t."box" AS varchar) AS "box",
    t."bytea",
    t."char",
    t."char36",
    CAST(t."cidr" AS varchar) AS "cidr",
    CAST(t."circle" AS varchar) AS "circle",
    t."date",
    t."double_precision",
    CAST(t."inet" AS varchar) AS "inet",
    t."integer",
    CAST(t."interval" AS varchar) AS "interval",
    CAST(t."json" AS varchar) AS "json",
    CAST(t."jsonb" AS varchar) AS "jsonb",
    CAST(t."line" AS varchar) AS "line",
    CAST(t."lseg" AS varchar) AS "lseg",
    CAST(t."macaddr" AS varchar) AS "macaddr",
    CAST(t."money" AS numeric(31,2)) AS "money",
    CAST(t."money15" AS numeric(31,2)) AS "money15",
    t."numeric",
    t."numeric152",
    t."real",
    CAST(t."path" AS varchar) AS "path",
    CAST(t."point" AS varchar) AS "point",
    CAST(t."polygon" AS varchar) AS "polygon",
    t."text",
    CAST(t."time" AS varchar) AS "time",
    t."time0",
    CAST(t."time3" AS varchar) AS "time3",
    CAST(t."timetz" AS varchar) AS "timetz",
    CAST(t."timetz0" AS varchar) AS "timetz0",
    CAST(t."timetz3" AS varchar) AS "timetz3",
    CAST(t."timestamp" AS varchar) AS "timestamp",
    CAST(t."timestamp0" AS varchar) AS "timestamp0",
    CAST(t."timestamp3" AS varchar) AS "timestamp3",
    TO_CHAR(t."timestamptz", 'YYYY-MM-DD HH24:MI:SS.FF6 TZH:TZM') AS "timestamptz",
    TO_CHAR(t."timestamptz0", 'YYYY-MM-DD HH24:MI:SS TZH:TZM') AS "timestamptz0",
    TO_CHAR(t."timestamptz3", 'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM') AS "timestamptz3",
    t."uuid",
    CAST(t."varbit" AS varchar) AS "varbit",
    t."varchar",
    t."xml"
FROM
    s13.datatypes t;

RETURN ref;
END
$$;

CREATE OR REPLACE PROCEDURE s13.usp_odbc_datatypes_delete (
    id integer
    )
    LANGUAGE plpgsql
AS $$
DECLARE
    p_id ALIAS FOR id;
BEGIN
DELETE FROM s13.datatypes t
WHERE
    t.id = p_id;

END
$$;

CREATE OR REPLACE PROCEDURE s13.usp_odbc_datatypes_insert (
    "bigint" bigint
    , "bit3" bit(3)
    , "boolean" boolean
    , "box" box
    , "bytea" bytea
    , "char" char(10)
    , "char36" char(36)
    , "cidr" cidr
    , "circle" circle
    , "date" date
    , "double_precision" double precision
    , "inet" inet
    , "integer" integer
    , "interval" interval
    , "json" json
    , "jsonb" jsonb
    , "line" line
    , "lseg" lseg
    , "macaddr" macaddr
    , "money" money
    , "money15" money
    , "numeric" numeric
    , "numeric152" numeric(15,2)
    , "real" real
    , "path" path
    , "point" point
    , "polygon" polygon
    , "text" text
    , "time" time
    , "time0" time(0)
    , "time3" time(3)
    , "timetz" time with time zone
    , "timetz0" time(0) with time zone
    , "timetz3" time(3) with time zone
    , "timestamp" timestamp
    , "timestamp0" timestamp(0)
    , "timestamp3" timestamp(3)
    , "timestamptz" timestamp with time zone
    , "timestamptz0" timestamp(0) with time zone
    , "timestamptz3" timestamp(3) with time zone
    , "uuid" uuid
    , "varbit" varbit(8)
    , "varchar" varchar(255)
    , "xml" xml
    )
    LANGUAGE plpgsql
AS $$
BEGIN

INSERT INTO s13.datatypes
    ( "bigint"
    , "bit3"
    , "boolean"
    , "box"
    , "bytea"
    , "char"
    , "char36"
    , "cidr"
    , "circle"
    , "date"
    , "double_precision"
    , "inet"
    , "integer"
    , "interval"
    , "json"
    , "jsonb"
    , "line"
    , "lseg"
    , "macaddr"
    , "money"
    , "money15"
    , "numeric"
    , "numeric152"
    , "real"
    , "path"
    , "point"
    , "polygon"
    , "text"
    , "time"
    , "time0"
    , "time3"
    , "timetz"
    , "timetz0"
    , "timetz3"
    , "timestamp"
    , "timestamp0"
    , "timestamp3"
    , "timestamptz"
    , "timestamptz0"
    , "timestamptz3"
    , "uuid"
    , "varbit"
    , "varchar"
    , "xml"
    )
VALUES
    ( "bigint"
    , "bit3"
    , "boolean"
    , "box"
    , "bytea"
    , "char"
    , "char36"
    , "cidr"
    , "circle"
    , "date"
    , "double_precision"
    , "inet"
    , "integer"
    , "interval"
    , "json"
    , "jsonb"
    , "line"
    , "lseg"
    , "macaddr"
    , "money"
    , "money15"
    , "numeric"
    , "numeric152"
    , "real"
    , "path"
    , "point"
    , "polygon"
    , "text"
    , "time"
    , "time0"
    , "time3"
    , "timetz"
    , "timetz0"
    , "timetz3"
    , "timestamp"
    , "timestamp0"
    , "timestamp3"
    , "timestamptz"
    , "timestamptz0"
    , "timestamptz3"
    , "uuid"
    , "varbit"
    , "varchar"
    , "xml"
    );

END
$$;

CREATE OR REPLACE PROCEDURE s13.usp_odbc_datatypes_update (
    id integer
    , "bigint" bigint
    , "bit3" bit(3)
    , "boolean" boolean
    , "box" box
    , "bytea" bytea
    , "char" char(10)
    , "char36" char(36)
    , "cidr" cidr
    , "circle" circle
    , "date" date
    , "double_precision" double precision
    , "inet" inet
    , "integer" integer
    , "interval" interval
    , "json" json
    , "jsonb" jsonb
    , "line" line
    , "lseg" lseg
    , "macaddr" macaddr
    , "money" money
    , "money15" money
    , "numeric" numeric
    , "numeric152" numeric(15,2)
    , "real" real
    , "path" path
    , "point" point
    , "polygon" polygon
    , "text" text
    , "time" time
    , "time0" time(0)
    , "time3" time(3)
    , "timetz" time with time zone
    , "timetz0" time(0) with time zone
    , "timetz3" time(3) with time zone
    , "timestamp" timestamp
    , "timestamp0" timestamp(0)
    , "timestamp3" timestamp(3)
    , "timestamptz" timestamp with time zone
    , "timestamptz0" timestamp(0) with time zone
    , "timestamptz3" timestamp(3) with time zone
    , "uuid" uuid
    , "varbit" varbit(8)
    , "varchar" varchar(255)
    , "xml" xml
    )
    LANGUAGE plpgsql
AS $$
DECLARE
    p_id ALIAS FOR id;
    p_bigint ALIAS FOR "bigint";
    p_bit3 ALIAS FOR "bit3";
    p_boolean ALIAS FOR "boolean";
    p_box ALIAS FOR "box";
    p_bytea ALIAS FOR "bytea";
    p_char ALIAS FOR "char";
    p_char36 ALIAS FOR "char36";
    p_cidr ALIAS FOR "cidr";
    p_circle ALIAS FOR "circle";
    p_date ALIAS FOR "date";
    p_double_precision ALIAS FOR "double_precision";
    p_inet ALIAS FOR "inet";
    p_integer ALIAS FOR "integer";
    p_interval ALIAS FOR "interval";
    p_json ALIAS FOR "json";
    p_jsonb ALIAS FOR "jsonb";
    p_line ALIAS FOR "line";
    p_lseg ALIAS FOR "lseg";
    p_macaddr ALIAS FOR "macaddr";
    p_money ALIAS FOR "money";
    p_money15 ALIAS FOR "money15";
    p_numeric ALIAS FOR "numeric";
    p_numeric152 ALIAS FOR "numeric152";
    p_real ALIAS FOR "real";
    p_path ALIAS FOR "path";
    p_point ALIAS FOR "point";
    p_polygon ALIAS FOR "polygon";
    p_text ALIAS FOR "text";
    p_time ALIAS FOR "time";
    p_time0 ALIAS FOR "time0";
    p_time3 ALIAS FOR "time3";
    p_timetz ALIAS FOR "timetz";
    p_timetz0 ALIAS FOR "timetz0";
    p_timetz3 ALIAS FOR "timetz3";
    p_timestamp ALIAS FOR "timestamp";
    p_timestamp0 ALIAS FOR "timestamp0";
    p_timestamp3 ALIAS FOR "timestamp3";
    p_timestamptz ALIAS FOR "timestamptz";
    p_timestamptz0 ALIAS FOR "timestamptz0";
    p_timestamptz3 ALIAS FOR "timestamptz3";
    p_uuid ALIAS FOR "uuid";
    p_varbit ALIAS FOR "varbit";
    p_varchar ALIAS FOR "varchar";
    p_xml ALIAS FOR "xml";
BEGIN

UPDATE s13.datatypes t
SET
    "bigint" = p_bigint
    , "bit3" = p_bit3
    , "boolean" = p_boolean
    , "box" = p_box
    , "bytea" = p_bytea
    , "char" = p_char
    , "char36" = p_char36
    , "cidr" = p_cidr
    , "circle" = p_circle
    , "date" = p_date
    , "double_precision" = p_double_precision
    , "inet" = p_inet
    , "integer" = p_integer
    , "interval" = p_interval
    , "json" = p_json
    , "jsonb" = p_jsonb
    , "line" = p_line
    , "lseg" = p_lseg
    , "macaddr" = p_macaddr
    , "money" = p_money
    , "money15" = p_money15
    , "numeric" = p_numeric
    , "numeric152" = p_numeric152
    , "real" = p_real
    , "path" = p_path
    , "point" = p_point
    , "polygon" = p_polygon
    , "text" = p_text
    , "time" = p_time
    , "time0" = p_time0
    , "time3" = p_time3
    , "timetz" = p_timetz
    , "timetz0" = p_timetz0
    , "timetz3" = p_timetz3
    , "timestamp" = p_timestamp
    , "timestamp0" = p_timestamp0
    , "timestamp3" = p_timestamp3
    , "timestamptz" = p_timestamptz
    , "timestamptz0" = p_timestamptz0
    , "timestamptz3" = p_timestamptz3
    , "uuid" = p_uuid
    , "varbit" = p_varbit
    , "varchar" = p_varchar
    , "xml" = p_xml
WHERE
    t.id = p_id;

END
$$;

INSERT INTO "s13"."datatypes" ("bigint", "bit3", "boolean", "box", "bytea", "char", "char36", "cidr", "circle", "date", "double_precision", "inet", "integer", "interval", "json", "jsonb", "line", "lseg", "macaddr", "money", "money15", "numeric", "numeric152", "real", "path", "point", "polygon", "text", "time", "time0", "time3", "timetz", "timetz0", "timetz3", "timestamp", "timestamp0", "timestamp3", "timestamptz", "timestamptz0", "timestamptz3", "uuid", "varbit", "varchar", "xml") VALUES (123456789012345, '101', '1', '(1,1),(0,0)', '\x0A0B0C', 'char      ', '00010203-0405-0607-0809-0a0b0c0d0e0f', '192.168.100.128/32', '<(0,0),2>', '2021-12-10', 123456789012.12, '192.168.100.128', 1234567890, '3 days', '[1,2,3]', '[1, 2, 3]', '{0,-1,0}', '[(-1,0),(1,0)]', '08:00:2b:01:02:03', 12345678901234567.12, 1234567890123.12, 12345678901234567.12, 1234567890123.12, 1234567, '((0,0),(1,1),(2,0))', '(0,0)', '((0,0),(1,1),(2,0))', 'text', '15:20:10.123456', '15:20:10', '15:20:10.123', '15:20:10.123456 +03:00', '15:20:10 +03:00', '15:20:10.123 +03:00', '2021-12-10 15:20:10.123456', '2021-12-10 15:20:10', '2021-12-10 15:20:10.123', '2021-12-10 12:20:10.123456 +00:00', '2021-12-10 12:20:10 +00:00', '2021-12-10 12:20:10.123 +00:00', '00010203-0405-0607-0809-0a0b0c0d0e0f', '101', 'varchar', '<xml />');
INSERT INTO "s13"."datatypes" ("bigint", "bit3", "boolean", "box", "bytea", "char", "char36", "cidr", "circle", "date", "double_precision", "inet", "integer", "interval", "json", "jsonb", "line", "lseg", "macaddr", "money", "money15", "numeric", "numeric152", "real", "path", "point", "polygon", "text", "time", "time0", "time3", "timetz", "timetz0", "timetz3", "timestamp", "timestamp0", "timestamp3", "timestamptz", "timestamptz0", "timestamptz3", "uuid", "varbit", "varchar", "xml") VALUES (123456789012345, '101', '1', '(1,1),(0,0)', '\x0A0B0C', 'char      ', '00010203-0405-0607-0809-0a0b0c0d0e0f', '192.168.100.128/32', '<(0,0),2>', '2021-12-10', 123456789012.12, '192.168.100.128', 1234567890, '3 days', '[1,2,3]', '[1, 2, 3]', '{0,-1,0}', '[(-1,0),(1,0)]', '08:00:2b:01:02:03', 12345678901234567.12, 1234567890123.12, 12345678901234567.12, 1234567890123.12, 1234567, '((0,0),(1,1),(2,0))', '(0,0)', '((0,0),(1,1),(2,0))', 'text', '15:20:10.123456', '15:20:10', '15:20:10.123', '15:20:10.123456 +03:00', '15:20:10 +03:00', '15:20:10.123 +03:00', '2021-12-10 15:20:10.123456', '2021-12-10 15:20:10', '2021-12-10 15:20:10.123', '2021-12-10 12:20:10.123456 +00:00', '2021-12-10 12:20:10 +00:00', '2021-12-10 12:20:10.123 +00:00', '00010203-0405-0607-0809-0a0b0c0d0e0f', '101', 'varchar', '<xml />');
INSERT INTO "s13"."datatypes" ("bigint", "bit3", "boolean", "box", "bytea", "char", "char36", "cidr", "circle", "date", "double_precision", "inet", "integer", "interval", "json", "jsonb", "line", "lseg", "macaddr", "money", "money15", "numeric", "numeric152", "real", "path", "point", "polygon", "text", "time", "time0", "time3", "timetz", "timetz0", "timetz3", "timestamp", "timestamp0", "timestamp3", "timestamptz", "timestamptz0", "timestamptz3", "uuid", "varbit", "varchar", "xml") VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO s13.quotes ("'", "''", ",", "-", "@", "@@", "`", "``", """", """""", "]", "[", "[]", "+", "*", "%", "%%", "=", ";", ":", "<>", "&", ".", "..") VALUES ('1', '2', '3', '4', '5', '6', '`', '``', '"', '""', ']', '[', '[]', '+', '*', '%', '%%', '=', ';', ':', '<>', '&', '.', '..');
INSERT INTO s13.quotes ("'", "''", ",", "-", "@", "@@", "`", "``", """", """""", "]", "[", "[]", "+", "*", "%", "%%", "=", ";", ":", "<>", "&", ".", "..") VALUES ('''', '''''', ',', '-', '@', '@@', '`', '``', '"', '""', ']', '[', '[]', '+', '*', '%', '%%', '=', ';', ':', '<>', '&', '.', '..');

-- print Application installed
