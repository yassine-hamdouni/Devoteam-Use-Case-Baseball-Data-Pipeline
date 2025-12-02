CREATE TABLE `devoteam-use-case.clean.clean_games` AS
SELECT
  gameId,
  gameNumber,
  seasonId,
  year,
  type AS gameType,
  dayNight,
  duration_minutes,
  homeTeamId,
  homeTeamName,
  awayTeamId,
  awayTeamName,
  startTime,
  attendance,
  status,
  DATE(startTime) AS gameDate,
  FORMAT_TIMESTAMP('%Y-%m', startTime) AS gameMonth
FROM `devoteam-use-case.raw.schedules`;
