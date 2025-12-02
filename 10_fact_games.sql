CREATE OR REPLACE TABLE `devoteam-use-case.analytics.fact_games` AS
SELECT
  gameId,
  gameNumber,
  seasonId,
  year,
  gameType,
  dayNight,
  duration_minutes,
  homeTeamId,
  awayTeamId,
  attendance,
  gameDate,
  gameMonth
FROM `devoteam-use-case.clean.clean_games`;
