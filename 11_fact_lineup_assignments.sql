CREATE OR REPLACE TABLE `devoteam-use-case.analytics.fact_lineup_assignments` AS
SELECT
  l.gameId,
  l.teamId,
  l.playerId,
  l.fieldPosition,
  l.battingOrder,
  CASE WHEN b.playerId IS NOT NULL THEN TRUE ELSE FALSE END AS isBatter,
  CASE WHEN f.playerId IS NOT NULL THEN TRUE ELSE FALSE END AS isFielder
FROM `devoteam-use-case.clean.clean_lineups` l
LEFT JOIN `devoteam-use-case.clean.clean_batters` b
  ON l.gameId = b.gameId AND l.playerId = b.playerId
LEFT JOIN `devoteam-use-case.clean.clean_fielders` f
  ON l.gameId = f.gameId AND l.playerId = f.playerId;
