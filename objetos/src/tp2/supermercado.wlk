// TODO: Implementar todo lo necesario para cumplir con los requerimientos aquí 
class Carrito {
	const productos = []
	
	method agregar(producto) {
		productos.add(producto)
	}
	
	method estaVacio() {
		return productos.isEmpty()
	}
	
	method cantidadDeProductos() {
		return productos.size()
	}
	
	method totalAAbonar() {
		return productos.sum({producto => producto.precio()})
	}
	
	method productoMasCaro() {
		if(self.estaVacio()) {
			self.error("No hay productos en el carrito")	
		}
		return productos.max({producto => producto.precio()})
	}
	
	method detalleDeCompra() {
		return productos.map({producto => producto.descripcion()}).asSet().asList().sortedBy({x, y => x < y})
	}
}

const carrito = new Carrito() 

class ProductoUnitario {
	var property descripcion
	var property precioUnitario
	
	method precio() {
		return precioUnitario
	}
}

class ProductoPorPeso {
	var property descripcion
	var property precioPorKilo
	var property peso
	
	method precio() {
		return precioPorKilo * peso
	}
}