// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(sueldo) { asociacionLitoral.recaudacion(sueldo)}
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar(){ return [universidad.provincia()] }
	method honorariosPorHora(){ return universidad.honorariosRecomendados()}
	method cobrar(sueldo){
		universidad.donaciones(sueldo / 2)
		
	}
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	
	var property lugaresTrabajables = []
	var property remuneracion  = null
	var property billetera = 0  
 	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciaDondePuedeTrabajar(){ return lugaresTrabajables.add(universidad.provincia()) }
	
	method honorariosPorHora() { return remuneracion }
	
	method cobrar(sueldo){
		billetera += sueldo
	}
	method pasarDinero(companero,dinero){
		companero.cobrar(dinero)
		billetera -= dinero
	}
}


class Universidad{
	var property provincia = null
	var property honorariosRecomendados = null	
	var property donaciones = null
}

object asociacionLitoral{
	var recaudacion = 0
	
	method recaudacion(num) { recaudacion += num}
}
class Empresa{
	var property setEmpleados = []
	var property honorariosReferidos = null
	
	method contratar(empleado){ setEmpleados.add(empleado)}
	
	method profesionalesCaros() = setEmpleados.filter{elemento => elemento.honorariosPorHora() > honorariosReferidos }
	
	method universidadesFormadores() = setEmpleados.map{elemento => elemento.universidad()}.withoutDuplicates()
	
	method profecionalMasBarato() = setEmpleados.min{e => e.honorariosPorHora()}
	
	method estaCubierta(provincia) = setEmpleados.map{elemento => elemento.provinciasDondePuedeTrabajar()}.contains(provincia)
	
	method cuantosEstudioEn(universidad) = setEmpleados.filter{elemento=> elemento.universidad() == universidad}.size()	
	
	method satisfacer(unSolicitante){
		
	}
		
}

class Persona{
	var property provincia = null
	
	method puedeSerAtendidaPor(unProfesional){
		return unProfesional.provinciasDondePuedeTrabajar().contains(self.provincia())
	}	
}

class Institucion{
	var property universidadesReconocidas = []
	
	method puedeSerAtendidaPor(unProfesional){
		return universidadesReconocidas.contains(unProfesional.universidad())
		
	}
}