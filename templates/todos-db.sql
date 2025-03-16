CREATE TABLE IF NOT EXISTS todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL
);

INSERT INTO todos (id, text) VALUES
    (1, 'Buy groceries'),
    (2, 'Walk the dog'),
    (3, 'Read a book')
ON DUPLICATE KEY UPDATE
    text = VALUES(text);