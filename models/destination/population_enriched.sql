{{ config(materialized='table') }}

SELECT
        p.country_id,
        c.code AS country_code,
        c.region,
        p.population
    FROM {{source('dbt_handson_raw', 'population')}} AS p
    LEFT JOIN {{source('dbt_handson_raw', 'countries')}} AS c
    ON p.country_id = c.id