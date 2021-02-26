-- CREATING SCHEMA 
create schema `f_assignment`;
use f_assignment;
SET SQL_SAFE_UPDATES = 0;
##################################################################

-- IMPORTING CSV FILES USING TABLE DATA IMPORT WIZARD
-- VERIFYING IMPORTED TABLES
show tables;

####################################################################

-- CHECKING AND REMOVING EXTRA TABLES
drop table if exists `bajaj1`;
drop table if exists `bajaj2`;
drop table if exists `eicher1`;
drop table if exists `eicher2`;
drop table if exists `hero1`;
drop table if exists `hero2`;
drop table if exists `infosys1`;
drop table if exists `infosys2`;
drop table if exists `tcs1`;
drop table if exists `tcs2`;
drop table if exists `tvs1`;
drop table if exists `tvs2`;
drop table if exists `farz_master`;

####################################################################

-- CHECKING TABLES
desc bajaj;
desc eicher;
desc tcs;
desc tvs;
desc hero;
desc infosys;

####################################################################

-- LOOKING AT THE DATA IN TABLE
select * from bajaj;
select * from eicher;
select * from tcs;
select * from hero;
select * from infosys;
select * from tvs;

####################################################################

-- GETTING DATA AS NUMBER
DELIMITER $$
create function catch_date(file_date varchar(20))
returns  varchar(2) deterministic
BEGIN 
declare format_date varchar(2);
if file_date='January' then
	set format_date= '1';
elseif  file_date='February' then
	set format_date= '2';
elseif file_date='March' then
	set format_date= '3';
elseif file_date='April' then
	set format_date= '4';
elseif  file_date='May' then
	set format_date= '5';
elseif file_date='June' then
	set format_date= '6';
elseif file_date='July' then
	set format_date= '7';
elseif  file_date='August' then
	set format_date= '8';
elseif file_date='September' then
	set format_date='9';
elseif file_date='October' then
	set format_date='10';
elseif  file_date='November' then
	set format_date= '11';
else
	set format_date= '12';
end if;
return format_date;
END $$

-- RETURNING MONTH 
DELIMITER $$
create function catch_month(date varchar(20))
returns varchar(20) deterministic
BEGIN
return (select SUBSTRING_INDEX(SUBSTRING_INDEX(Date,'-',2),'-',-1));
END $$
DELIMITER ;


-- GETTING DATES IN CORRECT FORMAT 
 update bajaj
 set Date=(select replace(Date,catch_month(Date),catch_date(catch_month(Date)))); 
 update eicher
 set Date=(select replace(Date,catch_month(Date),catch_date(catch_month(Date))));
 update tcs
 set Date=(select replace(Date,catch_month(Date),catch_date(catch_month(Date))));
 update tvs
 set Date=(select replace(Date,catch_month(Date),catch_date(catch_month(Date))));
  update hero
 set Date=(select replace(Date,catch_month(Date),catch_date(catch_month(Date))));
 update infosys
 set Date=(select replace(Date,catch_month(Date),catch_date(catch_month(Date))));
 
-- USING STR_TO_DATE TO GET DATE 
 
update bajaj
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table bajaj
modify `Date` date ;

update eicher
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table eicher
modify `Date` date ;

update tcs
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table tcs
modify `Date` date ;

update tvs
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table tvs
modify `Date` date ;

update hero
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table hero
modify `Date` date ;

update infosys
set `Date`=  str_to_date(`Date`,'%d-%m-%Y');
alter table infosys
modify `Date` date ;
####################################################################

-- TASK 1:Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. 
-- (This has to be done for all 6 stocks)

-- CREATING TABLE BAJAJ1
create table bajaj1 as
	select `Date`,`Close Price`,
avg(`Close Price`) over(order by `Date` rows between 19 preceding and current row) as '20 Day MA',
avg(`Close Price`) over(order by `Date` rows between 49 preceding and current row) as '50 Day MA'
 from bajaj;
 
 -- CREATING TABLE EICHER1
 create table eicher1 as
	select `Date`,`Close Price`,
avg(`Close Price`) over(order by `Date` rows between 19 preceding and current row) as '20 Day MA',
avg(`Close Price`) over(order by `Date` rows between 49 preceding and current row) as '50 Day MA'
 from eicher;
 
 -- CREATING TABLE TCS1
 Create table tcs1
 select `Date`,`Close price`,
 avg(`Close price`) over(order by `Date` rows  between 19 preceding and current row) as '20 Day MA',
 avg(`Close price`) over(order by `Date` rows  between 49 preceding and current row) as '50 Day MA'
 from tcs;
 
 -- CREATING TABLE TVS1
 Create table tvs1
 select `Date`,`Close price`,
 avg(`Close price`) over(order by `Date` rows  between 19 preceding and current row) as '20 Day MA',
 avg(`Close price`) over(order by `Date` rows  between 49 preceding and current row) as '50 Day MA'
 from tvs;
 
  -- CREATING TABLE HERO1
 create table hero1 as
	select `Date`,`Close Price`,
avg(`Close Price`) over(order by `Date` rows between 19 preceding and current row) as '20 Day MA',
avg(`Close Price`) over(order by `Date` rows between 49 preceding and current row) as '50 Day MA'
 from hero;
 
 -- CREATING TABLE INFOSYS1
 Create table infosys1
 select `Date`,`Close price`,
 avg(`Close price`) over(order by `Date` rows  between 19 preceding and current row) as '20 Day MA',
 avg(`Close price`) over(order by `Date` rows  between 49 preceding and current row) as '50 Day MA'
 from infosys;
 
 ####################################################################
 -- EXCLUDING 1ST 19 VALUES
 update bajaj1
 set `20 Day MA` = NULL limit 19;
 update eicher1
 set `20 Day MA` = NULL limit 19;
 update tcs1
 set `20 Day MA` = NULL limit 19;
  update hero1
 set `20 Day MA` = NULL limit 19;
 update infosys1
 set `20 Day MA` = NULL limit 19;
 update tvs1
 set `20 Day MA` = NULL limit 19;
 
 -- EXCLUDING 1ST 49 VALUES AS NULL
 update bajaj1
 set `50 Day MA` = NULL limit 49;
 update eicher1
 set `50 Day MA` = NULL limit 49;
 update hero1
 set `50 Day MA` = NULL limit 49;
 update infosys1
 set `50 Day MA` = NULL limit 49;
 update tcs1
 set `50 Day MA` = NULL limit 49;
 update tvs1
 set `50 Day MA` = NULL limit 49;
 ####################################################################
 
 -- LOOKING UP UPDATED TABLES
 select * from bajaj1;
 select * from eicher1;
 select * from tcs1;
 select * from tvs1;
 select * from hero1;
 select * from infosys1;
 ####################################################################
 
 -- Task 2 :Create a master table containing the date and close price of all the six stocks. 
 
 -- CREATING MASTER TABLE FOR TASK 2
 
 create table farz_master
 select tcs.`Date`,b.`Close price` as 'Bajaj',
 tcs.`Close price` as 'TCS' ,tvs.`Close price` as 'TVS',
 i.`Close price` as 'Infosys',e.`Close price` as 'Eicher',
 h.`Close price` as 'Hero'
 from tcs  inner join eicher e on e.`Date`=tcs.`Date`
 inner join  tvs tvs on tvs.`Date`= tcs.`Date`
 inner join  hero h on h.`Date` = tcs.`Date`
 inner join  bajaj b on b.`Date`=tcs.`Date`
 inner join  infosys i on i.`Date`=tcs.`Date` order by tcs.`Date`;
 
 -- CHECKING MASTER TABLE
 select * from farz_master;
####################################################################

 -- Task 3 :Use the table created in Part(1) to generate buy and sell signal. 
 -- Store this in another table named 'bajaj2'. Perform this operation for all stocks.
 
 -- CREATING TABLE BAJAJ2
create table bajaj2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from bajaj1;
 
 -- CREATING TABLE EICHER2
 create table eicher2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from eicher1;
 
 -- CREATING TABLE TCS2
 create table tcs2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from tcs1 ;
 
 -- CREATING TABLE TVS2
 create table tvs2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from tvs1;
 
 -- CREATING TABLE HERO2
 create table hero2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from hero1;
 
 -- CREATING TABLE INFY2
 create table infosys2
 select `Date`,`Close price`,
 case 
 when `50 Day MA` is NULL then 'NA'
 when `20 Day MA`>`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))<(lag(`50 Day MA`,1) over(order by `Date`))) then 'BUY'
 when `20 Day MA`<`50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`))>(lag(`50 Day MA`,1) over(order by `Date`))) then 'SELL'
 else 'HOLD' 
 end as `Signal`
 from infosys1;
 
 -- LOOKING UP DATA
 
 select * from bajaj2;
 select * from eicher2;
 select * from hero2;
 select * from infosys2;
 select * from tcs2;
 select * from tvs2;
 ####################################################################
 
 
 
 -- Task 4 Create a User defined function, that takes the date as input and 
 -- returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.
 
 DELIMITER $$
 create function fetch_signal(signal_date date)
 returns varchar(20) deterministic
 BEGIN
 return (select `Signal` from bajaj2 where bajaj2.`Date` = signal_date);
 END $$
 
 -- CHECKING FETCH_SIGNAL FN 
  DELIMITER ;
 select fetch_signal(`Date`),`Date` as 'Signal' from bajaj;
 
  select fetch_signal('2015-01-01');
 -- EXPECTED OUTPUT HERE IS NA
 
 select fetch_signal('2018-06-21');
 -- EXPECTED OUTPUT HERE IS BUY
 
  select fetch_signal('2018-05-30');
 -- EXPECTED OUTPUT HERE IS HOLD
 
 select fetch_signal('2018-05-29');
 -- EXPECTED OUTPUT HERE IS SELL
 
####################################################################
 
 -- Task 5 Write a brief summary of the results obtained and what inferences you can draw from the analysis performed.
 -- Getting the number of times bought and sold
 
 select count(*) from bajaj2 where `Signal`='SELL';
 select count(*) from bajaj2 where `Signal`='BUY';
 select * from bajaj2 where `Signal`='BUY' or `Signal`='SELL';
 
 select * from tcs2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from tcs2 where `Signal`='SELL';
 select count(*) from tcs2 where `Signal`='BUY';
 
 select * from eicher2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from eicher2 where `Signal`='SELL';
 select count(*) from eicher2 where `Signal`='BUY';
  
 select * from tvs2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from tvs2 where `Signal`='SELL';
 select count(*) from tvs2 where `Signal`='BUY';
  
 select * from hero2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from hero2 where `Signal`='SELL';
 select count(*) from hero2 where `Signal`='BUY';
  
 select * from infosys2 where `Signal`='BUY' or `Signal`='SELL';
 select count(*) from infosys2 where `Signal`='SELL';
 select count(*) from infosys2 where `Signal`='BUY';
 
 -- CHECKING OUT THE DIRECTION OF STOCKS
 
 select (select `Close price` from bajaj  order by `Date` desc limit 1) - (select `Close price` from bajaj  order by `Date`  limit 1) as 'BAJAJ_DIRECTION';
 select (select `Close price` from tcs  order by `Date` desc limit 1) - (select `Close price` from tcs  order by `Date`  limit 1) as 'TCS_DIRECTION';
 select (select `Close price` from eicher order by `Date` desc limit 1) - (select `Close price` from eicher order by `Date`  limit 1) as 'EICHER_DIRECTION';
 select (select `Close price` from tvs order by `Date` desc limit 1) - (select `Close price` from tvs order by `Date`  limit 1) as 'TVS_DIRECTION';
 select (select `Close price` from infosys  order by `Date` desc limit 1) - (select `Close price` from infosys  order by `Date`  limit 1) as 'INFY_DIRECTION';
 select (select `Close price` from hero  order by `Date` desc limit 1) - (select `Close price` from hero  order by `Date`  limit 1) as 'HERO_DIRECTION'; 
 ####################################################################
 