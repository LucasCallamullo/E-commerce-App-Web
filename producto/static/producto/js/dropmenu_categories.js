

// Alternar el menú principal al hacer clic en el botón
document.getElementById("drop-cats").addEventListener('click', function(event) {
    // Prevenir el cierre inmediato cuando se hace clic en el menú
    event.stopPropagation();
    document.querySelector('.dropdown-content').classList.toggle('show');
});

// Cerrar el menú si se hace clic fuera de él
document.addEventListener('click', function(event) {
    var dropdown = document.querySelector('.dropdown-content');
    if (!dropdown.contains(event.target) && !event.target.matches('#drop-cats')) {
        dropdown.classList.remove('show');
    }
});