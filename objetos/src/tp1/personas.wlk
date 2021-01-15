object olivia {
 var property gradoDeConcentracion = 4;
 var cantidadDeMasajes = 0;
 
 method esFeliz() {
 	return gradoDeConcentracion >= 7; 
 }
 
 method discutir() {
 	if(gradoDeConcentracion >= 5) {
 	gradoDeConcentracion = 5;	
 	}
 }
 
 method recibirMasajes() {
 	cantidadDeMasajes += 1;
 	if(cantidadDeMasajes < 3) {
 		gradoDeConcentracion += 2;
 	} else {
 		gradoDeConcentracion += 5;
 	}	
 }
 
 method darseUnBanioDeVapor(minutos) {
 	gradoDeConcentracion += 1 * (minutos / 5);
 }
}

object adriano {
	var property nivelDeContractura = 5;
	var property frescoParaProgramar = true;
	
	method recibirMasajes() {
		nivelDeContractura -= 2;
		nivelDeContractura = 0.max(nivelDeContractura);
	}
	
	method darseUnBanioDeVapor(minutos) {
		frescoParaProgramar = true;
	}
	
	method comerseUnBigMac() {
		frescoParaProgramar = true;
	}
	
	method codear() {
		if(self.frescoParaProgramar()) {
			nivelDeContractura += 1;
		} else {
			nivelDeContractura += 3;
		}
		frescoParaProgramar = false;
	}
	
	method trabajarUnDia() {
		self.codear();
		self.comerseUnBigMac();
		self.codear();
	}
}

