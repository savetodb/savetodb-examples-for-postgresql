-- =============================================
-- Application: Sample 13 - Tests
-- Version 10.8, January 9, 2023
--
-- Copyright 2021-2023 Gartle LLC
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
    t.table_schema IN ('s13')
UNION ALL
SELECT
    r.routine_schema as schema
    , r.routine_name as name
    , r.routine_type as type
FROM
    information_schema.routines r
WHERE
    r.routine_schema IN ('s13')
ORDER BY
    type
    , schema
    , name;
