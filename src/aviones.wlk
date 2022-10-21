class Aeronave {
	var combustible 
	const consumo  

	method despegar() {
		combustible = (combustible - consumo )
	}

	method combustible() = combustible
}

class Dirigible inherits Aeronave {
	
	var property pasajeros
	var mecanismoSeguridad = true
	
	method recortePresupuesto() {
		mecanismoSeguridad = false
	}
	
	method accidente(){
		if( !mecanismoSeguridad)
			pasajeros = 0.1 * pasajeros 
	}
	
}

class Aeroplano {
	
}



class Avion inherits Aeronave{
	
	var cantidadAlas = 2
			
	method accidente() {
		cantidadAlas = cantidadAlas -1
	}
		
	method aterrizar() {
		combustible = combustible -5
	}
	
	method cantidadAlas() = cantidadAlas
	
}

class AvionDeCombate inherits Avion{
	
	var property municiones = 20
	
	method disparar(){
		municiones = municiones -1
		combustible = combustible - 2 
	}
	override method despegar() {
		combustible = (combustible - consumo ) * 0.8
	}
	
}

class Helicoptero inherits Aeronave{
	var tripulantes 
	
	method accidente() {
		tripulantes = 0
	}
	
	method puedeVolar() {
		return tripulantes > 0
	}
}


object aeropuerto{
	
	var aeronavesListasParaDespegan = []
	
	
	method agregarAvion(a){
		aeronavesListasParaDespegan.add(a)
	}
	
	method hacerDespegar(){
		if (aeronavesListasParaDespegan.isEmpty()){
			throw new Exception(message="no hay aviones")
		}
		aeronavesListasParaDespegan.first().despegar()
	}

	
} 

