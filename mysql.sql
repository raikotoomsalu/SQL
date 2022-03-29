-- ÜL 21.1
SELECT * FROM d110068_books.book WHERE release_date >= 2010 AND type = 'new';
-- ÜL 21.2
SELECT title, release_date, price FROM books where type = 'used' AND release_date < 1970 AND price < 20;
-- ÜL 21.3
SELECT count(*) as tellimuste_arv, year(order_date) as aasta from orders group by year(order_date);
-- ÜL 21.4
SELECT ROUND(SUM(price),2) AS "Ümardatud" FROM orders LEFT JOIN books ON orders.book_id = books.id GROUP BY YEAR(order_date);
-- ÜL 21.5
SELECT count(*) as 'tellimuste arv', sum(books.price) as 'müükide summa' from orders left join books on orders.book_id = books.id where year(order_date) = 2017;
-- ÜL 21-6
select * from clients left join orders on orders.client_id = clients.id left join books on orders.book_id = books.id where year (orders.order_date) = 2017;
-- ÜL 21.7
select count(*), sum(books.price), clients.username from clients left join orders on orders.client_id = clients.id left join books on orders.book_id = books.id where year(orders.order_date) = 2017
group by clients.id order by sum(books.price) desc;
-- ÜL 21.8
select count(*) from orders group by book_id order by count(*) desc;
select books.title, books.price, count(*) from orders left join books on books.id = orders.book_id group by book_id order by count(*) desc limit 10;
-- ÜL 21.9 
select avg(price) from books; 
select title as "pealkiri" from books where price > (select avg(price) from books);
-- ül 22.1
select SUM(price * stock_saldo) as "Laoväärtus" from books;
-- ÜL 22.2
select avg(price) as "Keskmine hind", max(price) as "Kõrgeim hind", min(price) as "Madalaim hind" from books;
-- ÜL 22.3
select max(price) as "Kõige kallim kasutatud raamat" from books where type = 'used';
-- ÜL 22.4
SELECT CASE WHEN type = "new"
THEN "uus" WHEN type = "used" THEN "kasutatud" WHEN type = "ebook" THEN "e-raamat" END as Tüüp, round(avg(price),2) as Keskmine_Hind, COUNT(*) AS Hulk FROM books GROUP BY type;
-- ÜL 22.5
SELECT avg(price) FROM books 
where type = 'new';
select title, price, type from books where type = 'used' and price > (SELECT avg(price) FROM books where type = 'new') order by price;
-- ÜL 22.6
SELECT avg(price) FROM authors
left join book_authors on book_authors.author_id = authors.id
left join books on book_authors.book_id = books.id
left join orders on orders.book_id = books.id
where orders.id is not null
GROUP BY authors.id
order by count(*) desc
limit 1;
select * from books
where price > (SELECT avg(price) FROM authors
left join book_authors on book_authors.author_id = authors.id
left join books on book_authors.book_id = books.id
left join orders on orders.book_id = books.id
where orders.id is not null
GROUP BY authors.id
order by count(*) desc
limit 1);
-- ÜL 22.7
select * from books 
where release_date % 2=0;
-- ÜL 22.8
select count(*), language from books
group by language
order by count(*) desc;
-- ÜL 23.1
INSERT INTO clients (username, first_name, last_name, email, password, address)
VALUES ('fredy69420', 'fredy', 'timofejev', 'frappyswag@gmail.com', 'maolenheainimene', 'allday 420');
-- ÜL 23.2
UPDATE books
SET language = 'Eesti'
WHERE id=1;
-- ÜL 23.3
DELETE FROM orders WHERE id=2300;
-- ÜL 23.4
INSERT INTO clients (username, first_name, last_name, email, password, address)
VALUES
    ('dsdoia', 'dsadasd', 'dasda', 'dsadsad@bing.com', 'lol', 'swag'),
    ('dsdoia', 'dsadasd', 'dasda', 'dsadsad@hotmail.com', 'lol', 'swag'),
    ('zilla', 'dsadasd', 'dasda', 'dsadsad@ametikool.ee', 'lol', 'swag'),
    ('symere123', 'dsadasd', 'dasda', 'dsadsad@gmail.com', 'lol', 'swag'),
    ('yeat', 'dsadasd', 'dasda', 'dsadsad@yahhoo.com', 'lol', 'swag');
-- ÜL 22.5
select id from books
where title = 'Vendetta';
select id from clients
where username = 'mcage1o';
INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)
VALUES ('fredy town420', '2005-03-27', 'ordered', (select id from clients
where username = 'mcage1o'),(select id from books
where title = 'Vendetta') );
-- ÜL 23.6
UPDATE books
SET price = price * 1.05, pages = pages - 5
where books.id > 0;
-- ÜL 23.7
select authors.id from authors
left join book_authors on book_authors.author_id = authors.id
where book_authors.id is null;
delete from authors
WHERE authors.id IN (select authors.id from authors
left join book_authors on book_authors.author_id = authors.id
where book_authors.id is null);






