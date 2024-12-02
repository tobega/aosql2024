SELECT
  name,
  primary_wish,
  backup_wish,
  favorite_color,
  color_count,
  gift_complexity,
  workshop_assignment
FROM
  children
,LATERAL (SELECT
  wishes ->> 'first_choice' as primary_wish,
  wishes ->> 'second_choice' as backup_wish,
  wishes #>> '{colors,0}' as favorite_color,
  json_array_length(wishes -> 'colors') as color_count
  FROM wish_lists WHERE wish_lists.child_id = children.child_id
  ORDER BY submitted_date DESC
) AS pw
,LATERAL (SELECT
  CASE
    WHEN difficulty_to_make = 1 THEN 'Simple Gift'
    WHEN difficulty_to_make = 2 THEN 'Moderate Gift'
    ELSE 'Complex Gift'
  END as gift_complexity,
  CASE
    WHEN category = 'outdoor' THEN 'Outside Workshop'
    WHEN category = 'educational' THEN 'Learning Workshop'
    ELSE 'General Workshop'
  END as workshop_assignment
  FROM toy_catalogue WHERE toy_name = primary_wish) AS ws
ORDER BY name ASC
LIMIT 5
;
