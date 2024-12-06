WITH stats AS (
    SELECT
  production_date,
  toys_produced,
  LAG(toys_produced, 1) OVER (ORDER BY production_date) AS previous_day_production
FROM toy_production
)
SELECT
  production_date,
  toys_produced,
  previous_day_production,
  toys_produced - previous_day_production AS production_change,
  (toys_produced - previous_day_production) / previous_day_production * 100 AS production_change_percentage
FROM stats
ORDER BY production_change_percentage DESC NULLS LAST
LIMIT 1
;