CREATE DATABASE IF NOT EXISTS users_db;

CREATE TABLE IF NOT EXISTS users_db.users (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL, 
    date_created VARCHAR(45) NOT NULL,
    status VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,  
    PRIMARY KEY (id),
    UNIQUE INDEX email_UNIQUE (email ASC));
    
