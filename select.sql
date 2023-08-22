SELECT
  event_date AS date,
  COUNT(*) AS screen_page_views
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20201101' AND '20201110'
  AND event_name = 'page_view'
GROUP BY
  1
ORDER BY
  1;