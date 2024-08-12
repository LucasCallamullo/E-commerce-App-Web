

// Selecciona todos los botones que tienen un ID que comienza con 'add-to-cart-'
document.querySelectorAll('[id^="add-to-cart-"]').forEach(button => {
    // Agrega un evento de clic a cada botón
    button.addEventListener('click', function() {
        // Extrae el ID del producto del ID del botón
        const productoId = button.id.split('-').pop();
        // Llama a la función handleActions para agregar el producto al carrito
        handleActions(productoId, 'add');
    });
});

// Función para obtener el valor del cookie por nombre actua como nuestro csrf token
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Comprueba si el cookie tiene el nombre deseado
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                // Extrae y decodifica el valor del cookie
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
