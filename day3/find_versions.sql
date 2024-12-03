SELECT DISTINCT (name,version)
FROM christmas_menus
,XMLTABLE(
    '/*' PASSING menu_data
    COLUMNS
        name text PATH 'name()',
        version text PATH '@version'
)
;