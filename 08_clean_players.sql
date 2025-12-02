CREATE OR REPLACE TABLE `devoteam-use-case.clean.clean_players` AS
SELECT DISTINCT playerId
FROM `devoteam-use-case.clean.clean_batters`
UNION DISTINCT
SELECT DISTINCT playerId
FROM `devoteam-use-case.clean.clean_fielders`
UNION DISTINCT
SELECT DISTINCT playerId
FROM `devoteam-use-case.clean.clean_lineups`;
