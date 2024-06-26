-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.13, April 29, 2024
--
-- Copyright 2015-2024 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT
    t.table_schema as schema
    , t.table_name as name
    , t.table_type as type
FROM
    information_schema.tables t
WHERE
    t.table_schema IN ('s01')
UNION ALL
SELECT
    r.routine_schema as schema
    , r.routine_name as name
    , r.routine_type as type
FROM
    information_schema.routines r
WHERE
    r.routine_schema IN ('s01')
ORDER BY
    type
    , schema
    , name;
