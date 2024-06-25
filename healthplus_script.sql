create database healthplus;
use healthplus;

create table users(userid integer auto_increment, email varchar(100) not null, firstname varchar(50) not null, lastname varchar(50) not null, address varchar(400), contact long, password varchar(64) not null, usertype varchar(40) not null, primary key(userid), unique(email));
select * from users;

create table appointments(appointmentId integer auto_increment, userid integer, date varchar(20), time varchar(20), name varchar(200), type varchar(50), contact varchar(20), address varchar(500), maps varchar(1000), website varchar(1000), primary key(appointmentId));
select * from appointments;

create table services(placeId varchar(200), name varchar(200), type varchar(50), contact varchar(20), address varchar(500), maps varchar(1000), website varchar(1000), rating float, ratingCount integer, primary key(placeId));
select * from services;

-- delete from users;
-- delete from appointments;
-- drop table users;
-- drop table appointments;
-- delete from services;
-- drop table services;