from flask import Flask,render_template, request,redirect,Blueprint,flash,session, url_for, g
from flask_mysqldb import MySQL
import functools 



app = Flask(__name__)
 
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'school_libraries'
 
mysql = MySQL(app)

bp = Blueprint('auth',__name__, url_prefix='/')

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
            cur_username.execute('''(SELECT * FROM users WHERE username = %s) \
                UNION (SELECT * FROM users_unregistered WHERE username = %s);''',\
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

@bp.route('/logout', methods=('GET', 'POST'))
def logout():
    session['loggedin'] = False
    return redirect('/')

@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cur = mysql.connection.cursor()
        message = None
        cur.execute('''SELECT * FROM users WHERE username = %s AND password = %s;''', (username, password))
        user = cur.fetchone()
        
        if user:
            session.clear()
            session['loggedin'] = True
            session['userid'] = user[0]
            session['name'] = user[1]
            session['username'] = username
            return redirect('/user')

        else:
            flash("incorrect data")

    return render_template('login.html')


@bp.route('/user', methods=('GET', 'POST'))
def show_books():
    pid = session['userid']
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM `category`")
    categories = cursor.fetchall()
    cursor.execute("SELECT school_id FROM users WHERE id_user = %s;", [pid])
    school_id = cursor.fetchall()
    name = session['name']
    if request.method == 'POST':
        if request.form.get('show books'):
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM lending l INNER JOIN books b on l.ISBN = b.ISBN where id_user = %s;''', [pid])
            book = cur.fetchall()
            return render_template('my_books.html', books=book)

        if request.form.get('search category'):
           options = request.form.getlist('options[]')
           search_cur = mysql.connection.cursor()
           query = []
           for option in options:
                query.append('''(SELECT ISBN FROM book_category WHERE category_id = %s)''' % (option))
           u = " INTERSECT "
           u = u.join(query)
           u = "(" + u + ") bk"
           print('''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN;''')
           search_cur.execute('''SELECT * FROM ''' + u + ''' INNER JOIN books b on bk.ISBN = b.ISBN \
           INNER JOIN book_school bs on bs.ISBN = b.ISBN WHERE bs.school_id = %s;''', [school_id])
           books = search_cur.fetchall()
           if books == ():
               flash("no results found")
               return redirect('/user')
           else:
               return render_template('search.html', books = books)
        
        if request.form.get('details'):
            isbn = request.form.get('details')
            return redirect(url_for(".details",isbn=isbn))

      
    if request.method == 'GET':
        return render_template('user.html', categories=categories, name = name)
    


@bp.route('/details/<isbn>', methods=('GET', 'POST'))
def details(isbn):
    return render_template('book_details.html', isbn = isbn)
