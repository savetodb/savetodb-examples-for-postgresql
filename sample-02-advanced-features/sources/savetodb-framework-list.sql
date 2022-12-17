-- =============================================
-- SaveToDB Framework for PostgreSQL
-- Version 10.6, December 13, 2022
--
-- Copyright 2015-2022 Gartle LLC
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
    t.table_schema in ('xls')
UNION ALL
SELECT
    r.routine_schema as schema
    , r.routine_name as name
    , r.routine_type as type
FROM
    information_schema.routines r
WHERE
    r.routine_schema in ('xls')
ORDER BY
    type
    , schema
    , name
