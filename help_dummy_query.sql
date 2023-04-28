
SELECT b.ISBN, a.author_id
FROM books b
INNER JOIN author a
ON b.author = a.name
group by b.ISBN