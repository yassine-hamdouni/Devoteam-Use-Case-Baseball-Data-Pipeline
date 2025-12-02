CREATE OR REPLACE TABLE `devoteam-use-case.clean.clean_fielders` AS
SELECT
  gameId,
  CASE WHEN field_col LIKE 'away%' THEN 'away' ELSE 'home' END AS teamType,
  field_col AS fieldingPosition,
  player AS playerId
FROM `devoteam-use-case.raw.games_wide`
UNPIVOT (
  player FOR field_col IN (
    awayFielder2, awayFielder3, awayFielder4, awayFielder5, awayFielder6,
    awayFielder7, awayFielder8, awayFielder9, awayFielder10,
    awayFielder11, awayFielder12,
    homeFielder1, homeFielder2, homeFielder3, homeFielder4, homeFielder5,
    homeFielder6, homeFielder7, homeFielder8, homeFielder9, homeFielder10,
    homeFielder11, homeFielder12
  )
)
WHERE player IS NOT NULL;
