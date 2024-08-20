

document.addEventListener('DOMContentLoaded', function() {
    var dropdownButton = document.getElementById("drop-cats");
    var dropdownMenu = document.querySelector('.dropdown-menu');
    var arrow = document.querySelector('.arrow');

    // Alternar el menú principal al hacer clic en el botón o en el icono de flecha
    function toggleMenu(event) {
        event.stopPropagation();



        // Si el menú está mostrado, aplicar animación de cierre
        if (dropdownMenu.classList.contains('show')) {

            dropdownMenu.style.overflow = 'hidden'; // Restablecer el overflow
            dropdownMenu.style.animation = 'slideUp 0.5s ease forwards'; // Animación de cierre
            dropdownMenu.addEventListener('animationend', function() {
                dropdownMenu.classList.remove('show');
                dropdownMenu.style.animation = ''; // Limpiar la animación para futuras aperturas
            }, { once: true });
        } else {
            // Si el menú está oculto, aplicar animación de apertura
            dropdownMenu.classList.add('show');
            dropdownMenu.style.animation = 'slideDown 0.5s ease forwards'; // Animación de apertura

            dropdownMenu.addEventListener('animationend', function() {
                dropdownMenu.style.overflow = 'visible';
                dropdownMenu.style.animation = ''; // Limpiar la animación para futuras aperturas
            }, { once: true });

        }
        arrow.classList.toggle('rotate');
    }

    dropdownButton.addEventListener('click', toggleMenu);
    // Asegura que el clic en el icono también despliegue el menú
    arrow.addEventListener("click", function(event) {
        event.stopPropagation(); // Evitar que el evento se propague al botón
        toggleMenu(event); // Pasa el evento a la función toggleMenu
    });

    // Cerrar el menú si se hace clic fuera de él
    document.addEventListener('click', function(event) {
        if (!dropdownMenu.contains(event.target) && !dropdownButton.contains(event.target)) {

            if (dropdownMenu.classList.contains('show')) {

                dropdownMenu.style.overflow = 'hidden'; // Restablecer el overflow
                dropdownMenu.style.animation = 'slideUp 0.5s ease forwards'; // Animación de cierre
                dropdownMenu.addEventListener('animationend', function() {

                    dropdownMenu.classList.remove('show');
                    dropdownMenu.style.animation = ''; // Limpiar la animación para futuras aperturas

                }, { once: true });
            }
            arrow.classList.remove('rotate');
        }
    });


});



/*
document.addEventListener('DOMContentLoaded', function() {
    var dropdownButton = document.getElementById("drop-cats");
    var dropdownContent = document.querySelector('.dropdown-content');
    var arrow = document.querySelector('.arrow');

    // Alternar el menú principal al hacer clic en el botón
    dropdownButton.addEventListener('click', function(event) {
        event.stopPropagation();
        dropdownContent.classList.toggle('show');
        arrow.classList.toggle('rotate');
    });

    // Cerrar el menú si se hace clic fuera de él
    document.addEventListener('click', function(event) {
        if (!dropdownContent.contains(event.target) && !dropdownButton.contains(event.target)) {
            dropdownContent.classList.remove('show');
            arrow.classList.remove('rotate');
        }
    });
});*/