SELECT DISTINCT
  geo.country AS country
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20201101' AND '20211031'
  AND geo.country IS NOT NULL