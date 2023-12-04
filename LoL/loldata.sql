show databases;
use mylol;

desc dsr;
create table dsr(
	gameId BIGINT,
    duration SMALLINT,
    participantId TINYINT,
    championId SMALLINT,
    lane VARCHAR(10),
    side varchar(5),
    win varchar(5),
    damageDealt int,
    damageTaken int,
    gold smallint,
    kills tinyint,
    deaths tinyint,
    assists tinyint,
    g5 smallint,
    g6 smallint,
    g7 smallint,
    g8 smallint,
    g9 smallint,
    g10 smallint,
    g11 smallint,
    g12 smallint,
    g13 smallint,
    g14 smallint,
    g15 smallint,
    g16 smallint,
    g17 smallint,
    g18 smallint,
    g19 smallint,
    g20 smallint,
    g21 smallint,
    g22 smallint,
    g23 smallint,
    g24 smallint,
    g25 smallint,
    g26 smallint,
    g27 smallint,
    g28 smallint,
    g29 smallint,
    g30 smallint,
   primary key(gameId,championId) 
);
drop table cn_kr;
create table cn_kr(
	championId smallint primary key,
    champion_name_kr varchar(10)
);

select champion_name_kr from cn_kr limit 5;

drop table cn_eg;
create table cn_eg(
	championId smallint primary key,
    champion_name varchar(15)
);

SELECT REPLACE(cn_kr, CHAR(10), '') from cn;

select count(*) from dsr;
select count(*) from cn_eg;

LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cn_kr.csv' 
IGNORE
INTO TABLE mylol.cn_kr
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
lines terminated by '\n' STARTING BY ''
IGNORE 1 ROWS;




select * from dsr;
select * from cn_kr;
select * from cn_eg;
delete from dsr where gameid <= 888;
create or replace view CN
as
select kr.championid as cid ,kr.champion_name_kr as cn_kr, eg.champion_name as cn_eg 
from cn_kr kr join cn_eg eg
on kr.championid = eg.championid;

select * from cn;


create or replace view rc
as
select dsr.*,cn.cn_kr, cn.cn_eg
from dsr join cn
on dsr.championid = cn.cid;

select * from rc;







alter table dsr
add constraint fk_dsr_cid foreign key (championId) references cn_kr(championid);



select concat(roung(count(*)/10)) from rc;
select count(distinct gameid) from rc;
select mylol.rc.gameid,count(*)
from rc
group by gameid;

-- 챔피언갯수alter

SELECT distinct LANE FROM DSR;

-- KDA: 챔피언별 (kills+assists)/deaths 통계
select *
from() t1 join () t2
on t1.gameid = t2.gameid and t1.lane = t2.lane
where t1.lane = top;






-- 우리조 시작--------




select * from rc
where (g17=0 or g18=0) and win = 'false'; 



select * from rc;


create or replace view kdawin
as
select cn.cn_eg, cn.cn_kr,dsr.lane, dsr.win, dsr.kills, dsr.deaths, dsr.assists , dsr.g17, dsr.g18
from dsr join cn
on dsr.championid = cn.cid
where g17 = 0 or g18 = 0;

select * from kdawin;




select * from kdawin; 




create or replace view kda
as
select concat((kdawin.kills + kdawin.deaths)/kdawin.deaths) as result from kdawin;

select * from kda;

select * from rc
where lane = 'top' limit 5 ;


select * from cn_kr limit 5;

use mylol;
drop table member;
CREATE TABLE MEMBER(
	ID VARCHAR(20) primary KEY,
    PW VARCHAR(20),
    NAME VARCHAR(20),
    GENDER CHAR(2)
 );
show databases;
desc member;
select * from member;

-- 문의사항 db --
drop table ask;
create table ask(
cnt int primary key auto_increment,
bName varchar(10),
bMessage varchar(100),
bAnswer varchar(100)

);
update ask set bAnswer='답변완료' where cnt =1;
select * from ask;
select * from member;
drop table member;
CREATE TABLE MEMBER(
cnt int primary key auto_increment,
	ID VARCHAR(20) ,
    PW VARCHAR(20),
    NAME VARCHAR(20),
    GENDER CHAR(2)
 );
show databases;
desc member;
select * from member;


