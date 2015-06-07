CREATE TABLE IF NOT EXISTS game (
    id serial  NOT NULL,
    title text  NOT NULL,
    release_year integer  NOT NULL,
    developers text  NOT NULL,
    publishers text  NOT NULL,
    boxart_front text  NOT NULL,
    boxart_spine text  NOT NULL,
    CONSTRAINT game_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS content (
    id serial  NOT NULL,
    title text  NOT NULL,
    description text  NOT NULL,
    boxart_back text  NOT NULL,
    game_id bigserial  REFERENCES game (id),
    CONSTRAINT content_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
    id serial  NOT NULL,
    name text  NOT NULL,
    password text  NOT NULL,
    public_profile boolean  NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users_content (
    id serial  NOT NULL,
    content_id serial  REFERENCES content (id),
    users_id bigserial  REFERENCES users (id),
    CONSTRAINT users_content_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS price (
    id serial  NOT NULL,
    price int  NOT NULL,
    game_id bigserial  REFERENCES game (id),
    users_id bigserial  REFERENCES users (id),
    CONSTRAINT price_pk PRIMARY KEY (id)
);

INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine)
SELECT 
    'Leisure Suit Larry in the Land of the Lounge Lizards',
    '1987',
    'Sierra On-Line',
    'Sierra On-Line',
    'lsl1_front.jpg',
    'lsl1_spine.jpg'
WHERE
    NOT EXISTS (
        SELECT id FROM game WHERE title = 'Leisure Suit Larry in the Land of the Lounge Lizards'
    );

INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine)
SELECT 
    'Leisure Suit Larry Goes Looking for Love (in Several Wrong Places)',
    '1988',
    'Sierra On-Line',
    'Sierra On-Line',
    'lsl2_front.jpg',
    'lsl2_spine.jpg'
WHERE
    NOT EXISTS (
        SELECT id FROM game WHERE title = 'Leisure Suit Larry Goes Looking for Love (in Several Wrong Places)'
    );

INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine)
SELECT  
    'Maniac Mansion',
    '1987',
    'Lucasfilm Games',
    'Lucasfilm Games',
    'mm_front.jpg',
    'mm_spine.jpg'
WHERE
    NOT EXISTS (
        SELECT id FROM game WHERE title = 'Maniac Mansion'
    );