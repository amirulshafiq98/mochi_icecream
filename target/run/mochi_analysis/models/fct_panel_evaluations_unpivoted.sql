
  create view "mochi_data"."dbt_mochi"."fct_panel_evaluations_unpivoted__dbt_tmp"
    
    
  as (
    -- models/fct_panel_evaluations_unpivoted.sql

SELECT
    TO_CHAR(raw_timestamp, 'YYYYMMDDHH24MISS') AS submission_id,
    '1' AS Formulation,
    bitterness_1 AS bitterness_score,
    CAST(NULLIF(SUBSTRING(sweetness_1, STRPOS(sweetness_1, '(') + 1, STRPOS(sweetness_1, ')') - STRPOS(sweetness_1, '(') - 1), '') AS INTEGER) AS sweetness_score,
    CAST(NULLIF(SUBSTRING(chamomile_flavour_1, STRPOS(chamomile_flavour_1, '(') + 1, STRPOS(chamomile_flavour_1, ')') - STRPOS(chamomile_flavour_1, '(') - 1), '') AS INTEGER) AS chamomile_flavour_score,
    CAST(NULLIF(SUBSTRING(honey_flavour_1, STRPOS(honey_flavour_1, '(') + 1, STRPOS(honey_flavour_1, ')') - STRPOS(honey_flavour_1, '(') - 1), '') AS INTEGER) AS honey_flavour_score,
    CAST(NULLIF(SUBSTRING(creaminess_1, STRPOS(creaminess_1, '(') + 1, STRPOS(creaminess_1, ')') - STRPOS(creaminess_1, '(') - 1), '') AS INTEGER) AS creaminess_score,
    overall_acceptability_1 AS overall_acceptability_score
FROM
    "mochi_data"."dbt_mochi"."stg_panel_evaluations" -- <--- IMPORTANT CHANGE HERE
WHERE
    1=1

UNION ALL

SELECT
    TO_CHAR(raw_timestamp, 'YYYYMMDDHH24MISS') AS submission_id,
    '2' AS Formulation,
    bitterness_2 AS bitterness_score,
    CAST(NULLIF(SUBSTRING(sweetness_2, STRPOS(sweetness_2, '(') + 1, STRPOS(sweetness_2, ')') - STRPOS(sweetness_2, '(') - 1), '') AS INTEGER) AS sweetness_score,
    CAST(NULLIF(SUBSTRING(chamomile_flavour_2, STRPOS(chamomile_flavour_2, '(') + 1, STRPOS(chamomile_flavour_2, ')') - STRPOS(chamomile_flavour_2, '(') - 1), '') AS INTEGER) AS chamomile_flavour_score,
    CAST(NULLIF(SUBSTRING(honey_flavour_2, STRPOS(honey_flavour_2, '(') + 1, STRPOS(honey_flavour_2, ')') - STRPOS(honey_flavour_2, '(') - 1), '') AS INTEGER) AS honey_flavour_score,
    CAST(NULLIF(SUBSTRING(creaminess_2, STRPOS(creaminess_2, '(') + 1, STRPOS(creaminess_2, ')') - STRPOS(creaminess_2, '(') - 1), '') AS INTEGER) AS creaminess_score,
    overall_acceptability_2 AS overall_acceptability_score
FROM
    "mochi_data"."dbt_mochi"."stg_panel_evaluations" -- <--- IMPORTANT CHANGE HERE
WHERE
    1=1

UNION ALL

-- Repeat for Flavor 3
SELECT
    TO_CHAR(raw_timestamp, 'YYYYMMDDHH24MISS') AS submission_id,
    '3' AS Formulation,
    bitterness_3 AS bitterness_score,
    CAST(NULLIF(SUBSTRING(sweetness_3, STRPOS(sweetness_3, '(') + 1, STRPOS(sweetness_3, ')') - STRPOS(sweetness_3, '(') - 1), '') AS INTEGER) AS sweetness_score,
    CAST(NULLIF(SUBSTRING(chamomile_flavour_3, STRPOS(chamomile_flavour_3, '(') + 1, STRPOS(chamomile_flavour_3, ')') - STRPOS(chamomile_flavour_3, '(') - 1), '') AS INTEGER) AS chamomile_flavour_score,
    CAST(NULLIF(SUBSTRING(honey_flavour_3, STRPOS(honey_flavour_3, '(') + 1, STRPOS(honey_flavour_3, ')') - STRPOS(honey_flavour_3, '(') - 1), '') AS INTEGER) AS honey_flavour_score,
    CAST(NULLIF(SUBSTRING(creaminess_3, STRPOS(creaminess_3, '(') + 1, STRPOS(creaminess_3, ')') - STRPOS(creaminess_3, '(') - 1), '') AS INTEGER) AS creaminess_score,
    overall_acceptability_3 AS overall_acceptability_score
FROM
    "mochi_data"."dbt_mochi"."stg_panel_evaluations" -- <--- IMPORTANT CHANGE HERE
WHERE
    1=1

UNION ALL

-- Repeat for Flavor 4
SELECT
    TO_CHAR(raw_timestamp, 'YYYYMMDDHH24MISS') AS submission_id,
    '4' AS Formulation,
    bitterness_4 AS bitterness_score,
    CAST(NULLIF(SUBSTRING(sweetness_4, STRPOS(sweetness_4, '(') + 1, STRPOS(sweetness_4, ')') - STRPOS(sweetness_4, '(') - 1), '') AS INTEGER) AS sweetness_score,
    CAST(NULLIF(SUBSTRING(chamomile_flavour_4, STRPOS(chamomile_flavour_4, '(') + 1, STRPOS(chamomile_flavour_4, ')') - STRPOS(chamomile_flavour_4, '(') - 1), '') AS INTEGER) AS chamomile_flavour_score,
    CAST(NULLIF(SUBSTRING(honey_flavour_4, STRPOS(honey_flavour_4, '(') + 1, STRPOS(honey_flavour_4, ')') - STRPOS(honey_flavour_4, '(') - 1), '') AS INTEGER) AS honey_flavour_score,
    CAST(NULLIF(SUBSTRING(creaminess_4, STRPOS(creaminess_4, '(') + 1, STRPOS(creaminess_4, ')') - STRPOS(creaminess_4, '(') - 1), '') AS INTEGER) AS creaminess_score,
    overall_acceptability_4 AS overall_acceptability_score
FROM
    "mochi_data"."dbt_mochi"."stg_panel_evaluations" -- <--- IMPORTANT CHANGE HERE
WHERE
    1=1

UNION ALL

-- Repeat for Flavor 5
SELECT
    TO_CHAR(raw_timestamp, 'YYYYMMDDHH24MISS') AS submission_id,
    '5' AS Formulation,
    bitterness_5 AS bitterness_score,
    CAST(NULLIF(SUBSTRING(sweetness_5, STRPOS(sweetness_5, '(') + 1, STRPOS(sweetness_5, ')') - STRPOS(sweetness_5, '(') - 1), '') AS INTEGER) AS sweetness_score,
    CAST(NULLIF(SUBSTRING(chamomile_flavour_5, STRPOS(chamomile_flavour_5, '(') + 1, STRPOS(chamomile_flavour_5, ')') - STRPOS(chamomile_flavour_5, '(') - 1), '') AS INTEGER) AS chamomile_flavour_score,
    CAST(NULLIF(SUBSTRING(honey_flavour_5, STRPOS(honey_flavour_5, '(') + 1, STRPOS(honey_flavour_5, ')') - STRPOS(honey_flavour_5, '(') - 1), '') AS INTEGER) AS honey_flavour_score,
    CAST(NULLIF(SUBSTRING(creaminess_5, STRPOS(creaminess_5, '(') + 1, STRPOS(creaminess_5, ')') - STRPOS(creaminess_5, '(') - 1), '') AS INTEGER) AS creaminess_score,
    overall_acceptability_5 AS overall_acceptability_score
FROM
    "mochi_data"."dbt_mochi"."stg_panel_evaluations" -- <--- IMPORTANT CHANGE HERE
WHERE
    1=1
  );