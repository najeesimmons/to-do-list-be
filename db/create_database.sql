DROP DATABASE IF EXISTS to_do_list;
CREATE DATABASE to_do_list;

\c to_do_list;

CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50) NOT NULL, 
    password TEXT NOT NULL,
    todo_id int,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS todos(
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    completed_at TIMESTAMPTZ,
    status TEXT DEFAULT 'incomplete',
    task TEXT NOT NULL,
    user_id int REFERENCES users(id)
);

ALTER TABLE users ADD FOREIGN KEY (todo_id) REFERENCES todos(id);