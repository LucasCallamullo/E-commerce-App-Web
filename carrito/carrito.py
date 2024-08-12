

class Carrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session

        carrito = self.session.get("carrito")

        if not carrito:
            carrito = self.session["carrito"] = {}

        self.carrito = carrito

    @property
    def total(self):
        """
        Notes:
            - Se añade el atributo self.total para realizar el calculo solo una vez mediante
            el context_processors.py, y despues pasarlo como contexto
        """
        total = 0
        if self.carrito:
            total = sum(item['precio'] * item['cantidad'] for item in self.carrito.values())
        return total

    @property
    def items(self):
        return self.carrito.items()

    # ======================================================================
    #                   ADD n LESS Products
    # ======================================================================
    def add_producto(self, producto):

        producto_id_str = str(producto.id)  # Convertir el ID del producto a cadena de texto

        if producto_id_str not in self.carrito.keys():
            self.carrito[producto_id_str] = {
                "id": producto.id,
                "nombre": producto.nombre,
                "precio": producto.precio,
                "imagen": producto.imagen.url,
                "cantidad": 1
            }

        else:
            self.carrito[producto_id_str]["cantidad"] += 1

        self.save()

    def less_producto(self, producto_id):
        producto_id_str = str(producto_id)  # Convertir el ID del producto a cadena de texto

        if self.carrito[producto_id_str]["cantidad"] > 1:
            self.carrito[producto_id_str]["cantidad"] -= 1
        else:
            # Opcionalmente, podemos eliminar el producto si la cantidad llega a 0
            del self.carrito[producto_id_str]

        # guardamos los cambios
        self.save()

    # ======================================================================
    #                   SAVE, CLEAR; DELETE
    # ======================================================================
    def save(self):
        self.session["carrito"] = self.carrito
        self.session.modified = True

    def remove_producto(self, producto_id):
        producto_id_str = str(producto_id)  # Convertir el ID del producto a cadena de texto

        # if producto_id_str in self.carrito:
        del self.carrito[producto_id_str]
        self.save()

    def clear_producto(self):
        self.carrito = {}
        self.save()



    def get_total_precio(self):
        return sum(item["precio"] * item["cantidad"] for item in self.carrito.values())

    def get_total_items(self):
        return sum(item["cantidad"] for item in self.carrito.values())



