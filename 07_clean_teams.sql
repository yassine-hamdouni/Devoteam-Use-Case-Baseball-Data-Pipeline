CREATE OR REPLACE TABLE `devoteam-use-case.clean.clean_teams` AS
SELECT DISTINCT
  homeTeamId AS teamId,
  homeTeamName AS teamName
FROM `devoteam-use-case.raw.schedules`
UNION DISTINCT
SELECT DISTINCT
  awayTeamId,
  awayTeamName
FROM `devoteam-use-case.raw.schedules`;
