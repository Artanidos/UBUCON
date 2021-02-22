CREATE TABLE location 
(
    uuid CHAR(52) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    tags VARCHAR(250) NOT NULL,
    description TEXT NOT NULL,
    coordinates point NOT NULL,
    status INT NOT NULL
);
