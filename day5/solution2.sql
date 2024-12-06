SELECT
  tp.production_date,
  tp.toys_produced,
  prev.toys_produced AS previous_day_production,
  tp.toys_produced - prev.toys_produced AS production_change,
  (tp.toys_produced - prev.toys_produced) / prev.toys_produced * 100 AS production_change_percentage
FROM toy_production tp
JOIN toy_production prev on prev.production_date = tp.production_date - INTERVAL '1 day'
ORDER BY production_change_percentage DESC NULLS LAST
LIMIT 1
;