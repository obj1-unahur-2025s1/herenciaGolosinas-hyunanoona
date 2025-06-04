/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }

class Golosinas {
	var peso = 15
	var property libreGluten = true
	method peso() = peso

	method estaEnOferta() = self.precio() < 10
	method precio() //metodo abstracto, sirve para validar que el mensaje no esta siendo mandado incorrectamente.
}


// Golosinas

class Bombon inherits Golosinas(){
	override method precio() = 5
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() = frutilla 
	// no es lo que pide la consigna igual
	//method gradoDureza() = if (peso > 12) 3 else if (peso.between(8, 12)) 2 else 1
}


class Alfajor inherits Golosinas(libreGluten = false){	
	override method precio() = 12 
	method mordisco() { peso = peso * 0.8 }
	method sabor() = chocolate 
}

class Caramelo {
	var peso = 5
	var property sabor = frutilla

	method precio() = 12 
	method peso() = peso 
	method mordisco() { peso = peso - 1 }
}


class CarameloCorazon inherits Caramelo{
	override method mordisco() {
		super() //llama a clase mother y agrega todo lo demas. si el metodo tiene parametros, hay que pasarselos por el super tambien.
		sabor = chocolate
	}
	override method precio() = super() + 1  
}


class Chupetin{
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

/*
class ObleaCrujiente inherits Oblea{
	var cantidadDeMordiscos = 0
	override method mordisco() {
		if (cantidadDeMordiscos < 3) 
			super()
			peso = peso -3
			cantidadDeMordiscos = cantidadDeMordiscos + 1
		else 
		super() 
	}
}
*/

class Chocolatin inherits Golosinas{
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
	var property libreDeGluten
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