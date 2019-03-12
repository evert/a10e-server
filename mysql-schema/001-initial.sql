SET NAMES utf8mb4;
START TRANSACTION;

CREATE TABLE changelog (
 id INT UNSIGNED NOT NULL PRIMARY KEY,
 timestamp INT UNSIGNED
);
INSERT INTO changelog VALUES (1, UNIX_TIMESTAMP());

CREATE TABLE users (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  identity VARCHAR(200) NOT NULL,
  nickname VARCHAR(100),
  created INT UNSIGNED NOT NULL,
  active BOOL NOT NULL DEFAULT '0',
  UNIQUE(identity)
);

CREATE TABLE users_auth_log (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  time INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  event_type TINYINT UNSIGNED NOT NULL
);

CREATE TABLE user_passwords (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  password VARBINARY(60) NOT NULL
);

CREATE TABLE user_totp (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  secret VARCHAR(50),
  failures TINYINT UNSIGNED NOT NULL DEFAULT '0',
  UNIQUE(user_id)
);

COMMIT;