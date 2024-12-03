SELECT
  regexp_replace(
    concat(
      (SELECT string_agg(chr(value),'' ORDER BY id) FROM letters_a),
      (SELECT string_agg(chr(value),'' ORDER BY id) FROM letters_b),
      ''
    ),
    '[^a-zA-Z !"''(),.:;?-]+',
    '',
    'g'
  )
;
