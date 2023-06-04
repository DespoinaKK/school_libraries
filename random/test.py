name = 'test'
username = 'test'
password = 'test'
role = '1'
print('''INSERT INTO users_unregisterd (name, username, password, school_id, role,) \
    VALUES ('%s', '%s', '%s', 3, '%s');''' % name, username, password,  role)