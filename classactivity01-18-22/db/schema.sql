DROP DATABASE IF EXISTS todos_db;

CREATE DATABASE todos_db;

USE todos_db;

CREATE TABLE todos (
    id INT NOT NULL AUTO_INCREMENT, 
    task VARCHAR(30) NOT NULL,
    completed BOOLEAN DEFAULT false,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (id)
);


USE todos_db;

-- INNER JOIN 
SELECT todos.id, task, completed, userId, username FROM todos
-- Will combine the rows where the ON statement matches
INNER JOIN users ON todos.userId = users.id;

-- LEFT JOIN 
SELECT * FROM todos
-- Even if the table on the left doesn't have a match with the LEFT JOIN statement
-- we will still get all of the rows regardless and at the same time,
-- it will still perform a join between the table on the left and the right
-- where the LEFT JOIN statement is true
LEFT JOIN users ON todos.userId = users.id;

-- RIGHT JOIN 
SELECT * FROM todos
-- Even if the table on the right doesn't have a match with the RIGHT JOIN statement
-- we will still get all of the rows regardless and at the same time,
-- it will still perform a join between the table on the left and the right
-- where the RIGHT JOIN statement is true
RIGHT JOIN users ON todos.userId = users.id;


INSERT INTO todos(task)
VALUES ("Take out the trash");