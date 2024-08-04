DROP DATABASE IF EXISTS `soccer`;
CREATE DATABASE `soccer`; 
USE `soccer`;

CREATE TABLE `season` (
    year INT(4) NOT NULL,
    PRIMARY KEY (`year`)
);
INSERT INTO `season` VALUES ('2000');
INSERT INTO `season` VALUES ('2015');
INSERT INTO `season` VALUES ('2018');
INSERT INTO `season` VALUES ('2021');

CREATE TABLE `match` (
    Number_of_HostGoals INT(10) NOT NULL,
    Number_of_GuestGoals INT(10) NOT NULL,
    game_number INT(10) NOT NULL,
    PRIMARY KEY (`game_number`)
);
INSERT INTO `match` VALUES ('3','0','3');
INSERT INTO `match` VALUES ('1','1','4');
INSERT INTO `match` VALUES ('0','1','2');
INSERT INTO `match` VALUES ('0','4','1');
INSERT INTO `match` VALUES ('5','0','5');

CREATE TABLE `league` (
    grade VARCHAR(1) NOT NULL,
    latin_name VARCHAR(20) NOT NULL,
    number_of_teams INT(2) NOT NULL,
    league_id INT(20) NOT NULL,
    game_number INT(20) NOT NULL,
    PRIMARY KEY (`league_id` , `game_number`),
    FOREIGN KEY (`game_number`)
        REFERENCES `match` (`game_number`)
);
INSERT INTO `league` VALUES ('A','la liga','18','1','1');
INSERT INTO `league` VALUES ('B','serie B','18','2','2');
INSERT INTO `league` VALUES ('A','premier league','20','3','3');
INSERT INTO `league` VALUES ('A','bundesliga','16','4','4');

CREATE TABLE `player` (
    Nationality VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    player_id INT(4) NOT NULL,
    Name VARCHAR(10) NOT NULL,
    PRIMARY KEY (player_id)
);
INSERT INTO `player` VALUES ('iran','1998-03-11','male','20','reza');
INSERT INTO `player` VALUES ('germany','1999-07-21','male','34','tony');
INSERT INTO `player` VALUES ('england','1997-06-17','female','22','victoria');
INSERT INTO `player` VALUES ('france','1995-12-04','male','3','pogba');
INSERT INTO `player` VALUES ('italy','2001-01-23','feamle','4','angelina');
INSERT INTO `player` VALUES ('belgium','1991-04-19','male','1','hazard');

CREATE TABLE `team` (
    name VARCHAR(20) NOT NULL,
    phone_number INT(20) NOT NULL,
    address VARCHAR(150) NOT NULL,
    stablished_year INT(4) NOT NULL,
    team_id INT(10) NOT NULL,
    latin_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (team_id)
);
INSERT INTO `team` VALUES ('رئال مادرید','002293843','81674 Westerfield Circle','1820','1','real madrid');
INSERT INTO `team` VALUES ('بایرن مونیخ','009334322','0863 Farmco Road','1890','2','bayern munich');
INSERT INTO `team` VALUES ('لیورپول','02133432','096 Pawling Parkway','1870','3','liverpool');
INSERT INTO `team` VALUES ('دورتموند','9905543','34267 Glendale Parkway','1830','4','dortmund');
INSERT INTO `team` VALUES ('پاریسن ژرمن','0554431','Hettinger LLC','1810','5','PSG');

CREATE TABLE `referee` (
  referee_id INT NOT NULL,
  date_of_birth date NOT NULL,
  referee_grade varchar(10) NOT NULL,
  name varchar(10) NOT NULL,
  game_number INT NOT NULL,
  PRIMARY KEY (`referee_id`),
  FOREIGN KEY (`game_number`) REFERENCES `match`(`game_number`)
);
INSERT INTO `referee` VALUES ('1','1978-02-28','master','david','1');
INSERT INTO `referee` VALUES ('2','1985-03-23','master','peiman','2');
INSERT INTO `referee` VALUES ('3','1981-07-05','master','raul','3');
INSERT INTO `referee` VALUES ('4','1983-06-16','master','Cole','4');
INSERT INTO `referee` VALUES ('5','1977-12-11','master','carlos','5');

CREATE TABLE `to_be_held`(
  year INT(4) NOT NULL,
  league_id INT(10) NOT NULL,
  team_id INT(10) NOT NULL,
  game_number INT(10) NOT NULL,
  PRIMARY KEY (`year`, `league_id`, `game_number`),
  FOREIGN KEY (`year`) REFERENCES `season`(`year`),
  FOREIGN KEY (`league_id`, `game_number`) REFERENCES `league`(`league_id`, `game_number`)
);
INSERT INTO `to_be_held` VALUES ('2021','1','1','1');
INSERT INTO `to_be_held` VALUES ('2021','2','2','2');
INSERT INTO `to_be_held` VALUES ('2021','3','3','3');
INSERT INTO `to_be_held` VALUES ('2021','4','4','4');

CREATE TABLE `contract` (
  period INT(10) NOT NULL,  -- period considered in year
  amount INT(100) NOT NULL, -- amount considered in $
  player_id INT(10) NOT NULL,
  team_id INT(10) NOT NULL,
  PRIMARY KEY (`player_id`, `team_id`),
  FOREIGN KEY (`player_id`) REFERENCES `player`(`player_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team`(`team_id`)
);
INSERT INTO `contract` VALUES ('2','400000','1','1');
INSERT INTO `contract` VALUES ('10','80000000','3','3');
INSERT INTO `contract` VALUES ('1','100000','4','4');

CREATE TABLE `playing` (
  Number_of_goals INT(10) NOT NULL,
  Number_of_pass INT(10) NOT NULL,
  Number_of_fault INT(10) NOT NULL,
  score INT(10) NOT NULL,
  MinutesPlayed INT(10) NOT NULL,
  player_id INT(10) NOT NULL,
  game_number INT(10) NOT NULL,
  PRIMARY KEY (`player_id`, `game_number`),
  FOREIGN KEY (`player_id`) REFERENCES `player`(`player_id`),
  FOREIGN KEY (`game_number`) REFERENCES `match`(`game_number`)
);
INSERT INTO `playing` VALUES ('3','470','23','3','90','1','1');
INSERT INTO `playing` VALUES ('1','263','9','3','91','3','3');
INSERT INTO `playing` VALUES ('2','310','13','2','93','4','4');

CREATE TABLE `participate`
(
  team_id INT(10) NOT NULL,
  league_id INT(10) NOT NULL,
  game_number INT(10) NOT NULL,
  PRIMARY KEY (`team_id`, `league_id`, `game_number`),
  FOREIGN KEY (`team_id`) REFERENCES `team`(`team_id`),
  FOREIGN KEY (`league_id`, `game_number`) REFERENCES `league`(`league_id`, `game_number`)
);
INSERT INTO `participate` VALUES ('1','1','1');
INSERT INTO `participate` VALUES ('2','2','2');
INSERT INTO `participate` VALUES ('3','3','3');
INSERT INTO `participate` VALUES ('4','4','4');