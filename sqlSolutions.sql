-- Problem 1

select * from invoice 
join invoiceLine on invoiceLine.invoiceId = invoice.invoiceId
where invoiceLine.unitPrice > .99

--Problem 2

select InvoiceDate, FirstName, LastName, Total from Invoice
join customer on customer.customerId = Invoice.CustomerId

--Problem 3

select Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName from Customer
join Employee on Customer.SupportRepId = Employee.EmployeeId

--Problem 4


select Album.title, Artist.name from Artist
join Album on Album.ArtistId = Artist.ArtistId

--Problem 5

select TrackId from PlaylistTrack
join Playlist on Playlist.PlaylistId = PlaylistTrack.PlaylistId
where Playlist.name = 'Music';

--Problem 6

select Name from Track
join PlaylistTrack on PlaylistTrack.TrackId = Track.TrackId
where PlaylistId = 5;

--Problem 7

select Track.name, Playlist.name from Track
join PlaylistTrack on PlaylistTrack.TrackId = Track.TrackId
join Playlist on Playlist.PlaylistId = PlaylistTrack.PlaylistId

--Problem 8

select Track.name, Album.Title from Track
join Album on Album.AlbumId = Track.AlbumId
join Genre on Genre.GenreId = Track.GenreId
where Genre.name = 'Alternative';

-- NESTED QUERIES

--Problem 1

select * from invoice
where InvoiceId in (select InvoiceId from InvoiceLine where UnitPrice > .99);

--Problem 2

select * from PlaylistTrack
where PlaylistId in (select PlaylistId from Playlist where name = 'Music');

--Problem 3

select name from Track
where TrackId in (select TrackId from PlaylistTrack where PlaylistId = 5);

--Problem 4

select * from Track
where GenreId in (select GenreId from Genre where Name = 'Comedy');

--Problem 5

select * from Track
where AlbumId in (select AlbumId from Album where Title = 'Fireball');

--Problem 6

select * from Track
where AlbumId in (select AlbumId from Album where ArtistId in (select ArtistId from Artist where Name = 'Queen'));

-- PRACTICE UPDATING ROWS

--Problem 1

update customer
set fax = null
where fax is not null;

--Problem 2

update customer
set Company = 'Self'
where company is null;

--Problem 3

update customer
set LastName = 'Thompson'
where FirstName = 'Julia' and LastName = 'Barnett';

--Problem 4

update customer
set SupportRepId = 4
where Email ='luisrojas@yahoo.cl'

--Problem 5

update track
set Composer = 'The darkness around us'
where GenreId = (select GenreId from Genre where Name = 'Metal')
and Composer is null;


-- GROUP BY

--Problem 1

select count(*), Genre.name
from Track
join Genre on Track.GenreId = Genre.GenreId
group by Genre.Name

--Problem 2

select count(*), Genre.name
from Track
join Genre on Genre.GenreId = Track.GenreId
where Genre.name = 'Pop' or Genre.name = 'Rock'
group by Genre.name

--Problem 3


select count(*), Artist.name
from Artist
join Album on Artist.ArtistId = Album.ArtistId
group by Artist.ArtistId

--   USE DISTINCT

--Problem 1


select distinct Composer
from Track;

--Problem 2

select distinct BillingPostalCode
from Invoice;

--Problem 3

select distinct Company
from Customer;

--   DELETE ROWS!!!!

-- Problem 1

delete from practice_delete
where type = 'bronze';

--Problem 2

delete from practice_delete
where type = 'silver';

--problem 3

delete from practice_delete
where value = 150;

--  E COMMERCE SIMULATION

create table Users (
	id serial primary key,
  	name text,
  	email text
);

create table Products (
	id serial primary key,
  	name text,
  	price int
);

create table Orders (
	id serial primary key,
    product_id int references(id)
);

insert into Users 
(name, email)
values
('Alex', 'stizout@gmail.com'),
('Cherish', 'cherish@gmail.com'),
('Bailey', 'bailey@gmail.com');

insert into Products 
(name, price)
values
('Cream', 100),
('desk', 500),
('soda', 1);

insert into Orders 
(product_id)
values
(2)
(1)
(3)

select * from Orders
where id = 1

select * from Orders

select sum(price) from Orders
join Products on Orders.product_id = Products.id

alter table Users 
add column order_id int REFERENCES Orders(id)

update Users 
set order_id = 3
where id = 1





