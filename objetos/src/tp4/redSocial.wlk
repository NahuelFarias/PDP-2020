import usuario.*

// TODO: Definí la lógica acá

object publica {
	method loPuedeVer(usuarioPublicante, unUsuario) {
		return true
	}
}

class Privada {
	method loPuedeVer(usuarioPublicante, unUsuario) {
		return usuarioPublicante.tieneContacto(unUsuario)
	}
}

class NoVisible inherits Privada {
	var property listaNegra = #{}
	
	override method loPuedeVer(usuarioPublicante, unUsuario) {
		return super(usuarioPublicante, unUsuario) and listaNegra.contains(unUsuario).negate()
	}
}

class Publicacion {
	const property usuario
	const property fechaDePublicacion
	var property tipoDePrivacidad
	
	method estaDisponible(unaFecha) {
		return true
	}
	
	method esUsuarioPublicante(unUsuario) = usuario == unUsuario
	
	method puedeVer(usuarioPulicante, unUsuario) = tipoDePrivacidad.loPuedeVer(usuarioPulicante, unUsuario)
	
	method esVisible(unUsuario, unaFecha) {
		return self.esUsuarioPublicante(unUsuario) || ( self.puedeVer(usuario, unUsuario) and self.estaDisponible(unaFecha)	)
	}
}

class Historia inherits Publicacion {
	
	method fechaDeExpiracion() {
		return new Date(year = fechaDePublicacion.year(), 
			month = fechaDePublicacion.month(), 
			day = fechaDePublicacion.day() + 1
		)
	}
	
	override method estaDisponible(unaFecha) {
		return unaFecha <= self.fechaDeExpiracion()
	}
}