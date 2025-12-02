CREATE OR REPLACE TABLE `devoteam-use-case.clean.clean_batters` AS
SELECT
  gameId,
  CASE WHEN batter_col LIKE 'away%' THEN 'away' ELSE 'home' END AS teamType,
  batter_col AS battingPosition,
  batter AS playerId
FROM `devoteam-use-case.raw.games_wide`
UNPIVOT (
  batter FOR batter_col IN (
    awayBatter1, awayBatter2, awayBatter3, awayBatter4, awayBatter5,
    awayBatter6, awayBatter7, awayBatter8, awayBatter9,
    homeBatter1, homeBatter2, homeBatter3, homeBatter4, homeBatter5,
    homeBatter6, homeBatter7, homeBatter8, homeBatter9
  )
)
WHERE batter IS NOT NULL;
