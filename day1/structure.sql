DROP TABLE IF EXISTS children;
CREATE TABLE children (
      child_id INT PRIMARY KEY,
      name VARCHAR(100),
      age INT
  );
DROP TABLE IF EXISTS wish_lists;
  CREATE TABLE wish_lists (
      list_id INT PRIMARY KEY,
      child_id INT,
      wishes JSON,
      submitted_date DATE
  );
DROP TABLE IF EXISTS toy_catalogue;
  CREATE TABLE toy_catalogue (
      toy_id INT PRIMARY KEY,
      toy_name VARCHAR(100),
      category VARCHAR(50),
      difficulty_to_make INT
  );
