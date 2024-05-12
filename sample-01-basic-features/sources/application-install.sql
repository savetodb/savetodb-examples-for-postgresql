-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.13, April 29, 2024
--
-- Copyright 2015-2024 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE SCHEMA s01;

CREATE TABLE s01.cashbook (
    id serial NOT NULL,
    date date DEFAULT NULL,
    account varchar(50) DEFAULT NULL,
    item varchar(50) DEFAULT NULL,
    company varchar(50) DEFAULT NULL,
    debit double precision DEFAULT NULL,
    credit double precision DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE s01.formats (
    id serial NOT NULL,
    table_schema varchar(63) NOT NULL,
    table_name varchar(63) NOT NULL,
    table_excel_format_xml text,
    PRIMARY KEY (id)
);

CREATE UNIQUE INDEX ix_formats ON s01.formats USING BTREE (table_schema, table_name);

CREATE TABLE s01.workbooks (
    id serial NOT NULL,
    name varchar(128) NOT NULL,
    template varchar(255),
    definition text NOT NULL,
    table_schema varchar(63),
    PRIMARY KEY (id)
);

CREATE UNIQUE INDEX ix_workbooks ON s01.workbooks USING BTREE (name);

CREATE OR REPLACE VIEW s01.view_cashbook
AS

SELECT
    *
FROM
    s01.cashbook p;


CREATE VIEW s01.xl_actions_online_help
AS
SELECT
    t.TABLE_SCHEMA
    , t.TABLE_NAME
    , CAST(NULL AS VARCHAR) COLUMN_NAME
    , 'Actions' AS EVENT_NAME
    , t.TABLE_SCHEMA AS HANDLER_SCHEMA
    , 'See Online Help' AS HANDLER_NAME
    , 'HTTP' AS HANDLER_TYPE
    , CONCAT('https://www.savetodb.com/samples/sample', SUBSTRING(t.TABLE_SCHEMA, 2, 2), '-', t.TABLE_NAME, CASE WHEN USER LIKE 'sample%' THEN '_' || USER ELSE '' END) AS HANDLER_CODE
    , CAST(NULL AS VARCHAR) AS TARGET_WORKSHEET
    , 1 AS MENU_ORDER
    , false AS EDIT_PARAMETERS
FROM
    INFORMATION_SCHEMA.TABLES t
WHERE
    t.TABLE_SCHEMA = 's01'
    AND NOT t.TABLE_NAME LIKE 'xl_%'
UNION ALL
SELECT
    t.ROUTINE_SCHEMA AS TABLE_SCHEMA
    , t.ROUTINE_NAME AS TABLE_NAME
    , CAST(NULL AS VARCHAR) AS COLUMN_NAME
    , 'Actions' AS EVENT_NAME
    , t.ROUTINE_SCHEMA AS HANDLER_SCHEMA
    , 'See Online Help' AS HANDLER_NAME
    , 'HTTP' AS HANDLER_TYPE
    , CONCAT('https://www.savetodb.com/samples/sample', SUBSTRING(t.ROUTINE_SCHEMA, 2, 2), '-', t.ROUTINE_NAME, CASE WHEN USER LIKE 'sample%' THEN '_' || USER ELSE '' END) AS HANDLER_CODE
    , CAST(NULL AS VARCHAR) AS TARGET_WORKSHEET
    , 1 AS MENU_ORDER
    , false AS EDIT_PARAMETERS
FROM
    INFORMATION_SCHEMA.ROUTINES t
WHERE
    t.ROUTINE_SCHEMA = 's01'
    AND NOT t.ROUTINE_NAME LIKE 'xl_%'
    AND NOT t.ROUTINE_NAME LIKE '%_insert'
    AND NOT t.ROUTINE_NAME LIKE '%_update'
    AND NOT t.ROUTINE_NAME LIKE '%_delete'
    AND NOT t.ROUTINE_NAME LIKE '%_change'
    AND NOT t.ROUTINE_NAME LIKE '%_merge'
;

CREATE OR REPLACE FUNCTION s01.usp_cashbook (
    account_name varchar
    , item_name varchar
    , company_name varchar
    )
    RETURNS table (
        id integer
        , date date
        , account varchar
        , item varchar
        , company varchar
        , debit double precision
        , credit double precision
    )
    LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT
    p.id
    , p.date
    , p.account
    , p.item
    , p.company
    , p.debit
    , p.credit
FROM
    s01.cashbook p
WHERE
    COALESCE(account_name, p.account, '') = COALESCE(p.account, '')
    AND COALESCE(item_name, p.item, '') = COALESCE(p.item, '')
    AND COALESCE(company_name, p.company, '') = COALESCE(p.company, '')
ORDER BY
    p.id;

END
$$;

CREATE OR REPLACE FUNCTION s01.usp_cashbook2 (
    account_name varchar
    , item_name varchar
    , company_name varchar
    )
    RETURNS table (
        id integer
        , date date
        , account varchar
        , item varchar
        , company varchar
        , debit double precision
        , credit double precision
    )
    LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT
    p.id
    , p.date
    , p.account
    , p.item
    , p.company
    , p.debit
    , p.credit
FROM
    s01.cashbook p
WHERE
    COALESCE(account_name, p.account, '') = COALESCE(p.account, '')
    AND COALESCE(item_name, p.item, '') = COALESCE(p.item, '')
    AND COALESCE(company_name, p.company, '') = COALESCE(p.company, '')
ORDER BY
    p.id;

END
$$;

CREATE OR REPLACE FUNCTION s01.usp_cashbook3 (
    account_name varchar
    , item_name varchar
    , company_name varchar
    )
    RETURNS table (
        id integer
        , date date
        , account varchar
        , item varchar
        , company varchar
        , debit double precision
        , credit double precision
    )
    LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT
    p.id
    , p.date
    , p.account
    , p.item
    , p.company
    , p.debit
    , p.credit
FROM
    s01.cashbook p
WHERE
    COALESCE(account_name, p.account, '') = COALESCE(p.account, '')
    AND COALESCE(item_name, p.item, '') = COALESCE(p.item, '')
    AND COALESCE(company_name, p.company, '') = COALESCE(p.company, '')
ORDER BY
    p.id;

END
$$;

CREATE OR REPLACE FUNCTION s01.usp_cashbook4 (
    account_name varchar
    , item_name varchar
    , company_name varchar
    )
    RETURNS table (
        id integer
        , date date
        , account varchar
        , item varchar
        , company varchar
        , debit double precision
        , credit double precision
    )
    LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT
    p.id
    , p.date
    , p.account
    , p.item
    , p.company
    , p.debit
    , p.credit
FROM
    s01.cashbook p
WHERE
    COALESCE(account_name, p.account, '') = COALESCE(p.account, '')
    AND COALESCE(item_name, p.item, '') = COALESCE(p.item, '')
    AND COALESCE(company_name, p.company, '') = COALESCE(p.company, '')
ORDER BY
    p.id;

END
$$;

CREATE OR REPLACE FUNCTION s01.usp_cashbook2_insert (
    date date
    , account varchar
    , company varchar
    , item varchar
    , debit double precision
    , credit double precision
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

INSERT INTO s01.cashbook
    ( date
    , account
    , company
    , item
    , debit
    , credit
    )
VALUES
    ( date
    , account
    , company
    , item
    , debit
    , credit
    );

END
$$;


CREATE OR REPLACE FUNCTION s01.usp_cashbook2_update (
    id integer
    , date date
    , account varchar
    , company varchar
    , item varchar
    , debit double precision
    , credit double precision
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

UPDATE s01.cashbook p
SET
    date = usp_cashbook2_update.date
    , account = usp_cashbook2_update.account
    , company = usp_cashbook2_update.company
    , item = usp_cashbook2_update.item
    , debit = usp_cashbook2_update.debit
    , credit = usp_cashbook2_update.credit
WHERE
    p.id = usp_cashbook2_update.id;

END
$$;


CREATE OR REPLACE FUNCTION s01.usp_cashbook2_delete (
    id integer
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

DELETE FROM s01.cashbook p
WHERE
    p.id = usp_cashbook2_delete.id;

END
$$;


CREATE OR REPLACE FUNCTION s01.usp_cashbook4_merge (
    id integer
    , date date
    , account varchar
    , company varchar
    , item varchar
    , debit double precision
    , credit double precision
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

UPDATE s01.cashbook p
SET
    date = usp_cashbook4_merge.date
    , account = usp_cashbook4_merge.account
    , company = usp_cashbook4_merge.company
    , item = usp_cashbook4_merge.item
    , debit = usp_cashbook4_merge.debit
    , credit = usp_cashbook4_merge.credit
WHERE
    p.id = usp_cashbook4_merge.id;

IF NOT FOUND THEN
    INSERT INTO s01.cashbook
        ( date
        , account
        , company
        , item
        , debit
        , credit
        )
    VALUES
        ( date
        , account
        , company
        , item
        , debit
        , credit
        );
END IF;

END
$$;


CREATE OR REPLACE FUNCTION s01.usp_cashbook3_change (
    column_name varchar
    , cell_value varchar
    , cell_number_value double precision
    , cell_datetime_value date
    , id integer
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
BEGIN

IF column_name = 'id' THEN

    RAISE EXCEPTION 'Do not change the id column';
    RETURN;

ELSIF column_name = 'date' THEN

    IF cell_datetime_value IS NULL AND cell_value IS NOT NULL THEN
        RAISE EXCEPTION 'Date requires a date value';
        RETURN;
    END IF;

    UPDATE s01.cashbook p
    SET
        date = cell_datetime_value
    WHERE
        p.id = usp_cashbook3_change.id;

ELSIF column_name = 'debit' THEN

    IF cell_number_value IS NULL AND cell_value IS NOT NULL THEN
        RAISE EXCEPTION 'Debit requires a number value';
        RETURN;
    END IF;

    UPDATE s01.cashbook p
    SET
        debit = cell_number_value
    WHERE
        p.id = usp_cashbook3_change.id;

ELSIF column_name = 'credit' THEN

    IF cell_number_value IS NULL AND cell_value IS NOT NULL THEN
        RAISE EXCEPTION 'Credit requires a number value';
        RETURN;
    END IF;

    UPDATE s01.cashbook p
    SET
        credit = cell_number_value
    WHERE
        p.id = usp_cashbook3_change.id;

ELSIF column_name = 'account' THEN

    UPDATE s01.cashbook p
    SET
        account = cell_value
    WHERE
        p.id = usp_cashbook3_change.id;

ELSIF column_name = 'company' THEN

    UPDATE s01.cashbook p
    SET
        company = cell_value
    WHERE
        p.id = usp_cashbook3_change.id;

ELSIF column_name = 'item' THEN

    UPDATE s01.cashbook p
    SET
        item = cell_value
    WHERE
        p.id = usp_cashbook3_change.id;

ELSE

    RAISE NOTICE 'The cashbook table does not contain the % column', column_name;
    RETURN;

END IF;

IF NOT FOUND THEN

    RAISE NOTICE 'The record with the id % not found', id;
    RETURN;

END IF;

END
$$;

CREATE OR REPLACE FUNCTION s01.usp_cash_by_months (
    Year smallint
    )
    RETURNS table (
        sort_order bigint
        , section smallint
        , level smallint
        , item varchar
        , company varchar
        , "Name" varchar
        , "Total" double precision
        , "Jan" double precision
        , "Feb" double precision
        , "Mar" double precision
        , "Apr" double precision
        , "May" double precision
        , "Jun" double precision
        , "Jul" double precision
        , "Aug" double precision
        , "Sep" double precision
        , "Oct" double precision
        , "Nov" double precision
        , "Dec" double precision
    )
    LANGUAGE plpgsql
AS $$
BEGIN

IF Year IS NULL THEN
    SELECT date_part('year', MAX(date)) INTO Year FROM s01.cashbook;
END IF;

RETURN QUERY
SELECT
    row_number() OVER (ORDER BY p.section, p.item NULLS FIRST, p.company NULLS FIRST) AS sort_order
    , CAST(p.section AS smallint) AS section
    , CAST(MAX(p.level) AS smallint) AS level
    , CAST(p.item AS varchar) AS item
    , CAST(p.company AS varchar) AS company
    , CASE WHEN p.company IS NOT NULL THEN CAST(CONCAT('  ', MAX(p.name)) AS varchar) ELSE CAST(MAX(p.name) AS varchar) END AS "Name"
    , CASE WHEN p.section = 1 THEN SUM(p."Jan") WHEN p.section = 5 THEN SUM(p."Dec") ELSE SUM(p.total) END AS "Total"
    , SUM(p."Jan") AS "Jan"
    , SUM(p."Feb") AS "Feb"
    , SUM(p."Mar") AS "Mar"
    , SUM(p."Apr") AS "Apr"
    , SUM(p."May") AS "May"
    , SUM(p."Jun") AS "Jun"
    , SUM(p."Jul") AS "Jul"
    , SUM(p."Aug") AS "Aug"
    , SUM(p."Sep") AS "Sep"
    , SUM(p."Oct") AS "Oct"
    , SUM(p."Nov") AS "Nov"
    , SUM(p."Dec") AS "Dec"
FROM
    (
    -- Companies
    SELECT
        p.section
        , 2 AS level
        , p.item
        , p.company
        , p.company AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN  1 THEN SUM(p.amount) ELSE NULL END AS "Jan"
        , CASE p.period WHEN  2 THEN SUM(p.amount) ELSE NULL END AS "Feb"
        , CASE p.period WHEN  3 THEN SUM(p.amount) ELSE NULL END AS "Mar"
        , CASE p.period WHEN  4 THEN SUM(p.amount) ELSE NULL END AS "Apr"
        , CASE p.period WHEN  5 THEN SUM(p.amount) ELSE NULL END AS "May"
        , CASE p.period WHEN  6 THEN SUM(p.amount) ELSE NULL END AS "Jun"
        , CASE p.period WHEN  7 THEN SUM(p.amount) ELSE NULL END AS "Jul"
        , CASE p.period WHEN  8 THEN SUM(p.amount) ELSE NULL END AS "Aug"
        , CASE p.period WHEN  9 THEN SUM(p.amount) ELSE NULL END AS "Sep"
        , CASE p.period WHEN 10 THEN SUM(p.amount) ELSE NULL END AS "Oct"
        , CASE p.period WHEN 11 THEN SUM(p.amount) ELSE NULL END AS "Nov"
        , CASE p.period WHEN 12 THEN SUM(p.amount) ELSE NULL END AS "Dec"
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS smallint) AS section
            , p.item
            , p.company
            , date_part('month', p.date) AS period
            , CASE WHEN p.credit IS NOT NULL THEN COALESCE(p.credit, 0) - COALESCE(p.debit, 0) ELSE COALESCE(p.debit, 0) - COALESCE(p.credit, 0) END AS amount
        FROM
            s01.cashbook p
        WHERE
            p.company IS NOT NULL
            AND date_part('year', p.date) = Year
        ) p
    GROUP BY
        p.section
        , p.item
        , p.company
        , p.period

    -- Total Items
    UNION ALL
    SELECT
        p.section
        , 1 AS level
        , p.item
        , CAST(NULL AS varchar) AS company
        , p.item AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN  1 THEN SUM(p.amount) ELSE NULL END AS "Jan"
        , CASE p.period WHEN  2 THEN SUM(p.amount) ELSE NULL END AS "Feb"
        , CASE p.period WHEN  3 THEN SUM(p.amount) ELSE NULL END AS "Mar"
        , CASE p.period WHEN  4 THEN SUM(p.amount) ELSE NULL END AS "Apr"
        , CASE p.period WHEN  5 THEN SUM(p.amount) ELSE NULL END AS "May"
        , CASE p.period WHEN  6 THEN SUM(p.amount) ELSE NULL END AS "Jun"
        , CASE p.period WHEN  7 THEN SUM(p.amount) ELSE NULL END AS "Jul"
        , CASE p.period WHEN  8 THEN SUM(p.amount) ELSE NULL END AS "Aug"
        , CASE p.period WHEN  9 THEN SUM(p.amount) ELSE NULL END AS "Sep"
        , CASE p.period WHEN 10 THEN SUM(p.amount) ELSE NULL END AS "Oct"
        , CASE p.period WHEN 11 THEN SUM(p.amount) ELSE NULL END AS "Nov"
        , CASE p.period WHEN 12 THEN SUM(p.amount) ELSE NULL END AS "Dec"
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS smallint) AS section
            , p.item
            , date_part('month', p.date) AS period
            , CASE WHEN p.credit IS NOT NULL THEN COALESCE(p.credit, 0) - COALESCE(p.debit, 0) ELSE COALESCE(p.debit, 0) - COALESCE(p.credit, 0) END AS amount
        FROM
            s01.cashbook p
        WHERE
            p.item IS NOT NULL
            AND date_part('year', p.date) = Year
        ) p
    GROUP BY
        p.section
        , p.item
        , p.period

    -- Total Income/Expenses
    UNION ALL
    SELECT
        p.section
        , 0 AS level
        , NULL AS item
        , NULL AS company
        , MAX(p.name) AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN  1 THEN SUM(p.amount) ELSE NULL END AS "Jan"
        , CASE p.period WHEN  2 THEN SUM(p.amount) ELSE NULL END AS "Feb"
        , CASE p.period WHEN  3 THEN SUM(p.amount) ELSE NULL END AS "Mar"
        , CASE p.period WHEN  4 THEN SUM(p.amount) ELSE NULL END AS "Apr"
        , CASE p.period WHEN  5 THEN SUM(p.amount) ELSE NULL END AS "May"
        , CASE p.period WHEN  6 THEN SUM(p.amount) ELSE NULL END AS "Jun"
        , CASE p.period WHEN  7 THEN SUM(p.amount) ELSE NULL END AS "Jul"
        , CASE p.period WHEN  8 THEN SUM(p.amount) ELSE NULL END AS "Aug"
        , CASE p.period WHEN  9 THEN SUM(p.amount) ELSE NULL END AS "Sep"
        , CASE p.period WHEN 10 THEN SUM(p.amount) ELSE NULL END AS "Oct"
        , CASE p.period WHEN 11 THEN SUM(p.amount) ELSE NULL END AS "Nov"
        , CASE p.period WHEN 12 THEN SUM(p.amount) ELSE NULL END AS "Dec"
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS smallint) AS section
            , CAST(CASE WHEN p.credit IS NOT NULL THEN 'Total Expenses' ELSE 'Total Income' END AS varchar) AS name
            , date_part('month', p.date) AS period
            , CASE WHEN p.credit IS NOT NULL THEN COALESCE(p.credit, 0) - COALESCE(p.debit, 0) ELSE COALESCE(p.debit, 0) - COALESCE(p.credit, 0) END AS amount
        FROM
            s01.cashbook p
        WHERE
            date_part('year', p.date) = Year
        ) p
    GROUP BY
        p.section
        , p.period

    -- Net Change
    UNION ALL
    SELECT
        4 AS section
        , 0 AS level
        , NULL AS item
        , NULL AS company
        , 'Net Change' AS Name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN  1 THEN SUM(p.amount) ELSE NULL END AS "Jan"
        , CASE p.period WHEN  2 THEN SUM(p.amount) ELSE NULL END AS "Feb"
        , CASE p.period WHEN  3 THEN SUM(p.amount) ELSE NULL END AS "Mar"
        , CASE p.period WHEN  4 THEN SUM(p.amount) ELSE NULL END AS "Apr"
        , CASE p.period WHEN  5 THEN SUM(p.amount) ELSE NULL END AS "May"
        , CASE p.period WHEN  6 THEN SUM(p.amount) ELSE NULL END AS "Jun"
        , CASE p.period WHEN  7 THEN SUM(p.amount) ELSE NULL END AS "Jul"
        , CASE p.period WHEN  8 THEN SUM(p.amount) ELSE NULL END AS "Aug"
        , CASE p.period WHEN  9 THEN SUM(p.amount) ELSE NULL END AS "Sep"
        , CASE p.period WHEN 10 THEN SUM(p.amount) ELSE NULL END AS "Oct"
        , CASE p.period WHEN 11 THEN SUM(p.amount) ELSE NULL END AS "Nov"
        , CASE p.period WHEN 12 THEN SUM(p.amount) ELSE NULL END AS "Dec"
    FROM
        (
        SELECT
            date_part('month', p.date) AS period
            , COALESCE(p.debit, 0) - COALESCE(p.credit, 0) AS amount
        FROM
            s01.cashbook p
        WHERE
            date_part('year', p.date) = Year
        ) p
    GROUP BY
        p.period

    -- Opening balance
    UNION ALL
    SELECT
        1 AS section
        , 0 AS level
        , NULL AS item
        , NULL AS company
        , 'Opening Balance' AS Name
        , p.period
        , NULL AS total
        , CASE p.period WHEN  1 THEN SUM(p.amount) ELSE NULL END AS "Jan"
        , CASE p.period WHEN  2 THEN SUM(p.amount) ELSE NULL END AS "Feb"
        , CASE p.period WHEN  3 THEN SUM(p.amount) ELSE NULL END AS "Mar"
        , CASE p.period WHEN  4 THEN SUM(p.amount) ELSE NULL END AS "Apr"
        , CASE p.period WHEN  5 THEN SUM(p.amount) ELSE NULL END AS "May"
        , CASE p.period WHEN  6 THEN SUM(p.amount) ELSE NULL END AS "Jun"
        , CASE p.period WHEN  7 THEN SUM(p.amount) ELSE NULL END AS "Jul"
        , CASE p.period WHEN  8 THEN SUM(p.amount) ELSE NULL END AS "Aug"
        , CASE p.period WHEN  9 THEN SUM(p.amount) ELSE NULL END AS "Sep"
        , CASE p.period WHEN 10 THEN SUM(p.amount) ELSE NULL END AS "Oct"
        , CASE p.period WHEN 11 THEN SUM(p.amount) ELSE NULL END AS "Nov"
        , CASE p.period WHEN 12 THEN SUM(p.amount) ELSE NULL END AS "Dec"
    FROM
        (
        SELECT
            date_part('month', d.date) AS period
            , SUM(COALESCE(p.debit, 0) - COALESCE(p.credit, 0)) AS amount
        FROM
            s01.cashbook p
            CROSS JOIN (
                SELECT date (Year || '-01-01') As date
                UNION SELECT date (Year || '-01-01') + interval '1 month'
                UNION SELECT date (Year || '-01-01') + interval '2 month'
                UNION SELECT date (Year || '-01-01') + interval '3 month'
                UNION SELECT date (Year || '-01-01') + interval '4 month'
                UNION SELECT date (Year || '-01-01') + interval '5 month'
                UNION SELECT date (Year || '-01-01') + interval '6 month'
                UNION SELECT date (Year || '-01-01') + interval '7 month'
                UNION SELECT date (Year || '-01-01') + interval '8 month'
                UNION SELECT date (Year || '-01-01') + interval '9 month'
                UNION SELECT date (Year || '-01-01') + interval '10 month'
                UNION SELECT date (Year || '-01-01') + interval '11 month'
            ) d
        WHERE
            p.date < d.date
        GROUP BY
            d.date
        ) p
    GROUP BY
        p.period

    -- Closing balance
    UNION ALL
    SELECT
        5 AS section
        , 0 AS level
        , NULL AS item
        , NULL AS company
        , 'Closing Balance' AS Name
        , p.period
        , NULL AS total
        , CASE p.period WHEN  2 THEN SUM(p.amount) ELSE NULL END AS "Jan"
        , CASE p.period WHEN  3 THEN SUM(p.amount) ELSE NULL END AS "Feb"
        , CASE p.period WHEN  4 THEN SUM(p.amount) ELSE NULL END AS "Mar"
        , CASE p.period WHEN  5 THEN SUM(p.amount) ELSE NULL END AS "Apr"
        , CASE p.period WHEN  6 THEN SUM(p.amount) ELSE NULL END AS "May"
        , CASE p.period WHEN  7 THEN SUM(p.amount) ELSE NULL END AS "Jun"
        , CASE p.period WHEN  8 THEN SUM(p.amount) ELSE NULL END AS "Jul"
        , CASE p.period WHEN  9 THEN SUM(p.amount) ELSE NULL END AS "Aug"
        , CASE p.period WHEN 10 THEN SUM(p.amount) ELSE NULL END AS "Sep"
        , CASE p.period WHEN 11 THEN SUM(p.amount) ELSE NULL END AS "Oct"
        , CASE p.period WHEN 12 THEN SUM(p.amount) ELSE NULL END AS "Nov"
        , CASE p.period WHEN  1 THEN SUM(p.amount) ELSE NULL END AS "Dec"
    FROM
        (
        SELECT
            date_part('month', d.date) AS period
            , SUM(COALESCE(p.debit, 0) - COALESCE(p.credit, 0)) AS amount
        FROM
            s01.cashbook p
            CROSS JOIN (
                SELECT date (Year || '-01-01') + interval '1 month' AS date
                UNION SELECT date (Year || '-01-01') + interval '2 month'
                UNION SELECT date (Year || '-01-01') + interval '3 month'
                UNION SELECT date (Year || '-01-01') + interval '4 month'
                UNION SELECT date (Year || '-01-01') + interval '5 month'
                UNION SELECT date (Year || '-01-01') + interval '6 month'
                UNION SELECT date (Year || '-01-01') + interval '7 month'
                UNION SELECT date (Year || '-01-01') + interval '8 month'
                UNION SELECT date (Year || '-01-01') + interval '9 month'
                UNION SELECT date (Year || '-01-01') + interval '10 month'
                UNION SELECT date (Year || '-01-01') + interval '11 month'
                UNION SELECT date (Year || '-01-01') + interval '12 month'
            ) d
        WHERE
            p.date < d.date
        GROUP BY
            d.date
        ) p
    GROUP BY
        p.period
    ) p
GROUP BY
    p.section
    , p.item
    , p.company
ORDER BY
    sort_order;

END
$$;

CREATE OR REPLACE FUNCTION s01.usp_cash_by_months_change (
    column_name varchar
    , cell_number_value double precision
    , section smallint
    , item varchar
    , company varchar
    , year smallint
    )
    RETURNS void
    LANGUAGE plpgsql
AS $$
DECLARE
    month1 integer;
    start_date date;
    end_date date;
    id1 integer;
    count1 integer;
    date1 date;
    account1 varchar;
    item1 ALIAS FOR item;
    company1 ALIAS FOR company;
BEGIN

month1:= strpos('    Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec ', ' ' || column_name || ' ') / 4;

IF month1 < 1 THEN RETURN; END IF;

IF year IS NULL THEN year := EXTRACT(YEAR FROM (SELECT MAX(date) FROM s01.cashbook)); END IF;
IF year IS NULL THEN year := EXTRACT(YEAR FROM now()); END IF;

start_date := make_date(year, month1, 1);
end_date := start_date + interval '1 month' - interval '1 day';

SELECT
    MAX(id), COUNT(*)
INTO
    id1, count1
FROM
    s01.cashbook t
WHERE
    t.item = item1 AND COALESCE(t.company, '') = COALESCE(company1, '') AND t.date BETWEEN start_date AND end_date;

IF count1 = 0 THEN

    IF item1 IS NULL THEN
        RAISE EXCEPTION 'Select a row with an item';
        RETURN;
    END IF;

    SELECT
        MAX(ID)
    INTO
        id1
    FROM
        S01.CASHBOOK T
    WHERE
        t.item = item1 AND COALESCE(t.company, '') = COALESCE(company1, '') AND t.date < end_date;

    IF id1 IS NOT NULL THEN

        SELECT date, account INTO date1, account1 FROM s01.cashbook WHERE id = id1;

        IF extract(DAY FROM date1) > extract(DAY FROM end_date) THEN
            date1 := end_date;
        ELSE
            date1 := make_date(year, month1, cast(extract(DAY FROM date1) as integer));
        END IF;
    ELSE
        date1 := end_date;
    END IF;

    INSERT INTO s01.cashbook (date, account, item, company, debit, credit)
        VALUES (date1, account1, item1, company1,
            CASE WHEN section = 3 THEN NULL ELSE cell_number_value END,
            CASE WHEN section = 3 THEN cell_number_value ELSE NULL END);

    RETURN;
END IF;

IF count1 > 1 THEN
    RAISE EXCEPTION 'The cell has more than one underlying record';
    RETURN;
END IF;

UPDATE s01.cashbook
SET
    debit = CASE WHEN section = 3 THEN NULL ELSE cell_number_value END
    , credit = CASE WHEN section = 3 THEN cell_number_value ELSE NULL END
WHERE
    id = id1;

END $$;

INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-01-10', 'Bank', 'Revenue', 'Customer C1', 200000, NULL);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-01-10', 'Bank', 'Expenses', 'Supplier S1', NULL, 50000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-01-31', 'Bank', 'Payroll', NULL, NULL, 85000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-01-31', 'Bank', 'Taxes', 'Individual Income Tax', NULL, 15000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-01-31', 'Bank', 'Taxes', 'Payroll Taxes', NULL, 15000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-10', 'Bank', 'Revenue', 'Customer C1', 300000, NULL);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-10', 'Bank', 'Revenue', 'Customer C2', 100000, NULL);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-10', 'Bank', 'Expenses', 'Supplier S1', NULL, 100000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-10', 'Bank', 'Expenses', 'Supplier S2', NULL, 50000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-28', 'Bank', 'Payroll', NULL, NULL, 85000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-28', 'Bank', 'Taxes', 'Individual Income Tax', NULL, 15000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-02-28', 'Bank', 'Taxes', 'Payroll Taxes', NULL, 15000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-10', 'Bank', 'Revenue', 'Customer C1', 300000, NULL);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-10', 'Bank', 'Revenue', 'Customer C2', 200000, NULL);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-10', 'Bank', 'Revenue', 'Customer C3', 100000, NULL);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-15', 'Bank', 'Taxes', 'Corporate Income Tax', NULL, 100000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-31', 'Bank', 'Payroll', NULL, NULL, 170000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-31', 'Bank', 'Taxes', 'Individual Income Tax', NULL, 30000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-31', 'Bank', 'Taxes', 'Payroll Taxes', NULL, 30000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-31', 'Bank', 'Expenses', 'Supplier S1', NULL, 100000);
INSERT INTO s01.cashbook (date, account, item, company, debit, credit) VALUES ('2024-03-31', 'Bank', 'Expenses', 'Supplier S2', NULL, 50000);

INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'usp_cash_by_months', '<table name="s01.usp_cash_by_months"><columnFormats><column name="" property="ListObjectName" value="usp_cash_by_months" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="sort_order" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="sort_order" property="Address" value="$C$4" type="String"/><column name="sort_order" property="NumberFormat" value="General" type="String"/><column name="section" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="section" property="Address" value="$D$4" type="String"/><column name="section" property="NumberFormat" value="General" type="String"/><column name="level" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="level" property="Address" value="$E$4" type="String"/><column name="level" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="Name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Name" property="Address" value="$H$4" type="String"/><column name="Name" property="ColumnWidth" value="21.43" type="Double"/><column name="Name" property="NumberFormat" value="General" type="String"/><column name="Jan" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jan" property="Address" value="$I$4" type="String"/><column name="Jan" property="ColumnWidth" value="10" type="Double"/><column name="Jan" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Feb" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Feb" property="Address" value="$J$4" type="String"/><column name="Feb" property="ColumnWidth" value="10" type="Double"/><column name="Feb" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Mar" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Mar" property="Address" value="$K$4" type="String"/><column name="Mar" property="ColumnWidth" value="10" type="Double"/><column name="Mar" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Apr" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Apr" property="Address" value="$L$4" type="String"/><column name="Apr" property="ColumnWidth" value="10" type="Double"/><column name="Apr" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="May" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="May" property="Address" value="$M$4" type="String"/><column name="May" property="ColumnWidth" value="10" type="Double"/><column name="May" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Jun" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jun" property="Address" value="$N$4" type="String"/><column name="Jun" property="ColumnWidth" value="10" type="Double"/><column name="Jun" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Jul" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jul" property="Address" value="$O$4" type="String"/><column name="Jul" property="ColumnWidth" value="10" type="Double"/><column name="Jul" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Aug" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Aug" property="Address" value="$P$4" type="String"/><column name="Aug" property="ColumnWidth" value="10" type="Double"/><column name="Aug" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Sep" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Sep" property="Address" value="$Q$4" type="String"/><column name="Sep" property="ColumnWidth" value="10" type="Double"/><column name="Sep" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Oct" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Oct" property="Address" value="$R$4" type="String"/><column name="Oct" property="ColumnWidth" value="10" type="Double"/><column name="Oct" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Nov" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Nov" property="Address" value="$S$4" type="String"/><column name="Nov" property="ColumnWidth" value="10" type="Double"/><column name="Nov" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Dec" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Dec" property="Address" value="$T$4" type="String"/><column name="Dec" property="ColumnWidth" value="10" type="Double"/><column name="Dec" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="_RowNum" property="FormatConditions(1).AppliesToTable" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(1).AppliesTo.Address" value="$B$4:$T$20" type="String"/><column name="_RowNum" property="FormatConditions(1).Type" value="2" type="Double"/><column name="_RowNum" property="FormatConditions(1).Priority" value="3" type="Double"/><column name="_RowNum" property="FormatConditions(1).Formula1" value="=$E4&lt;2" type="String"/><column name="_RowNum" property="FormatConditions(1).Font.Bold" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(2).AppliesToTable" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(2).AppliesTo.Address" value="$B$4:$T$20" type="String"/><column name="_RowNum" property="FormatConditions(2).Type" value="2" type="Double"/><column name="_RowNum" property="FormatConditions(2).Priority" value="4" type="Double"/><column name="_RowNum" property="FormatConditions(2).Formula1" value="=AND($E4=0,$D4&gt;1,$D4&lt;5)" type="String"/><column name="_RowNum" property="FormatConditions(2).Font.Bold" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(2).Font.Color" value="16777215" type="Double"/><column name="_RowNum" property="FormatConditions(2).Font.ThemeColor" value="1" type="Double"/><column name="_RowNum" property="FormatConditions(2).Font.TintAndShade" value="0" type="Double"/><column name="_RowNum" property="FormatConditions(2).Interior.Color" value="6773025" type="Double"/><column name="_RowNum" property="FormatConditions(2).Interior.Color" value="6773025" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All columns"><column name="" property="ListObjectName" value="cash_by_month" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="sort_order" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="section" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="level" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jan" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Feb" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Mar" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Apr" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="May" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jun" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jul" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Aug" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Sep" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Oct" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Nov" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Dec" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Default"><column name="" property="ListObjectName" value="cash_by_month" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="sort_order" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="section" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="level" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="Name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jan" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Feb" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Mar" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Apr" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="May" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jun" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jul" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Aug" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Sep" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Oct" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Nov" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Dec" property="EntireColumn.Hidden" value="False" type="Boolean"/></view></views></table>');
INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'cashbook', '<table name="s01.cashbook"><columnFormats><column name="" property="ListObjectName" value="cashbook" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');
INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'view_cashbook', '<table name="s01.view_cashbook"><columnFormats><column name="" property="ListObjectName" value="view_cashbook" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');
INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'usp_cashbook', '<table name="s01.usp_cashbook"><columnFormats><column name="" property="ListObjectName" value="usp_cashbook" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');
INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'usp_cashbook2', '<table name="s01.usp_cashbook2"><columnFormats><column name="" property="ListObjectName" value="usp_cashbook2" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');
INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'usp_cashbook3', '<table name="s01.usp_cashbook3"><columnFormats><column name="" property="ListObjectName" value="usp_cashbook3" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');
INSERT INTO s01.formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('s01', 'usp_cashbook4', '<table name="s01.usp_cashbook4"><columnFormats><column name="" property="ListObjectName" value="usp_cashbook4" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');

INSERT INTO s01.workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES ('Sample 01 - Basic Features - User1.xlsx', 'https://www.savetodb.com/downloads/v10/sample01-user1.xlsx', '
cashbook=s01.cashbook,(Default),False,$B$3,,{"Parameters":{"account":null,"item":null,"company":null},"ListObjectName":"cashbook"}
view_cashbook=s01.view_cashbook,(Default),False,$B$3,,{"Parameters":{"account":null,"item":null,"company":null},"ListObjectName":"view_cashbook"}
usp_cashbook=s01.usp_cashbook,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook"}
usp_cashbook2=s01.usp_cashbook2,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook2"}
usp_cashbook3=s01.usp_cashbook3,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook3"}
usp_cashbook4=s01.usp_cashbook4,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook4"}
cash_by_months=s01.usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2024},"ListObjectName":"cash_by_months"}
', 's01');

INSERT INTO s01.workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES ('Sample 01 - Basic Features - User2 (Restricted).xlsx', 'https://www.savetodb.com/downloads/v10/sample01-user2.xlsx', '
cashbook=s01.cashbook,(Default),False,$B$3,,{"Parameters":{"account":null,"item":null,"company":null},"ListObjectName":"cashbook"}
view_cashbook=s01.view_cashbook,(Default),False,$B$3,,{"Parameters":{"account":null,"item":null,"company":null},"ListObjectName":"view_cashbook"}
usp_cashbook=s01.usp_cashbook,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook"}
usp_cashbook2=s01.usp_cashbook2,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook2"}
usp_cashbook3=s01.usp_cashbook3,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook3"}
usp_cashbook4=s01.usp_cashbook4,(Default),False,$B$3,,{"Parameters":{"account_name":null,"item_name":null,"company_name":null},"ListObjectName":"usp_cashbook4"}
cash_by_months=s01.usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2024},"ListObjectName":"cash_by_months"}
', 's01');

-- print Application installed
