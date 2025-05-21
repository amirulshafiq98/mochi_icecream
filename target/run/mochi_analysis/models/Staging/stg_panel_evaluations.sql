
  create view "mochi_data"."dbt_mochi"."stg_panel_evaluations__dbt_tmp"
    
    
  as (
    -- models/Staging/stg_panel_evaluations.sql

select
    "Timestamp" as raw_timestamp,
    -- Formulation 1
    CAST("Bitterness" AS INTEGER) as bitterness_1, -- Assuming Bitterness is just a number
    "Sweetness" as sweetness_1, -- NO CAST here, it has (X)
    "Chamomile Flavour" as chamomile_flavour_1, -- NO CAST here
    "Honey Flavour" as honey_flavour_1, -- NO CAST here
    "Creaminess" as creaminess_1, -- NO CAST here
    CAST("Overall Acceptability" AS INTEGER) as overall_acceptability_1, -- Assuming Overall Acceptability is just a number

    -- Formulation 2
    CAST("Bitterness.1" AS INTEGER) as bitterness_2,
    "Sweetness.1" as sweetness_2,
    "Chamomile Flavour.1" as chamomile_flavour_2,
    "Honey Flavour.1" as honey_flavour_2,
    "Creaminess.1" as creaminess_2,
    CAST("Overall Acceptability.1" AS INTEGER) as overall_acceptability_2,

    -- Formulation 3
    CAST("Bitterness.2" AS INTEGER) as bitterness_3,
    "Sweetness.2" as sweetness_3,
    "Chamomile Flavour.2" as chamomile_flavour_3,
    "Honey Flavour.2" as honey_flavour_3,
    "Creaminess.2" as creaminess_3,
    CAST("Overall Acceptability.2" AS INTEGER) as overall_acceptability_3,

    -- Formulation 4
    CAST("Bitterness.3" AS INTEGER) as bitterness_4,
    "Sweetness.3" as sweetness_4,
    "Chamomile Flavour.3" as chamomile_flavour_4,
    "Honey Flavour.3" as honey_flavour_4,
    "Creaminess.3" as creaminess_4,
    CAST("Overall Acceptability.3" AS INTEGER) as overall_acceptability_4,

    -- Formulation 5
    CAST("Bitterness.4" AS INTEGER) as bitterness_5,
    "Sweetness.4" as sweetness_5,
    "Chamomile Flavour.4" as chamomile_flavour_5,
    "Honey Flavour.4" as honey_flavour_5,
    "Creaminess.4" as creaminess_5,
    CAST("Overall Acceptability.4" AS INTEGER) as overall_acceptability_5

from "mochi_data"."public"."raw_panel_evaluations"
  );