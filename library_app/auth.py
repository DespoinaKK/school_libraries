from flask import Flask,render_template, request,redirect,Blueprint,flash,session, url_for
from flask_mysqldb import MySQL
import functools 


app = Flask(__name__)
 
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'school_libraries'
 
mysql = MySQL(app)

bp = Blueprint('auth',__name__, url_prefix='/auth')


@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cur = mysql.connection.cursor()
        message = None
        cur.execute('''SELECT * FROM users WHERE username = %s AND password = %s;''', (username, password))
        user = cur.fetchone()
        print(user)
        if user:
            session.clear()
            session['loggedin'] = True
            session['userid'] = user[0]
            session['name'] = user[1]
            return redirect('/hello')

        else:
            flash("incorrect data")

    return render_template('login.html')


