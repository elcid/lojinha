# Items schema
# --- !Ups

CREATE SEQUENCE user_id_seq;
CREATE TABLE _user (
    id INTEGER NOT NULL DEFAULT nextval('user_id_seq'),
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    passwd VARCHAR(255) NOT NULL
);
INSERT INTO _user(email, name, passwd) VALUES('admin@lojinha.com', 'jcranky', '1234');

CREATE SEQUENCE category_id_seq;
CREATE TABLE category (
    id INTEGER NOT NULL DEFAULT nextval('category_id_seq'),
    display_name varchar(255) UNIQUE,
    url_name varchar(64) UNIQUE
);

CREATE SEQUENCE item_id_seq;
CREATE TABLE item (
    id INTEGER NOT NULL DEFAULT nextval('item_id_seq'),
    name varchar(255),
    description varchar(2048),
    imageKeys varchar(1024),
    created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    min_value NUMERIC(8,2) NOT NULL,
    sold BOOLEAN DEFAULT FALSE,
    deleted BOOLEAN DEFAULT FALSE,
    category_id INTEGER NOT NULL
);

CREATE SEQUENCE bid_id_seq;
CREATE TABLE bid (
    id INTEGER NOT NULL DEFAULT nextval('bid_id_seq'),
    bidder_email varchar(255) NOT NULL,
    value NUMERIC(8,2),
    dateTime TIMESTAMP NOT NULL,
    notify_better_bids BOOLEAN NOT NULL DEFAULT false,
    item_id INTEGER NOT NULL
);

CREATE TABLE feed_stats (
    origin VARCHAR(255) UNIQUE NOT NULL,
    download_count INTEGER NOT NULL
);

# --- !Downs

DROP TABLE user;
DROP SEQUENCE user_id_seq;

DROP TABLE category;
DROP SEQUENCE category_id_seq;

DROP TABLE item;
DROP SEQUENCE item_id_seq;

DROP TABLE bid;
DROP SEQUENCE bid_id_seq;

DROP TABLE feed_stats;
