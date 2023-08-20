SELECT
  event_date AS date,
  COUNT(
      CASE
      WHEN event_name = 'page_view' THEN 1
      END
  ) AS screen_page_views
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20201101' AND '20201110'
GROUP BY
  date
ORDER BY
  date