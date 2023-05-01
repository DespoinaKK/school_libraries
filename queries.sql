-- 3.1.4
-- Show all authors with no lendings
SELECT d.name from author d 
WHERE d.author_id IN 
(SELECT a.author_id FROM author a
EXCEPT
SELECT c.author_id FROM lending b INNER JOIN author_book c
ON b.ISBN = c.ISBN);

-- 3.1.3
-- Show all young teachers why have borrowed the most books
-- and the number of books they borrowed
SELECT u.name, count(*) from users u
INNER JOIN lending l
ON u.id_user = l.id_user WHERE (u.role = 1 or u.role = 2) and (u.birthday > '1983-01-01')
GROUP BY u.name
ORDER BY count(*) DESC;

-- 3.1.1
-- Show all lendings per school in specific month and year
SELECT s.name, count(*) as 'Number of lendings' from schools s
INNER JOIN lending l
ON s.school_id = l.school_id WHERE YEAR(l.borrow_date) = 2022 AND MONTH(l.borrow_date) = 12
GROUP BY s.name
ORDER BY count(*) DESC;

-- 3.1.2
-- For a specific category, show all authors in that category 
-- And the teachers that have borrowed books from that category in the last year
SELECT a.name from author a 
INNER JOIN author_book ab
ON a.author_id=ab.author_id
INNER JOIN books b
ON ab.ISBN = b.ISBN 
INNER JOIN book_category bc
ON bc.ISBN = b.ISBN
INNER JOIN category c
ON c.category_id = bc.category_id WHERE c.name = 'History'

SELECT u.name from users u
INNER JOIN lending l
ON l.id_user = u.id_user
INNER JOIN books b
ON l.ISBN = b.ISBN 
INNER JOIN book_category bc
ON bc.ISBN = b.ISBN
INNER JOIN category c
ON c.category_id = bc.category_id 
WHERE c.name = 'Biography' AND u.role = 1 AND YEAR(l.borrow_date) = YEAR(CURDATE())