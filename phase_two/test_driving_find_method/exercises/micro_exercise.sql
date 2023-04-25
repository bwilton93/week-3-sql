-- Expected behaviour:
-- repository = StudentRepository.new 

-- student = repository.find(1) # Performs a SELECT query and returns a single Student object.

-- student.id # 1
-- student.name # "David"


-- Micro Exercise
-- Write the SQL query to select the record with id 1 from the albums table.
SELECT * FROM albums WHERE id = 1;