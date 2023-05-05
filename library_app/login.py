from flask import Flask,render_template, request
from flask_mysqldb import MySQL
 
app = Flask(__name__)
 
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'school_libraries'
 
mysql = MySQL(app)

@app.route('/')
def login():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT id_user FROM users WHERE id_user = 1;''')
    res = cur.fetchone()
    print(res[0])
    return str(res[0])