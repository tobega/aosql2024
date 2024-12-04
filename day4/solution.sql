WITH tag_diffs AS (
    SELECT toy_id, toy_name, added_tags, unchanged_tags, removed_tags
FROM toy_production
,LATERAL (
    SELECT ARRAY_AGG(new_tag) FILTER (WHERE previous_tag IS NULL) added_tags,
    ARRAY_AGG(new_tag) FILTER (WHERE new_tag = previous_tag) unchanged_tags,
    ARRAY_AGG(previous_tag) FILTER (WHERE new_tag IS NULL) removed_tags
    FROM UNNEST(previous_tags) as previous_tag
    FULL JOIN UNNEST(new_tags) as new_tag
        ON previous_tag = new_tag
)
)
SELECT toy_id, toy_name, COALESCE(array_length(added_tags, 1), 0) added_tags, COALESCE(array_length(unchanged_tags, 1), 0) unchanged_tags, COALESCE(array_length(removed_tags, 1), 0) removed_tags
FROM tag_diffs
ORDER BY added_tags DESC
LIMIT 1
;