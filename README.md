# ติดตั้งโปรเจ็กต์ djangShopping โดยใช้คำสั่ง git clone https://github.com/phphich/djangShopping.git
# สร้าง virtual environment ให้เรียบร้อย
# ติดตั้ง Package ต่าง ๆ ของโปรเจ็กต์ โดยใช้คำสั่ง pip install -r requirements.txt
# Log in เข้า mySQL โดยใช้ root 
# สร้างฐานข้อมูลใน mySQL ชื่อ dbtest
# นำสคริปต์ dbtest.sql ไป Execute ในฐานข้อมูล dbtest 
# สร้าง user ชื่อ bisdev พร้อมกำหนด รหัสผ่าน 12345 หรือชื่อและรหัสผ่านตามที่ต้องการก็ได้ 
# ให้สิทธิ์การเข้าถึงฐานข้อมูล dbtest แก่ bisdev
# กำหนดค่าในไฟล์ setting.py ในส่วนของ DATABASE โดยระบุค่าชื่อฐานข้อมูล, ชื่อผู้ใช้, รหัสผ่าน ให้ตรงกับที่สร้างไว้ในฐานข้อมูล 
# ใช้คำสั่ง python manage.py makemigrations และ python manage.py migrate เพื่อสร้างตารางข้อมูลใน mySQL,  และ python manage.py createuperuser เพื่อสร้างบัญชีผู้ดูแลระบบ 
