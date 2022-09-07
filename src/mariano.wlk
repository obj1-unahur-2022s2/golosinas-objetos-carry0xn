import golosinas.*
object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinas = []
	var sabores = []
	var golosinasDesechadas = []
	method comprar(golosina) {
		golosinas.add(golosina)
		sabores.add(golosina.gusto())
	}
	method sabores() = sabores.asSet()
	method comprarVarias(lista) = 
		golosinas.addAll(lista)
	
	method vaciarBolsa() {
		golosinasDesechadas.addAll(golosinas)
		golosinas.clear()
	}
	
	method quitarUnaGolosina(unaGolsina) {
		golosinas.remove(unaGolsina)
		golosinasDesechadas.add(unaGolsina)
	}
	method cantGolosinas() =
		golosinas.size()
	
	method preguntarPorGolosina(unaGolsina) =
		golosinas.contains(unaGolsina)
	
	
	method probarGolosinas() =
		golosinas.forEach({g => g.mordisco()})
	
	method hayGolsinasSinac() = golosinas.any({g => g.libreDeGluten()})
	method hayGolsinasSinacConAll() = !golosinas.all({g => g.libreDeGluten()})
	
	method preciosCuidado() =
		golosinas.all({g => g.precio() <= 10 })	
	
	
	method preciosCuidadoAny() =
		!golosinas.any({g => g.precio() > 10 })	
	
	
	method golosinaDeUnSabor(unSabor) =
		golosinas.find({g => g.gusto() == unSabor})
	
	
	method golosinasDeSabor(unSabor) =
		golosinas.filter({g => g.gusto() == unSabor})
	
	
	method saboresDeBolsa() =
		golosinas.map({g => g.gusto()}).asSet()
	
	method golosinaMasCara() = golosinas.max({g => g.precio()})
	method golosinaMasCaraMap() = golosinas.map({g => g.precio()}).max()
	method precioMasCara() = self.golosinaMasCara().precio()
	
	method pesoGolosinas() = golosinas.sum({g => g.peso()})
	
	method golosinasFaltantes(golosinasDeseadas) = 
			golosinasDeseadas.asSet().difference(golosinas.asSet())
	method golosinasObtenidas(golosinasDeseadas) = 
			golosinas.asSet().difference(golosinasDeseadas.asSet())
	method gustosFaltantes(golosinasDeseadas) = 
			golosinasDeseadas.asSet().difference(self.saboresDeBolsa())
	
	method gastoEn(sabor) = 
		self.golosinasDeSabor(sabor).sum({g => g.precio()})
	
	method precioMasCaroDeSabor(sabor) =
		self.golosinasDeSabor(sabor).max({g => g.precio()}).precio()
	
	method cantidadDeGolosinasDe(unSabor) = 
		self.golosinasDeSabor(unSabor).size()
	
	method saborMasPopualar() = 
		self.sabores().max({sabor => self.cantidadDeGolosinasDe(sabor)})
	
	method comproYDesecho(golosina) = golosinasDesechadas.contains(golosina)
}

