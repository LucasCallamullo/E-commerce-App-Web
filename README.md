## Proyecto WebApp Ecommerce

### Description
This project is a fully functional Ecommerce WebApp developed with Django for the back-end and a responsive front-end using HTML, CSS (Bootstrap), and JavaScript. The application allows users to efficiently manage products and accounts through a CRUD system, with advanced features such as secure authentication and real-time content updates using AJAX.

[![Static Badge](https://img.shields.io/badge/Documentation-EN-blue)](https://github.com/LucasCallamullo/E-commerce-App-Web/blob/main/README.md) [![Documentation ES](https://img.shields.io/badge/Documentation-ES-green)](https://github.com/LucasCallamullo/E-commerce-App-Web/blob/main/README-ES.md)

### [EN]
#### Technologies
* Backend: Python, Django
* Frontend: HTML, CSS (Bootstrap), JavaScript
* Database: MySQL
* Others: AJAX

#### Features
* RESTful API: Implemented in Django to handle all CRUD operations (Create, Read, Update, Delete) for both products and users.
* Responsive Interface: Adaptive design for different devices using HTML, CSS, and Bootstrap.
* Secure Authentication: Integrated user registration and authentication system, ensuring data privacy and security.
* Real-Time Updates: Utilization of AJAX to enhance user experience, allowing actions like updating the shopping cart without page reloads.
* MySQL Database: Connection and data manipulation through Django's ORM, ensuring integrity and efficiency in database operations.

#### Installation and Setup
1. **Clone the repository:**:
   ```bash
   git clone https://github.com/LucasCallamullo/E-commerce-App-Web.git
   cd E-commerce-App-Web

2. **Install Dependencies**:
   ```bash
   pip install mysqlclient
   pip install django
   pip install pandas
   pip install openpyxl

3. **Apply Migrations: Run the migrations to create the tables in the database**:
   ```bash
   python manage.py makemigrations
   python manage.py migrate

4. **Create a Superuser (Optional): If you need access to the admin panel, create a superuser**:
   ```bash
   python manage.py createsuperuser

5. **Run the load_data Script: This command will load initial data into your database using pandas and openpyxl**
   ```bash
   python manage.py load_data
6. **Run the load_product_data Script: Similar to the previous step, this command will load products into the database (names, prices, categories, etc.).**
   ```bash
   python manage.py load_product_data

### [ES]
[![Documentation ES](https://img.shields.io/badge/Documentation-ES-green)](https://github.com/LucasCallamullo/E-commerce-App-Web/blob/main/README-ES.md)




### Images:
![](https://i.pinimg.com/736x/73/5b/6e/735b6ebb2cf852e28472a2efcc378e9e.jpg)
![](https://i.pinimg.com/736x/e1/1b/8a/e11b8a41f2f803cb0bcbcc735b4fcbbf.jpg)

> Some screens of the app
