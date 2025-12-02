CREATE OR REPLACE TABLE `devoteam-use-case.analytics.dim_team` AS
SELECT teamId, teamName
FROM `devoteam-use-case.clean.clean_teams`;

CREATE OR REPLACE TABLE `devoteam-use-case.analytics.dim_player` AS
SELECT playerId
FROM `devoteam-use-case.clean.clean_players`;
