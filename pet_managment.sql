DROP DATABASE IF EXISTS TREE8_PET_MANAGER;
CREATE DATABASE IF NOT EXISTS TREE8_PET_MANAGER;

USE TREE8_PET_MANAGER;

CREATE TABLE owners(
id int auto_increment not null,
ownerName varchar(100) not null,
age integer not null,
email varchar(200) unique,
primary key(id)
);

create table petTypes(
id int auto_increment not null,
typeName varchar(100) not null,
primary key(id)
);

create table if not exists pets (
id int auto_increment not null,
petName varchar(100) not null,
age int not null,
weight double not null,
ownerId int,
petTypeId int not null,
primary key(id),
foreign key(ownerId) references owners(id),
foreign key(petTypeId) references petTypes(id)
);

create table if not exists meals (
id INT auto_increment not null,
mealName varchar(100) not null,
descript text,
calories double,
petTypeId INT,
primary key(id),
foreign key (petTypeId) references petTypes(Id)
);

create table if not exists toys (
id int auto_increment not null,
material varchar(100) not null,
toyName varchar(100),
descript text,
price double not null,
petTypeId int,
primary key(id),
foreign key(petTypeId) references petTypes(id)
);

insert into owners(ownerName, age, email)
values("John", 23, "john@email.com"); 

insert into owners(ownerName, age, email)
values
("Mary", 24, "mary@email.com"),
("Anna", 25, "anna@email.com"),
("Peter", 26, "peter@email.com"),
("Martin", 18, "martin@email.com"),
("Rain", 45, "rain@email.com"),
("Liis", 9, "liis@email.com"); 

insert into petTypes (typeName)
values
("cat"),
("dog"),
("mouse"),
("rabbit");

insert into pets (petName, age, weight, ownerId, petTypeId)
values
("Kitty", 2, 12.22, 6, 1),
("Fluffy", 1, 2.22, 5, 3),
("Rex", 4, 10.55, 4, 2),
("Muri", 3, 11.76, null, 2),
("Marshmellow", 2, 8.32, 1, 4),
("Paws", 2, 7.22, null, 1),
("Wookiee", 2, 13.22, 3, 2),
("Mickey", 2, 5.22, 5, 3),
("Bugs", 2, 6.22, null, 4);

insert into toys (material, toyName, price, petTypeID, descript)
values
("fabric", "chewy toy", 9.99, 1, "fabric mouse"),
("wood", "cat toy", 10.99, 1, "ball"),
("plastic", "chewy toy", 7.99, 2, "chewy pig"),
("plastic", "chewy toy", 8.99, 2, "chewy chicken"),
("plastic", "round toy", 9.99, 3, "ball"),
("plastic", "exercise wheel", 15.99, 4, "wheel for exercising");

insert into meals (calories, mealName, petTypeId, descript)
values
(100, "grass", 4, "good grass"),
(120, "carrot", 4, "good carrot"),
(200, "fish", 1, "fish"),
(200, "chicken", 2, "chicken"),
(100, "broccoli", 1, "raw broccoli");

alter table owners add createdAt timestamp default current_timestamp;
alter table petTypes add createdAt timestamp default current_timestamp;
alter table meals add createdAt timestamp default current_timestamp;
alter table toys add createdAt timestamp default current_timestamp;
alter table pets add createdAt timestamp default current_timestamp;

alter table pets drop column weight;
alter table meals drop column descript;
alter table meals add descript varchar(200);

select * from owners;
select * from petTypes;
select * from pets;
select * from toys;
select * from meals;

/* Select all pets with owner and the owner information*/
SELECT * FROM owners 
INNER JOIN pets 
ON owners.id = pets.ownerId;

/* Select all pets without owners */
SELECT * FROM pets where pets.ownerId is null;

/* Select all pets that match a given pet type*/
SELECT * FROM pets where pets.petTypeId = 3;

/* Select specific pet information, owner information and pet type information */
SELECT * FROM owners 
INNER JOIN pets 
ON owners.id = pets.ownerId
where pets.age = 2
and owners.age = 25
and pets.petTypeId = 2;

/* select all meals that matches a given pet type  */
SELECT * FROM meals where meals.petTypeId = 2;

/* select all toys that matches a given pet type  */
SELECT * FROM toys where toys.petTypeId = 3;