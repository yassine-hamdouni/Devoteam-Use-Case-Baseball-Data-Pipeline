-- Creation Raw layer
CREATE TABLE `devoteam-use-case.raw.games_wide` AS
SELECT * FROM `bigquery-public-data.baseball.games_wide`;

CREATE TABLE `devoteam-use-case.raw.games_post_wide` AS
SELECT * FROM `bigquery-public-data.baseball.games_post_wide`;

CREATE TABLE `devoteam-use-case.raw.schedules` AS
SELECT * FROM `bigquery-public-data.baseball.schedules`;

CREATE TABLE `devoteam-use-case.raw.schedules_copy` AS
SELECT * FROM `bigquery-public-data.baseball.schedules_copy`;
