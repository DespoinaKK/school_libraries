from flask import Flask,render_template, request,redirect,Blueprint,flash,session, url_for, g
from flask_mysqldb import MySQL
import functools 
from datetime import datetime, date, timedelta
import time
from .make_image import make_image

app = Flask(__name__)
 
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'school_libraries'
 
mysql = MySQL(app)

bp = Blueprint('auth',__name__, url_prefix='/')

def delete_expired_bookings():
    cur = mysql.connection.cursor()
    cur.execute('''DELETE FROM booking WHERE date_of_booking < %s''', [datetime.now()-timedelta(days=7)])            

def role_required(required_role):
    def decorator(route_function):
        @functools.wraps(route_function)
        def decorated_route(*args, **kwargs):
            if 'userid' not in session:
                return redirect('/login')  # Redirect to login page if user is not logged in
            elif session['role'] not in required_role:
                return redirect('/unauthorized')  # Redirect to unauthorized page
            return route_function(*args, **kwargs)
        return decorated_route
    return decorator

@bp.route('/unauthorized')
def unauthorized():
    return 'Unauthorized page'

@bp.route('/', methods=('GET', 'POST'))
def home():
    return render_template('base.html', session = session)

@bp.route('/register', methods=('GET', 'POST'))
def register():
    cur = mysql.connection.cursor()
    cur.execute("SELECT school_id, name FROM `schools` ORDER BY name")
    schools = cur.fetchall()
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        school_id = request.form.get('schools')
        name = request.form['name']
        birthday = request.form['birthday']
        role = request.form.get('role')
        invalid_char = False
        if len(username) > 15 or len(password) > 15:
            invalid_char = True
            flash('Up to 15 characters can be used for username and password')
        special_characters = '''"'!@#$%^&*()-+?=,<>/'''
        if not username.islower() or any(c in special_characters for c in username) :
            invalid_char = True
            flash('Username must contain only lowercase latin letters or _')
        if not (name.isalpha() or ' ' in name):
            invalid_char = True
            flash('Only latin characters can be used for name')
        if invalid_char:
            return render_template('register.html', schools = schools)
        else:
            cur_username = mysql.connection.cursor()
            cur_username.execute('''(SELECT id_user FROM users WHERE username = %s) \
                UNION (SELECT id_user FROM users_unregistered WHERE username = %s);''',\
                                  (username,username))
            exists = cur_username.fetchall()
            if exists:
                flash('This username is already being used. Choose a different one')
                return render_template('register.html', schools = schools)
            else:
                # valid username
                # pending registration
                # insert to users_unregistered
                cur_insert = mysql.connection.cursor()
                cur_insert.execute('''INSERT INTO users_unregistered (name, username, password, school_id, role, birthday) \
                    VALUES ('{name}', '{username}', '{password}', {school_id}, {role}, '{birthday}');'''.format(name=name,\
                             username=username, password=password,school_id=school_id, role=role, birthday=birthday))
                mysql.connection.commit()
                return render_template('register.html', schools = schools)
    return render_template('register.html', schools = schools)

@bp.route('/manager_registration', methods=('GET', 'POST'))
def manager_registration():
    cur = mysql.connection.cursor()
    cur.execute("SELECT school_id, name FROM `schools` ORDER BY name")
    schools = cur.fetchall()
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        school_id = request.form.get('schools')
        name = request.form['name']
        birthday = request.form['birthday']
        role = 2
        invalid_char = False
        if len(username) > 15 or len(password) > 15:
            invalid_char = True
            flash('Up to 15 characters can be used for username and password')
        special_characters = '''"'!@#$%^&*()-+?=,<>/'''
        if not username.islower() or any(c in special_characters for c in username) :
            invalid_char = True
            flash('Username must contain only lowercase latin letters or _')
        if not (name.isalpha() or ' ' in name):
            invalid_char = True
            flash('Only latin characters can be used for name')
        if invalid_char:
            return render_template('manager_registration.html', schools = schools)
        else:
            cur_username = mysql.connection.cursor()
            cur_username.execute('''(SELECT id_user FROM users WHERE username = %s) \
                UNION (SELECT id_user FROM users_unregistered WHERE username = %s);''',\
                                  (username,username))
            exists = cur_username.fetchall()
            if exists:
                flash('This username is already being used. Choose a different one')
                return render_template('manager_registration.html', schools = schools)
            else:
                # valid username
                # pending registration
                # insert to users_unregistered
                cur_insert = mysql.connection.cursor()
                cur_insert.execute('''INSERT INTO managers_unregistered (name, username, password, school_id, role, birthday) \
                    VALUES ('{name}', '{username}', '{password}', {school_id}, {role}, '{birthday}');'''.format(name=name,\
                             username=username, password=password,school_id=school_id, role=role, birthday=birthday))
                mysql.connection.commit()
                return render_template('manager_registration.html', schools = schools)
    return render_template('manager_registration.html', schools = schools)

@bp.route('/logout', methods=('GET', 'POST'))
def logout():
    session.clear()
    return redirect('/')

@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cur = mysql.connection.cursor()
        message = None
        cur.execute('''SELECT * FROM users WHERE username = %s AND password = %s AND active=1;''', (username, password))
        user = cur.fetchone()
        cur.close()
        
        if user:
            session.clear()
            session['loggedin'] = True
            session['userid'] = user[0]
            session['name'] = user[1]
            session['username'] = username
            session['school_id'] = user[4]
            session['role'] = user[5]
            role = user[5]
            if role == 2:
                return redirect('/manager')
            if role == 3:
                return redirect('/admin')
            return redirect('/user')

        else:
            flash("incorrect data")

    return render_template('login.html')

@bp.route('/user', methods=('GET', 'POST'))
@role_required([0, 1])
def user():
    pid = session['userid']
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM `category`")
    categories = cursor.fetchall()
    cursor.execute("SELECT school_id FROM users WHERE id_user = %s;", [pid])
    school_id = cursor.fetchone()[0]
    name = session['name']
    if request.method == 'POST':
        if request.form.get('show books'):
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM lending l INNER JOIN books b on l.ISBN = b.ISBN where id_user = %s ORDER BY borrow_date DESC;''', [pid])
            book = cur.fetchall()
            cur.close()
            return render_template('my_books.html', books=book)
        if request.form.get('show profile'):
            return redirect('user/profile')
        if request.form.get('show reviews'):
            return redirect('user/reviews')
        if request.form.get('show delays'):###########
            return redirect('user/delays')
        if request.form.get('show bookings'):
            return redirect('user/bookings')
        if request.form.get('see authors'):
            return redirect('my_school/authors')
        if request.form.get('search'):
           options = request.form.getlist('options[]')
           cat = False
           if options != []:
                cat = True   # categories where chosen
                search_cur = mysql.connection.cursor()
                query = []
                for option in options:
                     query.append('''(SELECT ISBN FROM book_category WHERE category_id = %s)''' % (option))
                u = " INTERSECT "
                u = u.join(query)
                u = "(" + u + ") bk"
                
                q1 = '''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN''' #store query to use later
                
                search_cur.execute('''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN \
                INNER JOIN book_school bs on bs.ISBN = b.ISBN WHERE bs.school_id = %s;''', [school_id])
                books1 = search_cur.fetchall()
                search_cur.close()
           
           author = request.form['author']
           if author:
                cur = mysql.connection.cursor()
                cur.execute('''SELECT * FROM author WHERE name=  %s;''', [author])
                author = cur.fetchone()
                if author:
                    author_id = author[0]
                    cur.execute('''SELECT b.ISBN, b.title FROM author a INNER JOIN author_book ab on a.author_id =  ab.author_id \
                            INNER JOIN books b on ab.ISBN = b.ISBN \
                            INNER JOIN book_school bs on bs.ISBN = b.ISBN WHERE bs.school_id = %s AND a.author_id = %s;''', [school_id, author_id])
                    
                    books2 = cur.fetchall()
                    
                    if cat: 
                        cur.execute(q1 + ''' INNER JOIN author_book ab on ab.ISBN = b.ISBN \
                                    INNER JOIN book_school bs on bs.ISBN = b.ISBN WHERE bs.school_id = %s AND ab.author_id = %s;''' , [school_id, author_id])
                        books = cur.fetchall()
                    
                    else:
                        books = books2
                    cur.close()
                else:
                    flash("The input author does not exist. Try again!")
                    return redirect('/user')

           else:
               books = books1
           if books == ():
               flash("No results found")
               return redirect('/user')
           else:
               return render_template('search.html', books = books)
        
        if request.form.get('search title'):
            title = request.form['title']
            cur = mysql.connection.cursor()
            cur.execute('''SELECT b.ISBN, b.title FROM books b INNER JOIN book_school bs ON b.ISBN = bs.ISBN \
                  WHERE b.title LIKE '%{title}%' AND bs.school_id = {school_id};'''.format(title=title,school_id=school_id))
            book = cur.fetchall()
            cur.close()
            if book:
                return render_template('search.html', books = book)
            else:
                flash("No results found")
                return redirect('/user')
        
        for key, value in request.form.items():
            if value == 'Details':
                isbn = key
                return redirect(url_for(".details", isbn=isbn))
      
    if request.method == 'GET':
        return render_template('user.html', categories=categories, name = name)

@bp.route('/my_school/authors', methods=('GET', 'POST'))
@role_required([0, 1])
def school_authors():
    school_id = session['school_id']
    cur = mysql.connection.cursor()
    cur.execute('''SELECT a.author_id, a.name from author a INNER JOIN \
        (SELECT ab.author_id FROM author_book ab INNER JOIN book_school bs ON ab.ISBN = bs.ISBN WHERE bs.school_id = %s) abs \
            ON a.author_id = abs.author_id GROUP BY a.name''', [school_id])
    authors = cur.fetchall()
    cur.close()
    if request.method == "GET":
        return(render_template("authors.html", authors = authors))
    if request.method == "POST":
        for key,value in request.form.items():
            if value=="See author's books":    
                author_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT b.ISBN, b.title FROM books b INNER JOIN author_book ab ON b.ISBN=ab.ISBN WHERE author_id=%s''', [author_id])
                books = cur.fetchall()
                return render_template('search.html', books = books) 
            if value == "Details":
                isbn = key
                return redirect(url_for(".details", isbn=isbn))

@bp.route('/user/bookings', methods=('GET', 'POST'))
@role_required([0, 1])
def my_bookings():
    delete_expired_bookings()
    cur = mysql.connection.cursor()
    cur.execute('''SELECT b.isbn, b.title, bk.date_of_booking FROM booking bk INNER JOIN books b ON bk.ISBN = b.ISBN WHERE bk.id_user = %s''', [session['userid']])
    bookings = list(cur.fetchall())
    isbn = []
    title = []
    date_of_booking = []
    cur.close()
    for book in bookings:
        isbn.append(book[0])
        title.append(book[1])
        date_of_booking.append(book[2])
    date_of_exp = [i + timedelta(days=7) for i in date_of_booking]
    if request.method == 'GET':
        return render_template('my_bookings.html', isbn = isbn, title = title, date_of_booking = date_of_booking, date_of_exp = date_of_exp)
    if request.method == 'POST':
        for key,value in request.form.items():
            if value == "Cancel Reservation":
                isbn = key
                cur = mysql.connection.cursor()
                cur.execute('''DELETE FROM booking WHERE ISBN = %s AND id_user = %s''', [isbn, session['userid']])
                mysql.connection.commit()
                flash("Your reservation was cancelled successfully.")
                return redirect('/user/bookings')

@bp.route('/user/delays', methods=('GET', 'POST'))
@role_required([0, 1])
def my_delays():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT l.isbn, b.title, l.borrow_date FROM lending l INNER JOIN books b ON l.ISBN = b.ISBN WHERE l.id_user = %s \
        AND l.return_date IS NULL AND l.borrow_date < %s''', [session['userid'], datetime.now().date()-timedelta(days=7)])
    delays = list(cur.fetchall())
    title = []
    isbn = []
    lending_date = []
    for book in delays:
        isbn.append(book[0])
        title.append(book[1])
        lending_date.append(book[2])
    days_of_delay_1 = [date.today() - i for i in lending_date]
    days_of_delay = [i.days for i in days_of_delay_1]
    return render_template("my_delays.html", title=title, isbn=isbn, lending_date=lending_date, days_of_delay=days_of_delay)

@bp.route('/user/reviews', methods=('GET', 'POST'))
@role_required([0, 1])
def my_reviews():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT review_id, star_review, review_text, ISBN FROM reviews WHERE id_user = %s''', [session['userid']])
    approved_reviews = list(cur.fetchall())
    title = []
    isbn = []
    for review in approved_reviews:
        isbn.append(review[3])
        cur.execute('''SELECT title FROM books WHERE ISBN=%s''', [review[3]])
        title.append(cur.fetchone())
    cur.execute('''SELECT review_id, star_review, review_text, ISBN FROM reviews WHERE id_user = %s''', [session['userid']])
    pending_reviews = list(cur.fetchall())
    pending_title = []
    pending_isbn = []
    for review in pending_reviews:
        pending_isbn.append(review[3])
        cur.execute('''SELECT title FROM books WHERE ISBN=%s''', [review[3]])
        pending_title.append(cur.fetchone())
    cur.close()
    if request.method == 'GET':
        return render_template('my_reviews.html', title = title, isbn = isbn, approved_reviews = approved_reviews,\
                               pending_title = pending_title, pending_isbn = pending_isbn, pending_reviews = pending_reviews)

@bp.route('/user/profile', methods=('GET', 'POST'))
@role_required([0, 1])
def profile():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM users WHERE id_user = %s''', [session['userid']])
    profile = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        if request.form.get('save changes'):
            if profile[5] == 0:
                flash("student")
                #student
                new_username = request.form['username']
                new_password = request.form['password']
                invalid_char = False
                if len(new_username) > 15 or len(new_password) > 15:
                    invalid_char = True
                    flash('Up to 15 characters can be used for username and password')
                special_characters = '''"'!@#$%^&*()-+?=,<>/'''
                if not new_username.islower() or any(c in special_characters for c in new_username) :
                    invalid_char = True
                    flash('Username must contain only lowercase latin letters or _')
                if invalid_char:
                    return render_template('profile.html', profile = profile)
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE users SET username = %s, password = %s WHERE id_user = %s''', [new_username, new_password, session['userid']])
                flash('Your profile has been modified successfully.')
                mysql.connection.commit()
                cur.close()
                return redirect('/user')
            elif profile[5] == 1:
                #teacher
                new_username = request.form['username']
                new_password = request.form['password']
                new_name = request.form['name']
                new_birthday = request.form['birthday']
                invalid_char = False
                if len(new_username) > 15 or len(new_password) > 15:
                    invalid_char = True
                    flash('Up to 15 characters can be used for username and password')
                special_characters = '''"'!@#$%^&*()-+?=,<>/'''
                if not new_username.islower() or any(c in special_characters for c in new_username) :
                    invalid_char = True
                    flash('Username must contain only lowercase latin letters or _')
                if not (new_name.isalpha() or ' ' in new_name):
                    invalid_char = True
                    flash('Only latin characters can be used for name')
                if invalid_char:
                    return render_template('profile.html', profile = profile)
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE users SET username = %s, password = %s, name = %s, birthday = %s WHERE id_user = %s''',\
                             [new_username, new_password, new_name, new_birthday, session['userid']])
                mysql.connection.commit()
                flash('Your profile has been modified successfully.')
                cur.close()
                return redirect('/user')
    if request.method == 'GET':
        return render_template('profile.html', profile = profile)

@bp.route('/admin', methods=('GET', 'POST'))
@role_required([3])
def admin_home():
    if request.method == 'POST':
        if request.form.get('Pending manager registrations'):
            return redirect('/admin/pending_manager_registrations')
        if request.form.get('Add School'):
            return redirect('/admin/add_school')
        if request.form.get('show profile'):
            return redirect('admin/profile')
    if request.method == 'GET':
        return render_template('admin_home.html')
    
@bp.route('/admin/pending_manager_registrations', methods=('GET', 'POST'))
@role_required([3])
def pending_manager_registrations():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM managers_unregistered''')
    applications = list(cur.fetchall())
    cur.close()
    if request.method == 'GET':
        return render_template('pending_manager_registrations.html', applications = applications)
    if request.method == 'POST':
        if request.form.get('Reject'):
            cur = mysql.connection.cursor()
            id = request.form.get('Reject')[8:]
            cur.execute('''DELETE FROM managers_unregistered WHERE id_user = %s''', [id])
            mysql.connection.commit()
            cur.close()
            return redirect('/admin/pending_manager_registrations')
        if request.form.get('Accept'):
            id = request.form.get('Accept')[8:]
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM managers_unregistered WHERE id_user = %s''', [id])
            user_data = cur.fetchone()
            name = user_data[1]
            username=  user_data[2]
            password = user_data[3]
            school_id = user_data[4]
            role = user_data[5]
            birthday = user_data[6]
            cur.execute('''DELETE FROM users WHERE school_id = %s AND role = %s''', [school_id, role])
            mysql.connection.commit()
            cur.execute('''INSERT INTO users(name, username, password, school_id, role, birthday) \
                    VALUES ('{name}', '{username}', '{password}', {school_id}, {role}, '{birthday}');'''.format(name=name,\
                             username=username, password=password,school_id=school_id, role=role, birthday=birthday))
            mysql.connection.commit()
            cur.execute('''DELETE FROM managers_unregistered WHERE id_user = %s''', [id])
            mysql.connection.commit()
            cur.close()
            return redirect('/admin/pending_manager_registrations')
    
@bp.route('/admin/add_school', methods=('GET', 'POST'))
@role_required([3])
def add_school():
    if request.method == 'GET':
        return render_template('add_school.html')
    
    if request.method == 'POST':
        name = request.form['name']
        director = request.form['director']
        address = request.form['address']
        city = request.form['city']
        post_code = request.form['post_code']
        telephone_number = request.form['telephone_number']
        email = request.form['email']
        cur_insert = mysql.connection.cursor()
        cur_insert.execute('''INSERT INTO schools (name, director, address, city, post_code, telephone_number, email) \
            VALUES ('{name}', '{director}', '{address}', '{city}', {post_code}, {telephone_number}, '{email}');'''.format(name=name,\
                     director=director, address=address, city=city, post_code=post_code, telephone_number=telephone_number, email=email))
        mysql.connection.commit()
        flash('School added successfully!')
        return render_template('add_school.html')
    
@bp.route('/admin/profile', methods=('GET', 'POST'))
@role_required([3])
def admin_profile():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM users WHERE id_user = %s''', [session['userid']])
    profile = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        if request.form.get('save changes'):
            new_username = request.form['username']
            new_password = request.form['password']
            new_name = request.form['name']
            new_birthday = request.form['birthday']
            invalid_char = False
            if len(new_username) > 15 or len(new_password) > 15:
                invalid_char = True
                flash('Up to 15 characters can be used for username and password')
            special_characters = '''"'!@#$%^&*()-+?=,<>/'''
            if not new_username.islower() or any(c in special_characters for c in new_username) :
                invalid_char = True
                flash('Username must contain only lowercase latin letters or _')
            if not (new_name.isalpha() or ' ' in new_name):
                invalid_char = True
                flash('Only latin characters can be used for name')
            if invalid_char:
                return render_template('profile.html', profile = profile)
            cur = mysql.connection.cursor()
            cur.execute('''UPDATE users SET username = %s, password = %s, name = %s, birthday = %s WHERE id_user = %s''',\
                            [new_username, new_password, new_name, new_birthday, session['userid']])
            mysql.connection.commit()
            flash('Your profile has been modified successfully.')
            cur.close()
            return redirect('/admin')
    if request.method == 'GET':
        return render_template('profile.html', profile = profile)

@bp.route('/manager', methods=('GET', 'POST'))
@role_required([2])
def manager_home():
    if request.method == 'POST':
        if request.form.get('Pending Lendings'):
            delete_expired_bookings()
            return redirect('/manager/pending_lendings')
        if request.form.get('Active Lendings'):
            return redirect('/manager/active_lendings')
        if request.form.get('Active Users'):
            return redirect('/manager/active_users')
        if request.form.get('Pending Registrations'):
            return redirect('/manager/pending_registrations')
        if request.form.get('Pending Reviews'):
            return redirect('/manager/pending_reviews')
        if request.form.get('Search Books'):
            return redirect('/manager/books')
    if request.method == 'GET':
        return render_template('manager_home.html', name=session['name'])
    
@bp.route('/manager/books', methods=('GET', 'POST'))
@role_required([2])
def manager_books():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT title, isbn FROM books''')
    all_books = cur.fetchall()
    cur.execute('''SELECT category_id, name FROM category''')
    categories = cur.fetchall()
    if request.method == 'GET':
        return render_template ('manager_search_books.html', all_books = all_books, categories=categories)

    if request.method == 'POST':

        if request.form.get('search author'):
            author = request.form['author']
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM author WHERE name = %s;''', [author])
            author = cur.fetchone()
            if author:
                author_id = author[0]
                cur.execute('''SELECT b.ISBN, b.title FROM author a INNER JOIN author_book ab on a.author_id =  ab.author_id \
                        INNER JOIN books b on ab.ISBN = b.ISBN  WHERE a.author_id = %s;''', [author_id])
                books = cur.fetchall()
                return render_template('search.html', books = books)
            else:
                flash('No results found from input author.')
                redirect('/manager/books')

        if request.form.get('search categories'):
           options = request.form.getlist('options[]')
           if options == []:
                flash('Choose Categories!')
                return redirect('/manager/books')
           else:
                search_cur = mysql.connection.cursor()
                query = []
                for option in options:
                     query.append('''(SELECT ISBN FROM book_category WHERE category_id = %s)''' % (option))
                u = " INTERSECT "
                u = u.join(query)
                u = "(" + u + ") bk"
                
                q1 = '''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN''' #store query to use later
                
                search_cur.execute('''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN;''')
                books = search_cur.fetchall()
                search_cur.close()
                if books == ():
                    flash('No results found for input categories.')
                    return redirect('/manager/books')
                else:
                    return render_template('search.html', books = books)
                
        if request.form.get('search title'):
            title = request.form['title']
            cur = mysql.connection.cursor()
            cur.execute('''SELECT b.ISBN, b.title FROM books b INNER JOIN book_school bs ON b.ISBN = bs.ISBN \
                  WHERE b.title = %s;''', [title])
            books = cur.fetchall()
            cur.close()
            if books:
                return render_template('search.html', books = books)
            else:
                flash("No results found")
                return redirect('/manager/books')

        for key,value in request.form.items():
            if value == 'Details':
                isbn = key
                return redirect(url_for('auth.manager_book_details', isbn=isbn))

@bp.route('/manager/books/details/<isbn>', methods=('GET', 'POST'))
@role_required([2])
def manager_book_details(isbn):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM books WHERE ISBN = %s;''',[isbn])
    details = cur.fetchone()
    cur.execute('''SELECT name FROM category c INNER JOIN book_category bk on c.category_id = bk.category_id \
               where bk.ISBN = %s;''', [isbn])
    categories = cur.fetchall()
    cur.execute('''SELECT name FROM author a INNER JOIN author_book ab on a.author_id = ab.author_id \
               where ab.ISBN = %s;''', [isbn])
    authors = cur.fetchall()
    cur.execute('''SELECT copies_available FROM book_school WHERE ISBN=%s AND school_id = %s;''', [isbn, session['school_id']])
    copies = cur.fetchall()
    cur.close()
    in_school = 1
    if copies == ():
        in_school = 0
    if request.method == 'GET':
        return render_template('manager_book_details.html', details = details, categories = categories, authors = authors, in_school = in_school, copies = copies) 
    if request.method == 'POST':
        if request.form.get('Edit Book Info'):
            cur = mysql.connection.cursor()
            cur.execute('''SELECT category_id, name FROM category''')
            all_categories=cur.fetchall()
            return render_template('edit_book.html', details = details, authors = authors, bk_categories = [row[0] for row in categories], all_categories=all_categories)
        
        if request.form.get('Save'):
            title = request.form['title']
            isbn = request.form['isbn']
            authors = request.form['authors']
            publisher = request.form['publisher']
            page_number = request.form['page_number']
            summary = request.form['summary']
            language = request.form['language']
            keywords = request.form['keywords']
            cur = mysql.connection.cursor()
            query = f"UPDATE books SET title='{title}', publisher='{publisher}', page_number={page_number}, summary='{summary}',\
                  language='{language}', keywords={keywords}' WHERE ISBN='{isbn}';"
            cur.execute(query)
            mysql.commit()
            author_list=authors.split(',')
            for author in author_list:
                query =f"SELECT author_id FROM author WHERE name='{author}';"
                cur.execute(query)
                author_id = cur.fetchall()
                if author_id == ():
                    query = f"INSERT INTO author (name) VALUES '{author}';"
                    cur.execute(query) 
                    mysql.commit()
            ###not finished


        return render_template('manager_book_details.html', details = details, categories = categories, authors = authors, in_school = in_school, copies = copies) 

@bp.route('/manager/pending_reviews', methods=('GET', 'POST'))
@role_required([2])
def pending_reviews():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT pr.review_id, pr.star_review, pr.review_text, pr.ISBN, pr.id_user FROM pending_reviews pr INNER JOIN users u ON pr.id_user = u.id_user \
                WHERE u.school_id = %s''', [session['school_id']])
    pending_reviews = list(cur.fetchall())
    title = []
    isbn = []
    username = []
    for review in pending_reviews:
        isbn.append(review[3])
        user_id = review[4]
        cur.execute('''SELECT title FROM books WHERE ISBN=%s''', [review[3]])
        title.append(cur.fetchone())
        cur.execute('''SELECT username FROM users WHERE id_user=%s''', [user_id])
        username.append(cur.fetchone())
    cur.close()
    if request.method == 'GET':
        return render_template('pending_reviews.html', title = title, isbn = isbn, username = username, pending_reviews = pending_reviews)
    if request.method == 'POST':
        for key, value in request.form.items():   #request.form is a dictionary we iterate to find which value is in

            
            if value == 'Reject':         #if value is reject that means reject button was pressed and we get the key which holds the review_id
                review_id = key 
                cur = mysql.connection.cursor()
                cur.execute('''DELETE FROM pending_reviews WHERE review_id=%s''', [review_id])
                mysql.connection.commit()
                cur.close()
                return redirect('/manager/pending_reviews')
            if value == 'Approve':
                review_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT * FROM pending_reviews WHERE review_id=%s''', [review_id])
                data = cur.fetchone()
                cur.execute('''INSERT INTO reviews(star_review, review_text, ISBN, id_user) VALUES('{star_review}', '{review_text}', '{ISBN}', {id_user});'''.format(star_review=data[1], \
                        review_text=data[2], ISBN=data[3],id_user=data[4]))
                cur.execute('''DELETE FROM pending_reviews WHERE review_id=%s''', [review_id])
                mysql.connection.commit()
                cur.close()
                return redirect('/manager/pending_reviews')

@bp.route('/manager/pending_registrations', methods=('GET', 'POST'))
@role_required([2])
def pending_registrations():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM users_unregistered WHERE school_id = %s''', [session['school_id']])
    applications = list(cur.fetchall())
    cur.close()
    if request.method == 'GET':
        return render_template('pending_registrations.html', applications = applications)
    if request.method == 'POST':
        if request.form.get('Reject'):
            cur = mysql.connection.cursor()
            id = request.form.get('Reject')[8:]
            cur.execute('''DELETE FROM users_unregistered WHERE id_user = %s''', [id])
            mysql.connection.commit()
            cur.close()
            return redirect('/manager/pending_registrations')
        if request.form.get('Accept'):
            id = request.form.get('Accept')[8:]
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM users_unregistered WHERE id_user = %s''', [id])
            user_data = cur.fetchone()
            name = user_data[1]
            username=  user_data[2]
            password = user_data[3]
            school_id = user_data[4]
            role = user_data[5]
            birthday = user_data[6] 
            cur.execute('''SELECT name FROM schools WHERE school_id = %s''', [school_id])
            school_name = cur.fetchone()[0]
            cur.execute('''INSERT INTO users(name, username, password, school_id, role, birthday) \
                    VALUES ('{name}', '{username}', '{password}', {school_id}, {role}, '{birthday}');'''.format(name=name,\
                             username=username, password=password,school_id=school_id, role=role, birthday=birthday))
            cur.execute('''SELECT id_user FROM users WHERE username=%s''', [username])
            new_id = cur.fetchone()[0]
            mysql.connection.commit()
            cur.execute('''DELETE FROM users_unregistered WHERE id_user = %s''', [id])
            mysql.connection.commit()
            cur.close()
            return redirect(url_for('.passcard',id=new_id))
            
@bp.route('/manager/pending_registrations/new_user_passcard<id>')
@role_required([2])
def passcard(id):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM users WHERE id_user = %s''', [id])
    user_data = cur.fetchone()
    name = user_data[1]
    username=  user_data[2]
    password = user_data[3]
    school_id = user_data[4]
    role = user_data[5] 
    birthday = user_data[6] 
    cur.execute('''SELECT name FROM schools WHERE school_id = %s''', [school_id])
    school_name = cur.fetchone()[0]
    image = make_image(name, username, birthday, role, school_name, "pass_{id}".format(id=id))
    return render_template("pass_card.html", img_data=image)

@bp.route('/manager/pending_lendings', methods=('GET', 'POST'))
@role_required([2])
def pending_lendings():
    delete_expired_bookings()
    cur = mysql.connection.cursor()
    school_id = session['school_id']
    title = []
    booker_username = []
    copies = []
    active_lendings = []
    booker_role = []
    cur.execute('''SELECT * FROM booking WHERE school_id=%s ORDER BY date_of_booking ASC;''', [school_id])
    bookings = list(cur.fetchall())
    for booking in bookings:
        isbn = booking[3]
        booker_id = booking[2]
        cur.execute('''SELECT title FROM books WHERE ISBN=%s''', [isbn])
        title.append(cur.fetchone())
        cur.execute('''SELECT username, role FROM users WHERE id_user=%s''', [booker_id])
        a = cur.fetchone()
        booker_username.append(a[0])
        booker_role.append(a[1])
        cur.execute(''' SELECT copies_available FROM book_school WHERE isbn = %s AND school_id = %s''', [isbn, school_id])
        copies.append(cur.fetchone())
        cur.execute('''SELECT count(*) FROM lending WHERE id_user = %s AND return_date is NULL''', [booker_id])
        active_lendings.append(cur.fetchone())
    cur.close()
    if request.method == 'GET':
        return render_template('pending_lendings.html', copies = copies, bookings = bookings, booker_username = booker_username,
            title = title, active_lendings = active_lendings, booker_role = booker_role)
    if request.method == 'POST':
        if request.form.get('Lend'):
            booking_id =  request.form.get('Lend')[7:]
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM booking WHERE booking_id = %s''', [booking_id])
            books_to_lend = cur.fetchone()
            cur = mysql.connection.cursor()
            cur.execute('''INSERT INTO lending (borrow_date, id_user, ISBN, school_id) \
                    VALUES ('{borrow_date}', {id_user}, '{ISBN}', {school_id});'''.format(borrow_date=date.today(),\
                             id_user=books_to_lend[2], ISBN=books_to_lend[3],school_id=books_to_lend[4]))
            cur.execute('''DELETE FROM booking WHERE booking_id = %s''', [booking_id])
            mysql.connection.commit()
            cur.close()
            return redirect('/manager/pending_lendings')
            
@bp.route('/manager/active_lendings', methods=('GET', 'POST'))
@role_required([2])
def active_lendings():
    cur = mysql.connection.cursor()
    school_id = session['school_id']
    cur.execute('''SELECT * FROM lending WHERE school_id=%s AND return_date is NULL ORDER BY borrow_date ASC;''', [school_id])
    lendings = list(cur.fetchall())
    title = []
    borrower_username = []
    for lending in lendings:
        isbn = lending[4]
        borrower_id = lending[3]
        cur.execute('''SELECT title FROM books WHERE ISBN=%s''', [isbn])
        title.append(cur.fetchone())
        cur.execute('''SELECT username FROM users WHERE id_user=%s''', [borrower_id])
        borrower_username.append(cur.fetchone())
    cur.close()
    if request.method == 'GET':
        return render_template('active_lendings.html', lendings = lendings, borrower_username = borrower_username,
            title = title)
    if request.method == 'POST':
        for key, value in request.form.items():
            if value == 'Return':
                lending_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT * FROM lending WHERE lending_id = %s''', [lending_id])
                books_to_return = cur.fetchone()
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE lending SET return_date = %s WHERE lending_id = %s;''', [date.today(),lending_id])
                mysql.connection.commit()
                cur.close()
                return redirect('/manager/active_lendings')

@bp.route('/manager/active_users', methods=('GET', 'POST'))
@role_required([2])
def active_users():
    cur = mysql.connection.cursor()
    school_id = session['school_id']
    cur.execute('''SELECT * FROM users WHERE school_id=%s AND active=1 ORDER BY id_user;''', [school_id])
    users = list(cur.fetchall())
    name = []
    username = []
    role = []
    birthday = []
    user_id = []
    for user in users:
        user_id.append(user[0])
        name.append(user[1])
        role.append(user[5])
        username.append(user[2])
        birthday.append(user[6])
    cur.close()
    if request.method == 'POST':
        for key,value in request.form.items():

            if value == 'search':
                search_name = request.form['name']
                cur = mysql.connection.cursor()
                cur.execute('''SELECT * FROM users WHERE name=%s AND school_id=%s''', [search_name, school_id])
                user_info = cur.fetchone()
                cur.close()
                if user_info is None:
                    flash('User does not exist. Try again!')
                    return render_template('active_users.html', name=name, username=username, role=role,birthday=birthday, user_id=user_id)
                    
                else:
                   user_id = user_info[0]
                   role = user_info[5]
                   username = user_info[2]
                   birthday = user_info[6] 
                   return render_template('single_user_info.html', user_id = user_id, role = role, username = username, birthday = birthday, name=search_name)

            if value == 'Edit User':
                user_id = key
                return redirect(url_for('.edit_user', user_id=user_id))
            
            if value == 'Show Delayed Returns':
                user_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT b.title, b.ISBN, l.borrow_date FROM lending l INNER JOIN books b on l.ISBN = b.ISBN \
                    WHERE l.id_user=%s AND l.return_date is NULL AND l.borrow_date < %s''', [user_id, datetime.now().date()-timedelta(days=7)])            
                title = []
                borrow_date = []
                isbn = []
                results = list(cur.fetchall())
                for result in results:
                    title.append(result[0])
                    borrow_date.append(result[2])
                    isbn.append(result[1])
                cur.execute('''SELECT username FROM users WHERE id_user=%s''', [user_id])
                username = cur.fetchone()[0]
                cur.close()
                return render_template('delayed_books.html', title=title, borrow_date=borrow_date, isbn=isbn, user_id = user_id, username=username)
            
            if value == 'Show Lending History':
                user_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT b.title, b.ISBN, l.borrow_date, l.return_date, l.lending_id \
                      FROM lending l INNER JOIN books b on l.ISBN = b.ISBN where id_user = %s \
                    ORDER BY borrow_date DESC;''', [user_id])
                book = cur.fetchall()
                cur.execute('''SELECT username FROM users WHERE id_user=%s''', [user_id])
                username = cur.fetchone()[0]
                cur.close()            
                return render_template('user_lending_history.html', books=book, user_id = user_id, username = username)     
            
            if value == 'Show Active Bookings':
                delete_expired_bookings()
                user_id = key 
                cur = mysql.connection.cursor()               
                cur.execute('''SELECT b.ISBN, b.title, bk.date_of_booking FROM booking bk INNER JOIN books b \
                    on bk.ISBN = b.ISBN where id_user = %s ORDER BY date_of_booking DESC;''', [user_id])
                book = cur.fetchall()
                cur.execute('''SELECT count(*) FROM lending WHERE id_user = %s AND return_date is NULL''', [user_id])
                active_lendings = cur.fetchone()[0]
                cur.execute('''SELECT role, school_id, username FROM users WHERE id_user = %s''', [user_id])
                res = cur.fetchall()
                booker_role = res[0][0]
                school_id = res[0][1]
                username = res[0][2]
                cur.execute('''SELECT * FROM booking WHERE id_user = %s''', [user_id])
                bookings = cur.fetchall()
                copies = []
                for b in book:
                    cur.execute('''SELECT copies_available FROM book_school WHERE ISBN = %s AND school_id = %s''', [b[0], school_id])
                    copies.append(cur.fetchone()[0])
                cur.close()
                return render_template('user_active_bookings.html', books=book, user_id = user_id, active_lendings=active_lendings,\
                                       booker_role = booker_role, copies = copies, bookings = bookings, username = username)     
            if value == 'Lend':
                booking_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT * FROM booking WHERE booking_id = %s''', [booking_id])
                books_to_lend = cur.fetchone()
                cur = mysql.connection.cursor()
                cur.execute('''INSERT INTO lending (borrow_date, id_user, ISBN, school_id) \
                        VALUES ('{borrow_date}', {id_user}, '{ISBN}', {school_id});'''.format(borrow_date=date.today(),\
                                 id_user=books_to_lend[2], ISBN=books_to_lend[3],school_id=books_to_lend[4]))
                cur.execute('''DELETE FROM booking WHERE booking_id = %s''', [booking_id])
                mysql.connection.commit()
                cur.close()
                return redirect('/manager/active_users')
            if value == 'Return':
                lending_id = key
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE lending SET return_date = '{date}' WHERE lending_id = {id};'''.format(date=date.today(),id=lending_id))
                mysql.connection.commit()
                flash("Book successfully returned!")
                cur.close()
                return redirect('/manager/active_users')
            
            if value == 'Show Reviews':
                user_id = key
                cur = mysql.connection.cursor()
                cur.execute('''SELECT b.title, b.ISBN, r.review_text, r.star_review FROM reviews r INNER JOIN books b ON b.ISBN = r.ISBN WHERE id_user=%s;''', [user_id])
                reviews = cur.fetchall()
                sum = 0
                for review in reviews:  #find average star review of user
                    sum += review[3]
                average_star_review = sum/len(review)
                cur.execute('''SELECT username FROM users WHERE id_user=%s''', [user_id])
                username = cur.fetchone()[0]
                cur.close()
                return render_template('user_reviews.html', reviews = reviews, username = username, average = average_star_review)
            
            if value == 'Deactivate User':
                user_id = key
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE users SET active=0 WHERE id_user=%s''', [user_id])
                mysql.connection.commit()
                flash("User deactivated!")
                return redirect('/manager/active_users')            
        
    if request.method == 'GET':
        return render_template('active_users.html', name=name, username=username, role=role,birthday=birthday, user_id=user_id)

@bp.route('/manager/active_users/edit_user/<user_id>', methods=('GET', 'POST'))
@role_required([2])
def edit_user(user_id):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM users WHERE id_user=%s;''', [user_id])
    user = cur.fetchone()
    name = user[1]
    role = user[5]
    birthday = user[6]
    username = user[2]
    cur.close()
    if request.method == 'POST':
        school_id = request.form.get('schools')
        name = request.form['name']
        birthday = request.form['birthday']
        role = request.form.get('role')
        cur = mysql.connection.cursor()
        cur.execute('''UPDATE users SET name = %s, birthday = %s, role = %s WHERE id_user = %s;''', [name, birthday, role, user_id])
        mysql.connection.commit()
        return render_template('edit_user.html', name=name, role=role, username=username, birthday=birthday)
    if request.method == 'GET':
       return render_template('edit_user.html', name=name, role=role, username=username, birthday=birthday)

@bp.route('/details/<isbn>', methods=('GET', 'POST'))
def details(isbn):
    delete_expired_bookings()
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM books WHERE ISBN = %s;''',[isbn])
    details = cur.fetchone()
    cur.execute('''SELECT name FROM category c INNER JOIN book_category bk on c.category_id = bk.category_id \
               where bk.ISBN = %s;''', [isbn])
    categories = cur.fetchall()
    cur.execute('''SELECT name FROM author a INNER JOIN author_book ab on a.author_id = ab.author_id \
               where ab.ISBN = %s;''', [isbn])
    authors = cur.fetchall()
    cur.execute('''SELECT count(*) FROM booking WHERE id_user = %s''', [session['userid']])
    no_of_active_bookings = cur.fetchone()[0]
    can_book = True
    cur.execute('''SELECT role FROM users WHERE id_user = %s''', [session['userid']])
    role = cur.fetchone()[0]
    # find delayed books
    cur.execute('''SELECT count(*) FROM lending WHERE return_date IS NULL AND id_user = %s AND borrow_date < %s''', \
                [session['userid'], datetime.now()-timedelta(days=7)])
    if cur.fetchone()[0]:
        can_book = False
    if no_of_active_bookings >= 2 and role == 0:
        can_book = False
    elif no_of_active_bookings >= 1 and role == 1:
        can_book = False
    if request.method == 'GET':
        return render_template('book_details.html', details = details, categories = categories, authors = authors)
    if request.method == 'POST':
        if request.form.get('details'):
            if not can_book:
                flash("You have reached your upper limit for the week. Try again later, or return any books you may have borrowed.")
                return render_template('book_details.html', details = details, categories = categories, authors = authors)
            now = datetime.now()
            dt_string = now.strftime("%Y/%m/%d %H:%M:%S")
            cur_insert = mysql.connection.cursor()
            cur_insert.execute('''INSERT INTO booking (date_of_booking, id_user, ISBN, school_id) \
                        VALUES ('{date_of_booking}', {id_user}, '{ISBN}', {school_id});'''.format(date_of_booking=dt_string,\
                                 id_user=session['userid'], ISBN=isbn,school_id=session['school_id']))
            mysql.connection.commit()
            flash('Your reservation was submitted successfully')
            return render_template('book_details.html', details = details, categories = categories, authors = authors)
        
        if request.form.get('review'):
            return render_template('add_review.html', title = details[0])
        
        if request.form.get('submit review'):
            review = request.form['add_review']
            stars = request.form.get('rate')
            curs = mysql.connection.cursor()
            curs.execute('''INSERT INTO pending_reviews (star_review, review_text, ISBN, id_user) \
                        VALUES ({star_review}, '{review_text}', '{ISBN}', {id_user});'''.format(star_review=int(stars),\
                                 id_user=session['userid'], ISBN=isbn,review_text=review))
            mysql.connection.commit()
            curs.close()
            flash("Your Review was submitted for approval")
            return render_template('book_details.html', details = details, categories = categories, authors = authors)
            