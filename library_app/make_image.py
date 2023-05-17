# make_image.py
# Importing the PIL library
from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
import os, io, base64

from flask import send_file

def make_image(n, u, b, r, s, image_name):
    # Open an Image
    img = Image.open('{path}/library_app/static/background.jpg'.format(path = os.path.dirname(os.path.abspath("author_book.txt"))))
 
    # Call draw Method to add 2D graphics in an image
    I1 = ImageDraw.Draw(img)
 
    # Custom font style and font size
    myFont1 = ImageFont.truetype('NotoSansMono-Bold.ttf', 50)
    myFont2 = ImageFont.truetype('NotoSansMono-Regular.ttf', 40) 
    myFont3 = ImageFont.truetype('NotoSansMono-Regular.ttf', 40)
    
    school = s + "\nLibrary"
    I1.multiline_text((46, 46), school, font=myFont1, fill =(255, 255, 255))
    name =     "Name:         " + n
    username = "Username: " + u
    birthday = "Birthday:     " + str(b)
    if (r == 0):
        role = "Student's pass"
    if (r == 1):
        role = "Teacher's pass"
    I1.text((46, 252), name, font=myFont2, fill=(0,0,0)) 
    I1.text((46, 342), username, font=myFont2, fill=(0,0,0)) 
    I1.text((46, 432), birthday, font=myFont2, fill=(0,0,0)) 
    I1.text((600, 540), role, font=myFont3, fill=(0,0,0))
    # Display edited image
    image_data = io.BytesIO()
    img.save(image_data, "PNG")
    encoded_img = base64.b64encode(image_data.getvalue())   
    img_data = encoded_img
    img.show()
    #img.save('{path}\\library_app\\static\\{image_name}.jpg'.format(path = os.path.dirname(os.path.abspath("author_book.txt")), image_name=image_name))
    
    return img_data.decode('utf-8')