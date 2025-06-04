/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
class Bombon {
	var peso = 15
	
	method precio() = 5
	method peso() = peso
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() = frutilla 
	method libreGluten() = true 

	// no es lo que pide la consigna igual
	//method gradoDureza() = if (peso > 12) 3 else if (peso.between(8, 12)) 2 else 1
}


class Alfajor {
	var peso = 15
	
	method precio() = 12 
	method peso() = peso 
	method mordisco() { peso = peso * 0.8 }
	method sabor() = chocolate 
	method libreGluten() = false 
}

class Caramelo {
	var peso = 5

	method precio() = 12 
	method peso() = peso 
	method mordisco() { peso = peso - 1 }
	method sabor() = frutilla 
	method libreGluten() = true 
}


class Chupetin {
	var peso = 7
	
	method precio() = 2 
	method peso() = peso 
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	method sabor() = naranja 
	method libreGluten() = true 
}

class Oblea {
	var peso = 250
	
	method precio() = 5 
	method peso() = peso 
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	method sabor() = vainilla 
	method libreGluten() = false 
}

class Chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) { pesoInicial = unPeso }
	method precio() = pesoInicial * 0.50 
	method peso() = (pesoInicial - comido).max(0) 
	method mordisco() { comido = comido + 2 }
	method sabor() = chocolate 
	method libreGluten() = false 

}

class GolosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() = golosinaInterior.precio() + 2 
	method peso() = golosinaInterior.peso() + pesoBanio 
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() = golosinaInterior.sabor() 
	method libreGluten() = golosinaInterior.libreGluten() 	
}


class Tuttifrutti {
	var libreDeGluten
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() = sabores.get(saborActual % 3) 	

	method precio() = if(self.libreGluten()) 7 else 10 
	method peso() = 5 
	method libreGluten() = libreDeGluten 	
	method libreGluten(valor) { libreDeGluten = valor }
}


class BombonesDuros inherits Bombon{
	override method mordisco() {peso = peso - 1}
	method gradoDureza() = if (peso > 12) 3 else if (peso.between(8, 12)) 2 else 1
}



//git config -- user.email "amelie.paz@estudiantes.unahur.edu.ar" git config -- user.name "hyunanoona"