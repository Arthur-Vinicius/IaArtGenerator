create database flaskdocker;
use flaskdocker;

create table `flaskdocker`.`users`(
    `id` int not null auto_increment,
    `name` varchar(255),
    primary key (ID)
);