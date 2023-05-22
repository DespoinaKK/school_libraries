-- 3.1.4 OK 
-- Show all authors with no lendings
SELECT d.name from author d 
WHERE d.author_id IN 
(SELECT a.author_id FROM author a
EXCEPT
SELECT c.author_id FROM lending b INNER JOIN author_book c
ON b.ISBN = c.ISBN);

-- 3.1.3 OK 
-- Show all young teachers that have borrowed the most books
-- and the number of books they borrowed
SELECT u.name, count(*) from users u
INNER JOIN lending l
ON u.id_user = l.id_user WHERE (u.role = 1 or u.role = 2) and (u.birthday > '1983-01-01')
GROUP BY u.name
ORDER BY count(*) DESC;

-- 3.1.1 OK
-- Show all lendings per school in specific month and year
SELECT s.name, count(*) as 'Number of lendings' from schools s
INNER JOIN lending l
ON s.school_id = l.school_id WHERE YEAR(l.borrow_date) = 2022 AND MONTH(l.borrow_date) = 12
GROUP BY s.name
ORDER BY count(*) DESC;

-- 3.1.2 OK
-- For a specific category, show all authors in that category 
-- And the teachers that have borrowed books from that category in the last year
SELECT DISTINCT a.name from author a 
INNER JOIN author_book ab
ON a.author_id=ab.author_id
INNER JOIN books b
ON ab.ISBN = b.ISBN 
INNER JOIN book_category bc
ON bc.ISBN = b.ISBN
INNER JOIN category c
ON c.category_id = bc.category_id WHERE c.name = 'History'

SELECT DISTINCT u.name from users u
INNER JOIN lending l
ON l.id_user = u.id_user
INNER JOIN books b
ON l.ISBN = b.ISBN 
INNER JOIN book_category bc
ON bc.ISBN = b.ISBN
INNER JOIN category c
ON c.category_id = bc.category_id 
WHERE c.name = 'Travel' AND u.role = 1 AND YEAR(l.borrow_date) = YEAR(CURDATE())

-- 3.1.5 OK 
-- Returns name of school manager and total number of lendings
SELECT u.name, tt.count FROM users u
INNER JOIN (
    SELECT tt1.school_id, tt1.count
    FROM (SELECT count(*) as count, school_id FROM lending GROUP BY school_id) tt1
    INNER JOIN (SELECT count(*) as count, school_id FROM lending GROUP BY school_id) tt2 
    ON tt1.count = tt2.count
    WHERE tt1.school_id <> tt2.school_id ) tt
ON u.school_id = tt.school_id
WHERE u.role = 2 AND tt.count > 2
GROUP BY u.name
ORDER BY tt.count;

-- 3.1.6 OK 
-- Returns top 3 couples of categories that show up in lendings
SELECT c1.name as 'Category 1', c2.name as 'Category 2', cat_ids.cnt FROM (category c1, category c2)
INNER JOIN
    (SELECT cj.cat1 as ct1, cj.cat2 as ct2, count(*) as cnt FROM
        (SELECT cj1.category_id as cat1, cj2.category_id as cat2 FROM 
                (SELECT c.category_id, c.ISBN FROM book_category c
                INNER JOIN lending l
                ON c.ISBN = l.ISBN) cj1
            CROSS JOIN 
                (SELECT c.category_id, c.ISBN FROM book_category c
                INNER JOIN lending l
                ON c.ISBN = l.ISBN) cj2 
        WHERE cj1.ISBN = cj2.ISBN AND cj1.category_id < cj2.category_id
        ORDER BY cat1, cat2) cj
    GROUP BY cj.cat1, cj.cat2
    ORDER BY count(*) DESC) cat_ids
ON c1.category_id = cat_ids.ct1 AND c2.category_id = cat_ids.ct2

-- 3.1.7 OK
-- Returns the authors that have written at least 5 books less than the author of the most books
SELECT a.name, a_with_less_books.cnt FROM author a
INNER JOIN
    (WITH mx(value) as (SELECT MAX(cnt) FROM (SELECT count(*) as cnt FROM author_book ab GROUP BY ab.author_id) m)
        SELECT ab1.author_id as id, ab1.cnt as cnt, mx.value
        FROM (SELECT ab.author_id as author_id, count(*) as cnt FROM author_book ab GROUP BY ab.author_id) ab1, mx
        HAVING ab1.cnt < mx.value-4) a_with_less_books
ON a.author_id = a_with_less_books.id
