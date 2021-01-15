// No modificar
class Usuario {
	const property nombre
	const property contactos = #{}
	
	method tieneContacto(unUsuario) = contactos.contains(unUsuario)
	
	method agregarContacto(unUsuario){
		self.contactos().add(unUsuario)
	}
	method eliminarContacto(unUsuario){
		self.contactos().remove(unUsuario)
	}
}
