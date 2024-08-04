DROP DATABASE IF EXISTS footbal;
CREATE DATABASE footbal; 
USE footbal;

CREATE TABLE team (
    id VARCHAR(10) PRIMARY KEY,
    persian_name VARCHAR(40),
    establish_date SMALLINT,
    english_name VARCHAR(40),
    phone_number VARCHAR(11),
    stadium_address VARCHAR(100),
    stadium_name VARCHAR(40)
);

CREATE TABLE league (
    id VARCHAR(10) PRIMARY KEY,
    persian_name VARCHAR(40),
    level TINYINT,
    english_name VARCHAR(40)
);

CREATE TABLE player (
    id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(40),
    nationality VARCHAR(3),
    birth_year SMALLINT,
    gender BOOL,
    age TINYINT
);

create table league_season(
    id VARCHAR(10) PRIMARY KEY,
    season SMALLINT not null,
    league_id VARCHAR(10),
    foreign key (league_id) references league(id)
);

CREATE TABLE referee (
    id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(40),
    level TINYINT,
    birthdate DATE
);

CREATE TABLE `match` (
    id VARCHAR(10) PRIMARY KEY,
    host_team_id VARCHAR(10),
    guest_team_id VARCHAR(10),
    league_season_id VARCHAR(10),
    referee_id VARCHAR(10),
    host_team_goals TINYINT,
    guest_team_goals TINYINT,
    result VARCHAR(1) not null, -- L, W, E
    foreign key (host_team_id) references team(id),
    foreign key (guest_team_id) references team(id),
    foreign key (league_season_id) references league_season(id),
    foreign key (referee_id) references referee(id)
);

CREATE TABLE player_match_stat (
    player_id VARCHAR(10),
    match_id VARCHAR(10),
    goals TINYINT DEFAULT 0,
    duration TINYINT DEFAULT 0,
    passes TINYINT DEFAULT 0,
    fouls TINYINT DEFAULT 0,
    score TINYINT DEFAULT 0,
    foreign key (player_id) references player(id),
    foreign key (match_id) references `match`(id),
    CONSTRAINT p1 PRIMARY KEY (player_id, match_id)
);

CREATE TABLE contract (
    id VARCHAR(10) PRIMARY KEY,
    player_id VARCHAR(10),
    team_id VARCHAR(10),
    duration TINYINT, -- year
    price VARCHAR(40), -- in $
    foreign key (player_id) references player(id),
    foreign key (team_id) references team(id)
);

-- INSERTS
INSERT INTO `footbal`.`team` (`id`, `persian_name`, `establish_date`, `english_name`, `phone_number`, `stadium_address`, `stadium_name`) VALUES ('100', 'پرسپولیس', '1963', 'perspolis', '02166545654', 'West of Tehran near Ekbatan district', 'azadi');
INSERT INTO `footbal`.`team` (`id`, `persian_name`, `establish_date`, `english_name`, `phone_number`, `stadium_address`, `stadium_name`) VALUES ('101', 'بارسلونا', '1899', 'barcelona', '34902189900', 'Av. Arístides Maillol s/n 08028 Barcelona', 'camp nue');
INSERT INTO `footbal`.`team` (`id`, `persian_name`, `establish_date`, `english_name`, `phone_number`, `stadium_address`, `stadium_name`) VALUES ('102', 'استقلال', '1945', 'esteghlal', '02144056798', 'West of Tehran near Ekbatan district', 'azadi');
INSERT INTO `footbal`.`team` (`id`, `persian_name`, `establish_date`, `english_name`, `phone_number`, `stadium_address`, `stadium_name`) VALUES ('103', 'رئال مادرید', '1902', 'real madrid', '34913984377', 'Chamartín Madrid Spain', 'Santiago Bernabéu');
INSERT INTO `footbal`.`league` (`id`, `persian_name`, `level`, `english_name`) VALUES ('01', 'خلیج فارس', '1', 'persian gulf');
INSERT INTO `footbal`.`league` (`id`, `persian_name`, `level`, `english_name`) VALUES ('02', 'لالیگا', '2', 'la liga');
INSERT INTO `footbal`.`player` (`id`, `name`, `nationality`, `birth_year`, `gender`, `age`) VALUES ('11', 'vahid amiri', 'IR', '1988', '1', '33');
INSERT INTO `footbal`.`player` (`id`, `name`, `nationality`, `birth_year`, `gender`, `age`) VALUES ('03', 'Gerard Piqué ', 'SPN', '1987', '1', '34');
INSERT INTO `footbal`.`player` (`id`, `name`, `nationality`, `birth_year`, `gender`, `age`) VALUES ('21', 'Voria Ghafouri ', 'IR', '1987', '1', '34');
INSERT INTO `footbal`.`player` (`id`, `name`, `nationality`, `birth_year`, `gender`, `age`) VALUES ('10', 'eden hazard', 'BLG', '1991', '1', '30');
INSERT INTO `footbal`.`league_season` (`id`, `season`, `league_id`) VALUES ('01', '1400', '01');
INSERT INTO `footbal`.`league_season` (`id`, `season`, `league_id`) VALUES ('02', '2021', '02');
INSERT INTO `footbal`.`referee` (`id`, `name`, `level`) VALUES ('11', 'alireza faghani', '1');
INSERT INTO `footbal`.`match` (`id`, `host_team_id`, `guest_team_id`, `league_season_id`, `referee_id`, `host_team_goals`, `guest_team_goals`, `result`) VALUES ('01', '100', '101', '01', '11', '3', '0', 'W');
INSERT INTO `footbal`.`match` (`id`, `host_team_id`, `guest_team_id`, `league_season_id`, `referee_id`, `host_team_goals`, `guest_team_goals`, `result`) VALUES ('02', '103', '101', '02', '11', '2', '1', 'L');
INSERT INTO `footbal`.`match` (`id`, `host_team_id`, `guest_team_id`, `league_season_id`, `referee_id`, `host_team_goals`, `guest_team_goals`, `result`) VALUES ('03', '102', '100', '01', '11', '1', '1', 'E');
INSERT INTO `footbal`.`match` (`id`, `host_team_id`, `guest_team_id`, `league_season_id`, `referee_id`, `host_team_goals`, `guest_team_goals`, `result`) VALUES ('04', '102', '103', '02', '11', '0', '4', 'L');
INSERT INTO `footbal`.`match` (`id`, `host_team_id`, `guest_team_id`, `league_season_id`, `referee_id`, `host_team_goals`, `guest_team_goals`, `result`) VALUES ('05', '100', '103', '01', '11', '3', '1', 'W');
INSERT INTO `footbal`.`player_match_stat` (`player_id`, `match_id`, `goals`, `duration`, `passes`, `fouls`, `score`) VALUES ('11', '01', '3', '94', '127', '2', '9.8');
INSERT INTO `footbal`.`player_match_stat` (`player_id`, `match_id`, `goals`, `duration`, `passes`, `fouls`, `score`) VALUES ('10', '02', '2', '91', '96', '4', '8.9');
INSERT INTO `footbal`.`player_match_stat` (`player_id`, `match_id`, `goals`, `duration`, `passes`, `fouls`, `score`) VALUES ('21', '03', '0', '86', '110', '7', '7.5');
INSERT INTO `footbal`.`player_match_stat` (`player_id`, `match_id`, `goals`, `duration`, `passes`, `fouls`, `score`) VALUES ('10', '04', '3', '90', '86', '1', '10');
INSERT INTO `footbal`.`player_match_stat` (`player_id`, `match_id`, `goals`, `duration`, `passes`, `fouls`, `score`) VALUES ('11', '05', '1', '81', '72', '0', '7');
INSERT INTO `footbal`.`contract` (`id`, `player_id`, `team_id`, `duration`, `price`) VALUES ('01', '03', '101', '2', '250000000');
INSERT INTO `footbal`.`contract` (`id`, `player_id`, `team_id`, `duration`, `price`) VALUES ('02', '10', '103', '4', '700000000');
INSERT INTO `footbal`.`contract` (`id`, `player_id`, `team_id`, `duration`, `price`) VALUES ('03', '11', '100', '5', '30000000');
INSERT INTO `footbal`.`contract` (`id`, `player_id`, `team_id`, `duration`, `price`) VALUES ('04', '21', '102', '1', '2500000');

-- question 1
SELECT 
    league.persian_name,
    league.english_name,
    league_season.season,
    team.persian_name,
    team.english_name
FROM
    league
        JOIN
    league_season ON league.id = league_season.id
        JOIN
    team
WHERE
    team.english_name = 'perspolis'
        AND league.persian_name = 'خلیج فارس'
        AND league.english_name = 'persian gulf'
        AND league_season.season = '1400'
        AND team.persian_name = 'پرسپولیس';
        
-- question 2
SELECT 
    host_team_id,
    guest_team_id,
    referee_id,
    team.id,
    team.english_name,
    team.persian_name,
    league.persian_name,
    league.english_name
FROM
    `match`
        JOIN
    team ON host_team_id = 100
        AND guest_team_id = 101
        AND team.id = 100
        JOIN
    league
WHERE
    league.persian_name = 'خلیج فارس'
        AND league.english_name = 'persian gulf';
        
-- question 4
SELECT SUM(price),gender
FROM contract
JOIN player ON gender = 1

-- quetion 5




    
  

