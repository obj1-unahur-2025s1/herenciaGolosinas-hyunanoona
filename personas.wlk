import golosinas.*

class Persona {
	const golosinas = []
	 
	method comprar(golosina) { golosinas.add(golosina) }
	
	method desechar (golosina) { golosinas.remove(golosina) }
	
	method golosinas() = golosinas 
	method primerGolosina() = golosinas.first() 
	method ultimaGolosina() = golosinas.last() 
	
	method pesoGolosinas() = golosinas.sum({ golo => golo.peso() })
	
	method probarGolosinas() {golosinas.forEach( {golosina => golosina.mordisco() } )}
	
	method golosinaMasPesada() = golosinas.max({ golo => golo.peso() })
	
	method hayGolosinaSinTACC() = golosinas.any({golosina => golosina.libreGluten()})
	
	method preciosCuidados() = golosinas.all({golosina => golosina.precio() < 10})
	
	method golosinaDeSabor(sabor) = golosinas.find({ golosina => golosina.sabor() == sabor })
	
	method golosinasDeSabor(sabor) = golosinas.filter({ golosina => golosina.sabor() == sabor })
	
	method sabores() = golosinas.map({ golosina => golosina.sabor() }).asSet()

	method golosinaMasCara() = golosinas.max( {golosina => golosina.precio() } )

	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.difference(golosinas)	

	method saboresFaltantes(saboresDeseados) = saboresDeseados.filter({saborDeseado => ! self.tieneGolosinaDeSabor(saborDeseado)})	
	
	method tieneGolosinaDeSabor(sabor) = golosinas.any({golosina => golosina.sabor() == sabor})
}