DROP TABLE IF EXISTS cohorts, students;

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date date
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
-- The foreign key name is always {other_table_singular}_id
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);

TRUNCATE TABLE cohorts, students RESTART IDENTITY;

INSERT INTO cohorts (name, starting_date) VALUES 
('Jan 2023', '2023-01-01'),
('Feb 2023', '2023-02-01');

INSERT INTO students (name, cohort_id) VALUES 
('Louis', 1),
('Barney', 2),
('fake_name', 1);