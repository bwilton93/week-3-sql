DROP TABLE IF EXISTS students, tags, students_tags_join;

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name text
);

CREATE TABLE students_tags_join (
  student_id int,
  tag_id int
);

