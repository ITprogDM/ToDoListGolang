CREATE TABLE users
(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE todo_lists
(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tittle VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE users_lists
(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    list_id INT REFERENCES todo_lists(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE todo_items
(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tittle VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    done BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE lists_items
(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_id INT REFERENCES todo_items(id) ON DELETE CASCADE NOT NULL,
    list_id INT REFERENCES todo_lists(id) ON DELETE CASCADE NOT NULL
);

