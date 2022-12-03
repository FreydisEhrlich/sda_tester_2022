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

insert into pets (petName, age, weight, ownerId, petId)
values
("Kitty", 2, 12.22, 6, 1),
("Fluffy", 1, 2.22, 5, 3),
("Rex", 4, 10.55, 4, 2),
("Muri", 3, 11.76, null, 2),
("Marshmellow", 2, 8.32, 1, 4),
("Paws", 2, 12.22, null, 1),
("Wookiee", 2, 12.22, 3, 2),
("Mickey", 2, 12.22, 5, 3),
("Bugs", 2, 12.22, null, 4);


alter table owners add createdAt timestamp default current_timestamp;
alter table pets drop column weight;

select * from owners;
select * from pets;

/* Select all pets with owner and the owner information*/
/* Select all pets without owners */
/* Select all pets that match a given pet type*/
/* Select specific pet information, owner information and pet type information */