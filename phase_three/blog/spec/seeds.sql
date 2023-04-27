DROP TABLE IF EXISTS comments, posts;

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

-- Then the table with the foreign key first.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  author_name text,
-- The foreign key name is always {other_table_singular}_id
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);

TRUNCATE TABLE posts, comments RESTART IDENTITY;

INSERT INTO posts (title, content) VALUES 
('Post 1', 'Some content'),
('Post 2', 'More content');

INSERT INTO comments (content, author_name, post_id) VALUES 
('Comment 1', 'Author 1', 1),
('Comment 2', 'Author 2', 1),
('Comment 1', 'Author 1', 2);