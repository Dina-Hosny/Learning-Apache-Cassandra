/*
1- create books_Auth keyspace with the following configurations:
SimpleStrategy, and replication_factor = 1
*/

	CREATE KEYSPACE books_Auth
	  WITH REPLICATION = { 
	   'class' : 'SimpleStrategy', 
	   'replication_factor' : 1 
	  }
	

/*
2- create the table books with the following fields
(name, price, genres)
note: the table should consider the name as unique column
*/


	CREATE TABLE books_Auth.book(
	   name text PRIMARY KEY,
	   price float,
	   genres list<text>
	   );


/*
3- insert the following data to the table:
	- 'book1', 101, {'drama', 'crime', 'animated'}
	- 'book2', 102, {'drama', 'crime'}
	- 'book3', 103, {'drama', 'animated'}
	- 'book4', 104, {'drama'}
	- 'book5', 105, {'crime'}
*/


	insert into books_Auth.book (name, price, genres) values ('book1', 101, ['drama', 'crime', 'animated']);
	insert into books_Auth.book (name, price, genres) values ('book2', 102, ['drama', 'crime']);
	insert into books_Auth.book (name, price, genres) values ('book3', 103, ['drama', 'animated']);
	insert into books_Auth.book (name, price, genres) values ('book4', 104, ['drama']);
	insert into books_Auth.book (name, price, genres) values ('book5', 105, ['crime']);

	SELECT * FROM books_Auth.book;

/*
4- insert the following data:
 book5, 105, {'animated'}
 what did you notice?
*/

	insert into books_Auth.book (name, price, genres) values ('book5', 105, ['animated']);
	SELECT * FROM books_Auth.book;
	
	Book5 override its genres data from 'crime' to 'animated'


/*
5- update the genres for book5 to be {'crime'}
*/

	update books_Auth.book set genres = {'crime'}
	where name = 'book5';
	SELECT * FROM books_Auth.book;


/*
6- execute the following statement:
update books_Auth.books set genres = {'crime', 'animated'}
where name = 'book6';
what did you notice?
*/

	update books_Auth.book set genres = {'crime', 'animated'}
	where name = 'book6';
	SELECT * FROM books_Auth.book;
	
	a new row is added with data in name and gnres columns, but no data in price column

/*
7- delete the data for book5
*/

	delete from books_Auth.book
	where name = 'book5';

/*
8- get the data for book3
*/

	select *
	from books_Auth.book
	where name = 'book3';


/*
9- get the data for book3, and book4
*/

	select *
	from books_Auth.book
	where name IN ('book3', 'book4')

/*
10- book4 has been recategorized as {'drama', 'crime'} instead of only {'drama'}
show how you can reflect this in your table
*/
	-- using Update
	update books_Auth.book set genres = {'drama', 'crime'}
	where name = 'book4';
	SELECT * FROM books_Auth.book;


/*
11- delete the whole data from your table
*/

	TRUNCATE books_Auth.book;

/*
12- drop the table, then drop the keyspace
*/

	DROP TABLE books_Auth.book;
	DROP KEYSPACE books_Auth;






