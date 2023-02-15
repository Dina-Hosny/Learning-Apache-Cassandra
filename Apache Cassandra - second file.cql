/*
1- create keyspace with the following configurations:
SimpleStrategy, and replication_factor = 1
*/


	CREATE KEYSPACE items_ks
	  WITH REPLICATION = { 
	   'class' : 'SimpleStrategy', 
	   'replication_factor' : 1 
	  };

/*
2- create table/tables with the following columns:
(category, name, price, sizes, colors)

to add the following data:
'category1', 'item1', 101, {'L'}, {'color1', 'color2'}
'category1', 'item2', 102, {'XL'}, {'color2'}
'category1', 'item3', 103, {'S', 'XL'}, {'color3'}
'category2', 'item4', 104, {'S', 'L'}, {'color1', 'color4'}
'category2', 'item5', 105, {'L', 'XL'}, {'color2', 'color3'}
'category2', 'item6', 106, {'S', 'L', 'XL'}, {'color1', 'color2', 'color3'}

note: the table should consider the name as unique column


to answer the following questions:
*/

	//--create itemsData with Name as partition key


	CREATE TABLE items_ks.itemsData(
	   category text,
	   name text PRIMARY KEY,
	   price float,
	   sizes set<text>,
	   colors set<text>
	   );
	   
	--insert data into itemsData	   
		   
	INSERT INTO items_ks.itemsData (category, name, price, sizes, colors)
	VALUES ('category1', 'item1', 101, {'L'}, {'color1', 'color2'});
	INSERT INTO items_ks.itemsData (category, name, price, sizes, colors)
	VALUES ('category1', 'item2', 102, {'XL'}, {'color2'});
	INSERT INTO items_ks.itemsData (category, name, price, sizes, colors)
	VALUES ('category1', 'item3', 103, {'S', 'XL'}, {'color3'});
	INSERT INTO items_ks.itemsData (category, name, price, sizes, colors)
	VALUES ('category2', 'item4', 104, {'S', 'L'}, {'color1', 'color4'});
	INSERT INTO items_ks.itemsData (category, name, price, sizes, colors)
	VALUES ('category2', 'item5', 105, {'L', 'XL'}, {'color2', 'color3'});
	INSERT INTO items_ks.itemsData (category, name, price, sizes, colors)
	VALUES ('category2', 'item6', 106, {'S', 'L', 'XL'}, {'color1', 'color2', 'color3'}); 
	
	-- create itemsData_cat with category as partition key, and price as cluster keys

--// this table should contain the name as a part of the primary key, since name will enforce the uniqueness
	
	CREATE TABLE items_ks.itemsData_cat(
	category text,
	name text,
	price float,
	sizes set<text>,
	colors set<text>,
	PRIMARY KEY ((category), price)
	);
	
	-- insert data into itemsData_cat
	INSERT INTO items_ks.itemsData_cat (category, name, price, sizes, colors)
	VALUES ('category1', 'item1', 101, {'L'}, {'color1', 'color2'});
	INSERT INTO items_ks.itemsData_cat (category, name, price, sizes, colors)
	VALUES ('category1', 'item2', 102, {'XL'}, {'color2'});
	INSERT INTO items_ks.itemsData_cat (category, name, price, sizes, colors)
	VALUES ('category1', 'item3', 103, {'S', 'XL'}, {'color3'});
	INSERT INTO items_ks.itemsData_cat (category, name, price, sizes, colors)
	VALUES ('category2', 'item4', 104, {'S', 'L'}, {'color1', 'color4'});
	INSERT INTO items_ks.itemsData_cat (category, name, price, sizes, colors)
	VALUES ('category2', 'item5', 105, {'L', 'XL'}, {'color2', 'color3'});
	INSERT INTO items_ks.itemsData_cat (category, name, price, sizes, colors)
	VALUES ('category2', 'item6', 106, {'S', 'L', 'XL'}, {'color1', 'color2', 'color3'});


/*
3- get the data for item3
*/

	SELECT *
	FROM items_ks.itemsData
	WHERE name = 'item3';

/*
4- get the data for item3, and item4
*/

	SELECT *
	FROM items_ks.itemsData
	WHERE name IN ('item3', 'item4');

/*
5- get the data for items that are in categoty1
*/

	SELECT * FROM items_ks.itemsData_cat
	WHERE category = 'category1';

/*
6- get the data for items that are in categoty1, and with price equal to 102
*/

	SELECT * FROM items_ks.itemsData_cat
	WHERE category = 'category1' AND price = 102;

/*
7- get the data for items that are in categoty2, and with price greater than or equal to 105
*/

	SELECT * FROM items_ks.itemsData_cat
	WHERE category = 'category2' AND price >= 105;

/*
8- can you sort the data for category1 items according to the price in asc/desc order ?
*/
	--in asc order

	SELECT * FROM lab2.table2
	WHERE category = 'category1'
	ORDER BY price;
	
	--in dec order
	
	SELECT * FROM lab2.table2
	WHERE category = 'category1'
	ORDER BY price DESC;







