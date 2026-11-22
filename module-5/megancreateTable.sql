USE CSD430;

CREATE TABLE meganmoviesdata (
    movie_id     INT NOT NULL AUTO_INCREMENT,
    title        VARCHAR(100) NOT NULL,
    director     VARCHAR(60),
    release_year INT,
    genre        VARCHAR(30),
    rating       VARCHAR(5),
    PRIMARY KEY (movie_id)
);