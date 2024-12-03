SELECT food_item_id, COUNT(*) as frequency
FROM christmas_menus
,XMLTABLE(
    '//food_item_id' PASSING menu_data
    COLUMNS
        food_item_id text PATH '.'
)
WHERE xpath_exists('//total_present[. > 78]', menu_data)
OR xpath_exists('//total_guests[. > 78]', menu_data)
OR xpath_exists('//total_count[. > 78]', menu_data)
GROUP BY food_item_id
ORDER BY frequency DESC
LIMIT 1
;
