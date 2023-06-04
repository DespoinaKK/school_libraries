import subprocess

#install necessary libraries
subprocess.run(['pip', 'install', 'Flask', 'Flask-MySQLdb', 'Pillow', 'Flask-WTF', 'Flask-Session', 'WTForms'])

#start flask app
subprocess.run(['flask','--app', 'library_app', 'run',  '--debugger'])

