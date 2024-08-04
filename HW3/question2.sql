-- viwes
    -- PART-alef
CREATE VIEW V1 [(SID ,SNAME,MPRICE,ORGID,ORGFIELD,SHID )]
    AS  SELECT symbol.id,symbol.sym_name,(symbol.highest_price+symbol.lowest_price)/2, organization.id ,organization.field,own.shareholder
            FROM symbol
            INNER JOIN organization ON symbol.org = organization.id
            INNER JOIN owns ON owns.sym=symbol.id
    -- PART-be
CREATE VIEW V2[(SHID,SID,SNUMBER)]
    AS  SELECT owns.shareholder,owns.sym,SUM(owns.number)
    FROM owns
    -- PART-jim
CREATE VIEW V3[(PID,PAGE,SGOAL,TID,PCONTRACT)]
    AS  SELECT player.id,player.age,SUM(player_match_stat.goals),contract.team_id,contract.price
            FROM player
            INNER JOIN contract ON contract.player_id=player.id
            INNER JOIN player_match_stat ON player_match_stat.player_id=player.id
            INNER JOIN match ON player_match_stat.match_id=match.id
            INNER JOIN league_season ON league_season.id=match.league_season_id
            WHERE (league_season.season=1400 OR league_season.season=1399 OR league_season.season=1398 OR league_season.season=1397)
            GROUP BY player_match_stat.player_id 
    -- PART-daal
CREATE VIEW V4[(MID,RNAME,RLEVEL,RID,RBIRTH,PID)]
    AS  SELECT top_match.id,referee.name,referee.level,referee.id,referee.birthdate,top_player.player_id
            FROM (SELECT * FROM referee
            INNER JOIN (SELECT match.id as id ,(match.host_team_goals+match.guest_team_goals) as total_goals FROM match) as match_total ON match_total.referee_id=referee.id
            ORDER BY total_goals DESC
            FETCH FIRST 50 ROWS ONLY) as top_match
            INNER JOIN (select player_match_stat.match_id as match_id ,player_match_stat.player_id as player_id,MAX(player_match_stat.goals) FROM player_match_stat GROUP BY player_match_stat.match_id) as top_player
            ON (match_total.id=top_player.match_id)
-- querys
   -- PART2-alef
SELECT SUM((symbol.highest_price+symbol.lowest_price)/2)
    FROM symbol
    INNER JOIN owns ON owns.sym=symbol.id 
    WHERE (owns.shareholder='1234');
   -- PART2-be
SELECT (referee.id)
    FROM referee
    INNER JOIN match ON match.referee_id=referee.id
    INNER JOIN player_match_stat ON player_match_stat.match_id=match.id
    WHERE(player_match_stat.player_id='1234');



    