Use LibraryManage

create table Persons(
Id int primary key,
Name nvarchar(33)
)

create table Librarians(
Id int primary key,
HireDate date,
foreign key (id) references Persons(Id)
)

create table LibraryMembers(
Id int primary key,
MemberShipDate date,
Foreign key (id) references Persons(Id)
)

Create table LibraryItems(
Id int primary key,
Title nvarchar(33),
PublicationYear int not null
)

create table Genres(
Id int identity primary key ,
Name nvarchar(33) unique
)

create table Books (
Id int primary key,
GenreId int ,
Name nvarchar(33),
foreign key(id) references LibraryItems(Id),
foreign key(GenreId) references Genres(Id)
)

create table Magazines(
Id int primary key,
Name nvarchar(33),
foreign key (Id) references LibraryItems(Id)
)

create table DVD(
Id int primary key,
name nvarchar(33),
Foreign key (Id) references LibraryItems(Id)
)

create table LibraryLocations(
Id int primary key,
Aishle int,
Shelf int
)


create table LibraryCatalogs(
CatalogId int primary key,
BookId int,
foreign key(BookId) references Books(Id)
)


insert into Genres (Name) values ('A205')
insert into Genres (Name) values ('B205')

select * from Genres