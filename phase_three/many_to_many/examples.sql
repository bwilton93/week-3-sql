-- Select all the tags associated with a given post.
-- Note how we're using two different joins to "link"
-- all the three tables together:
--    * first, by matching only records in the join table for the given post
--    * second, by matching only tags for these records in the join table
SELECT tags.id, tags.name, post.title
  FROM tags 
    JOIN posts_tags ON posts_tags.tag_id = tags.id
    JOIN posts ON posts_tags.post_id = posts.id
    WHERE posts.id = 2;

-- #1
-- Use a SELECT query with a JOIN to retrieve all the posts associated with the tag 'travel'.

SELECT posts.id, posts.title
  FROM posts
    JOIN posts_tags ON posts_tags.post_id = posts.id
    JOIN tags ON posts_tags.tag_id = tags.id
    WHERE tags.id = 2;

-- #2
-- Use SQL to insert a new tag 'sql' and associate the post titled 'SQL basics' with this tag.
-- Then use a SELECT query with a JOIN to retrieve all posts associated with the tag 'sql' and verify the above worked.

INSERT INTO tags (name) VALUES ('sql')
INSERT INTO posts_tags (post_id, tags_id) VALUES (7, 6)

SELECT posts.id, posts.title
  FROM posts
    JOIN posts_tags ON posts_tags.post_id = posts.id
    JOIN tags ON posts_tags.tag_id = tags.id
    WHERE tags.id = 6;