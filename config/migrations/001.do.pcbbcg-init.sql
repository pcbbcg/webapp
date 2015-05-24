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