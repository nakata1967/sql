SELECT
  page_location,
  SUM(screen_page_views) AS screen_page_views,
  device_category, medium, source 
FROM
  (
    SELECT
      (
        SELECT
          value.string_value
        FROM
          UNNEST (event_params)
        WHERE
          event_name = 'page_view'
          AND key = 'page_location'
      ) AS page_location,
      COUNT(
        CASE
          WHEN event_name = 'page_view' THEN 1
        END
      ) AS screen_page_views,
    device.category AS device_category,
    traffic_source.medium AS medium,
    traffic_source.source AS source,
    FROM
      `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE
      _TABLE_SUFFIX BETWEEN '20201101' AND '20211031'
    GROUP BY
      page_location, device_category, medium, source
  )
WHERE
  device_category = 'mobile'
  AND medium = 'organic'
  AND source = 'google'
  GROUP BY
  page_location, device_category, medium, source
ORDER BY
  screen_page_views DESC












SELECT DISTINCT
  geo.country AS country,
  device.category AS device_category,
  traffic_source.medium AS medium,
  traffic_source.source AS source,
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20201101' AND '20211031'
  AND device.category = 'mobile'
  AND traffic_source.medium = 'organic'
  AND traffic_source.source = 'google'