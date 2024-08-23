## Proyecto WebApp Ecommerce

### Descripción
Este proyecto es una WebApp de Ecommerce completamente funcional desarrollada con Django para el back-end y un front-end responsive utilizando HTML, CSS (Bootstrap), y JavaScript. La aplicación permite a los usuarios gestionar productos y cuentas de manera eficiente a través de un sistema CRUD, con funcionalidades avanzadas como autenticación segura y actualizaciones de contenido en tiempo real mediante AJAX.

![Static Badge](https://img.shields.io/badge/Documentation-EN-blue) [![Documentation ES](https://img.shields.io/badge/Documentation-ES-green)](https://github.com/LucasCallamullo/APP-Mobile-in-Python/blob/main/Read_es.md)

### [EN]
#### Technologies
* Backend: Python, Django
* Frontend: HTML, CSS (Bootstrap), JavaScript
* Base de Datos: MySQL
* Otros: AJAX

#### Características
* API RESTful: Implementada en Django para manejar todas las operaciones CRUD (Crear, Leer, Actualizar, Eliminar) tanto para productos como para usuarios.
* Interfaz Responsive: Diseño adaptable a diferentes dispositivos utilizando HTML, CSS y Bootstrap.
* Autenticación Segura: Sistema de registro y autenticación de usuarios integrado, asegurando la privacidad y seguridad de los datos.
* Actualizaciones en Tiempo Real: Uso de AJAX para mejorar la experiencia del usuario, permitiendo acciones como la actualización del carrito de compras sin recargar la página.
* Base de Datos MySQL: Conexión y manipulación de datos mediante el ORM de Django, garantizando la integridad y eficiencia en las operaciones con la base de datos.

#### Instalación y Configuración
1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/LucasCallamullo/E-commerce-App-Web.git
   cd E-commerce-App-Web ```

2. **Instalar Dependencias**:
   ```bash
   pip install mysqlclient
   pip install django
   pip install pandas
   pip install openpyxl```

3. **Aplicar las Migraciones: Ejecuta las migraciones para crear las tablas en la base de datos.**:
   ```bash
   python manage.py makemigrations
   python manage.py migrate```

4. **Crear un Superuser (Opcional): Si necesitas acceso al panel de administración, crea un superusuario.**:
   ```bash
   python manage.py createsuperuser ```

5. **Ejecutar el Script load_data: Este comando cargará los datos iniciales en tu base de datos utilizando pandas y openpyxl.**
   ```bash
   python manage.py load_data ```
6. **Ejecutar el Script load_product_data: Similar al paso anterior, este comando cargará los productos en la base de datos (nombres, precios, categorías, etc). **
   ```bash
   python manage.py load_product_data ```

### [ES]
[![Documentation ES](https://img.shields.io/badge/Documentation-ES-green)](https://github.com/LucasCallamullo/APP-Mobile-in-Python/blob/main/Read_es.md)

## Video de YouTube
[![Ver el video](https://img.youtube.com/vi/)](https://www.youtube.com/watch?v=Hkyp8LaPAPg)



## Images:
![](https://i.pinimg.com/736x/73/5b/6e/735b6ebb2cf852e28472a2efcc378e9e.jpg)
![](https://i.pinimg.com/736x/e1/1b/8a/e11b8a41f2f803cb0bcbcc735b4fcbbf.jpg)

> Some screens of the app
