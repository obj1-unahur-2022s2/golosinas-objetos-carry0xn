object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
}

object alfajor {
	var peso = 300
	
	method precio() = 12
	method peso() = peso
	method mordisco() { peso = 0.max(peso * 0.20 -1)}
	method gusto() = 'chocolate'
	method libreDeGluten() { return false }
}

object caramelo {
	var peso = 5
	
	method precio() = 1
	method peso() = peso
	method mordisco() { peso = 0.max(peso -1) }
	method gusto() = 'frutilla'
	method libreDeGluten() { return true }
}

object chupetin {
	var peso = 7
	
	method precio() = 2
	method peso() = peso
	method mordisco() { 
		if (peso <= 2)
			peso = 0.max(peso * 0.90)
	}
	method gusto() = 'naranja'
	method libreDeGluten() { return true }
}


object oblea {
	var peso = 250
	
	method precio() = 5
	method peso() = peso
	method mordisco() { 
		if (peso < 2)
			peso = 0.max(peso * 0.50)
		else
			peso = 0.max(peso * 0.75)
	}
	method gusto() = 'vainilla'
	method libreDeGluten() { return false }
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	
	/* al principio, el peso actual coincide con el inicial */
	method peso(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}

	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	var mordiscos 
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { golosinaInterior.precio() +2 }
	method peso() = golosinaInterior.peso() +4 
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() = golosinaInterior.libreDeGluten()
}

object tuttifrutti {
	const gustos = ['frutilla', 'chocolate', 'naranja']
	const property peso = 5
	var libreDeGluten = true
	var cantMordisco = 0 
	
	method precio() {
		if (self.libreDeGluten())
			return 7
		else
			return 10
	}
	method peso() = peso
	method mordisco() { cantMordisco += 1 }

	method gusto() {gustos.get(cantMordisco.gustos.size()}
	method libreDeGluten() = libreDeGluten
}

