query = []
options = ["2", "4"]
school_id  = 4
author_id = 38
for option in options:
    
     query.append('''(SELECT ISBN FROM book_category WHERE category_id = %s)''' % (option))
u = " INTERSECT "
u = u.join(query)
u = "(" + u + ") bk"
print('''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN;''')

q1 = '''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN \
INNER JOIN book_school bs on bs.ISBN = b.ISBN WHERE bs.school_id = %s''' % (school_id) 

q2 = '''SELECT b.ISBN, b.title FROM author a INNER JOIN author_book ab on a.author_id =  ab.author_id \
INNER JOIN books b on ab.ISBN = b.ISBN \
INNER JOIN book_school bs on bs.ISBN = b.ISBN WHERE bs.school_id = %s AND a.author_id = %s;''' % (school_id, author_id)

print(q1 + " INTERSECT " + q2)
