class DespegueException inherits Exception(message = "no hay aviones"){
	
}
class ElementoDeCombate {
	var municiones
	method recargar() {}
	
	method accidente() {
		//sldfasidjf
	}
}



class Aeronave {
	const consumo 
	var property combustible 	

	method aterrizar() {
		combustible = combustible - 10
	}

	method despegar() {
		combustible = combustible - consumo 
	}
	
	method viajeTragico(){
		self.despegar()
		self.accidente()
		self.aterrizar()
	}
	
	method accidente()
	
}


class Avion inherits Aeronave(combustible = 100,consumo = 5) {
	var property cantidadAlas = 2
			
	override method accidente() {
		cantidadAlas = cantidadAlas -1
	}
		
	method cantidadAlas() = cantidadAlas 
	
}


class AvionDeCombate inherits Avion {
	
	var property municiones = 20
	
	method disparar(){
		municiones = municiones -1
		combustible = combustible - 2 
	}
	
	override method despegar(){
		super()
		combustible = combustible.max(10)
	}
	
	override method cantidadAlas() = super()*2
	
}

object avionEspecialPrototipo inherits AvionDeCombate(cantidadAlas = 3) {
	
	override method disparar() {
		///
	}
	method otro() = 7
}


class Helicoptero inherits Aeronave(combustible = 50,consumo = 1){
		
	var tripulantes = 1
	
	override method accidente() {
		tripulantes = 0
	}
	
	method puedeVolar() {
		return tripulantes > 0
	}
	

}

class Aeropuerto{
	
	const  aeronavesListasParaDespegar = []
	
	method agregarAvion(a){
		aeronavesListasParaDespegar.add(a)
	}
	
	method tieneAeronave(a) = aeronavesListasParaDespegar.contains(a)
	
	method hacerDespegar(){
		if (aeronavesListasParaDespegar.isEmpty()){
			throw new DespegueException()
		}
		aeronavesListasParaDespegar.first().despegar()
	}
	
	method hacerAterrizar(aeronave){
		aeronave.aterrizar()
		self.agregarAvion(aeronave)
		
	}
}