import usuario.*
import redSocial.*

// Para facilitar la creación de objetos de prueba
object fabrica {
	const property creador = new Usuario(nombre = "Tito")
	
	method fechaPublicacion() = new Date()
	
	method fechaLejanaAPublicacion() = self.fechaPublicacion().plusDays(10)
	method diaSiguienteAPublicacion() = self.fechaPublicacion().plusDays(1)
	
	method configurarContactos(){
		creador.agregarContacto(new Usuario(nombre = "Ana"))
		creador.agregarContacto(new Usuario(nombre = "Fito"))
	}
	
	method desconocido() = new Usuario(nombre = "Anónimo")
	method contactoDelCreador() = self.creador().contactos().anyOne()
	
	method usuariosDePrueba() 
		= #{creador, self.desconocido()} + creador.contactos()
	
	/*
	 * TODO crear y retornar el contenido correspondiente
	 * usando self.creador() como usuario creador del contenido y 
	 * self.fechaPublicacion() como fecha de publicación del mismo
	 */ 
	method crearPublicacionPublica() {
		return new Publicacion(usuario = self.creador(), fechaDePublicacion = self.fechaPublicacion(), tipoDePrivacidad = publica) 
	}
	method crearPublicacionPrivada() {
		return new Publicacion(usuario = self.creador(), fechaDePublicacion = self.fechaPublicacion(), tipoDePrivacidad = new Privada()) 
	}
	method crearHistoriaPublica() {
		return new Historia(usuario = self.creador(), fechaDePublicacion = self.fechaPublicacion(), tipoDePrivacidad = publica)
	}
	method crearHistoriaPrivada() {
		return new Historia(usuario = self.creador(), fechaDePublicacion = self.fechaPublicacion(), tipoDePrivacidad = new Privada())
	}
	method crearPublicacionConListaNegra(usuariosParaListaNegra) {
		return new Publicacion(usuario = self.creador(), fechaDePublicacion = self.fechaPublicacion(), 
								tipoDePrivacidad = new NoVisible(listaNegra = usuariosParaListaNegra))
	}
	method crearHistoriaConListaNegra(usuariosParaListaNegra) {
		return new Historia(usuario = self.creador(), fechaDePublicacion = self.fechaPublicacion(),
					tipoDePrivacidad = new NoVisible(listaNegra = usuariosParaListaNegra))
	}
}