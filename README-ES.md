## Proyecto WebApp Ecommerce

### Descripción
Este proyecto es una WebApp de Ecommerce completamente funcional desarrollada con Django para el back-end y un front-end responsive utilizando HTML, CSS (Bootstrap), y JavaScript. La aplicación permite a los usuarios gestionar productos y cuentas de manera eficiente a través de un sistema CRUD, con funcionalidades avanzadas como autenticación segura y actualizaciones de contenido en tiempo real mediante AJAX.

![Static Badge](https://img.shields.io/badge/Documentation-EN-blue) [![Documentation ES](https://img.shields.io/badge/Documentation-ES-green)](https://github.com/LucasCallamullo/APP-Mobile-in-Python/blob/main/Read_es.md)


### [ES]

### ⚙️ Tecnologías
| ![Python Badge](https://img.shields.io/badge/python-%2314354C.svg?style=for-the-badge&logo=python&logoColor=white) | ![Django Badge](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=green) | ![MySQL Badge](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) | ![Pandas Badge](https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white)
|:-:|:-:|:-:|:-:|


| ![HTML Badge](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) | ![JavaScript Badge](https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E) | ![CSS Badge](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) | ![Bootstrap 5 Badge](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white) | 
|:-:|:-:|:-:|:-:|


### 🛠️ Herramientas 
| ![Git Badge](https://img.shields.io/badge/git%20-%23F05033.svg?&style=for-the-badge&logo=git&logoColor=white) | [![GitHub Badge](https://img.shields.io/badge/github%20-%23121011.svg?&style=for-the-badge&logo=github&logoColor=white)](https://github.com/LucasCallamullo) | ![VSCode Badge](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white) | ![DBeaver Badge](https://img.shields.io/badge/dbeaver-382923?style=for-the-badge&logo=dbeaver&logoColor=white)
|:-:|:-:|:-:|:-:|


#### Características
* API RESTful: Implementada en Django para manejar todas las operaciones CRUD (Crear, Leer, Actualizar, Eliminar) tanto para productos como para usuarios.
* Interfaz Responsive: Diseño adaptable a diferentes dispositivos utilizando HTML, CSS y Bootstrap.
* Autenticación Segura: Sistema de registro y autenticación de usuarios integrado, asegurando la privacidad y seguridad de los datos.
* Actualizaciones en Tiempo Real: Uso de AJAX para mejorar la experiencia del usuario, permitiendo acciones como la actualización del carrito de compras sin recargar la página.
* Base de Datos MySQL: Conexión y manipulación de datos mediante el ORM de Django, garantizando la integridad y eficiencia en las operaciones con la base de datos.


#### Instalación y Configuración
1. **Clonar el repositorio:**:
   ```bash
   git clone https://github.com/LucasCallamullo/E-commerce-App-Web.git
   cd E-commerce-App-Web

2. **Instalar dependencias**:
   ```bash
   pip install -r requirements.txt

3. **Aplicar las Migraciones: Ejecuta las migraciones para crear las tablas en la base de datos.**:
   ```bash
   python manage.py makemigrations
   python manage.py migrate

4. **Ejecutar el Script load_data: Este comando cargará los datos iniciales en tu base de datos utilizando pandas y openpyxl.**
   ```bash
   python manage.py load_data
5. **Ejecutar el Script load_product_data: Similar al paso anterior, este comando cargará los productos en la base de datos (nombres, precios, categorías, etc).**
   ```bash
   python manage.py load_product_data


### Images:
![](https://i.pinimg.com/736x/73/5b/6e/735b6ebb2cf852e28472a2efcc378e9e.jpg)
![](https://i.pinimg.com/736x/e1/1b/8a/e11b8a41f2f803cb0bcbcc735b4fcbbf.jpg)

> Some screens of the app
