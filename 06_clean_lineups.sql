CREATE OR REPLACE TABLE `devoteam-use-case.clean.clean_lineups` AS
SELECT DISTINCT
  gameId,
  lineupTeamId AS teamId,
  lineupPlayerId AS playerId,
  lineupPosition AS fieldPosition,
  lineupOrder AS battingOrder
FROM `devoteam-use-case.raw.games_wide`
WHERE lineupPlayerId IS NOT NULL;
