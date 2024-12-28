WITH average_speeds AS (
    SELECT reindeer_id, exercise_name, AVG(speed_record) as average_speed
    FROM training_sessions
    GROUP BY reindeer_id, exercise_name
)
SELECT reindeer_name, ROUND(MAX(average_speed),2) AS top_speed
FROM reindeers NATURAL JOIN average_speeds
WHERE reindeer_name <> 'Rudolph'
GROUP BY reindeer_id
ORDER BY top_speed DESC
LIMIT 3
;