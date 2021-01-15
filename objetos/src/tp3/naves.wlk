class Nave {
	var property velocidad = 0
	
	method propulsar(){
		velocidad += 20000
	}
	
	method encuentraEnemigo(){
		self.recibirAmenaza()
		self.propulsar()
	}
	
	method excedidaDeVelocidad(){
		const maximo = self.velocidadMaxima()
		return velocidad > maximo
	}  
	
	method velocidadMaxima()
	
	method enPeligro()
	
	method recibirAmenaza()
}

class NaveDeCarga inherits Nave {

	var property carga = 0

	method sobrecargada() = carga > 100
	
	override method velocidadMaxima() {
		if(!self.sobrecargada()) {
			return 100000 
		}else {
			return 80000
		}
	}

	override method recibirAmenaza() {
		carga = 0
	}
	
	override method enPeligro(){
		return self.excedidaDeVelocidad()
	}

}

class NaveDePasajeros inherits Nave {

	var property alarma = false
	var property cantidadDePasajeros = 0
	const velocidadInicial = 300000

	method tripulacion() = cantidadDePasajeros + 4

	override method velocidadMaxima() = velocidadInicial / self.tripulacion() - if (cantidadDePasajeros > 100) 200 else 0

	override method recibirAmenaza() {
		alarma = true
	}
	
	override method enPeligro(){
		return (self.excedidaDeVelocidad() || alarma)
	}

}

class NaveDeResiduosRadioactivos inherits NaveDeCarga {
	override method recibirAmenaza() {
		velocidad = 0
	}
	
	override method velocidadMaxima() {
		return (0.75) * super()
	}
}
