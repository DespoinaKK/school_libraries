query = []
options = ["2", "4"]
for option in options:
    
     query.append('''(SELECT ISBN FROM book_category WHERE category_id = %s)''' % (option))
u = " UNION "
u = u.join(query)
u = "(" + u + ") bk"
print('''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN;''')
