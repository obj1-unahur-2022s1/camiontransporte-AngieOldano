object knightRider {
	const property peso = 500
	const property peligrosidad = 10
	method bultos()=1
	method consecuencia(){}
}

object bumblebee {
	var peligrosidad = [15,30]
	var cantTransf = 0
	var forma = ["auto","robot"]
	const property peso = 800
	method peligrosidad()=peligrosidad.get(cantTransf)
	method forma() = forma.get(cantTransf)
	method transformar(){
		cantTransf++
		if (cantTransf==2){
			cantTransf=0}
	}
	method bultos()=2
	method consecuencia(){self.transformar()}
	
}

object paqueteLadrillos{

	var peso 
	const property peligrosidad = 2
	method peso()=peso
	method cantLadrillos(cantidad) { peso=2*cantidad }
	method bultos()=
		if(cantLadrillos<=100){1}
		else if(cantLadrillos>=101 and cantLadrillos<=300){2}
		else{3}
	method consecuencia(){self.cantLadrillos(12)}

}


object arena {
	const property peligrosidad = 1
	var peso
	method peso(gs) { peso=gs }
	method peso() = peso
	method bultos()=1
	method consecuencia(){self.peso(20)}

}

object bateriaAntiarea {
	var peso = 200
	var peligrosidad = 0
	var misiles = false
	var bultos 
	method ponerMisiles() { misiles=true; peso=300; peligrosidad=100; bultos=2}
	method sacarMisiles() { misiles = false; peso=200; peligrosidad=0; bultos=1}
	method peso()= peso
	method peligrosidad()=peligrosidad
	method bultos()=bultos
	method consecuencia(){self.ponerMisiles()}
	method misiles()=misiles

}


object contenedor {
	var peso 
	var peligrosidad = 0
	var cosasAdentro = []
	method agregarCosa(cosa){ 
		cosasAdentro.add(cosa)
		peso= 100+cosa.peso()
		if(cosa.peligrosidad()>peligrosidad){
			peligrosidad=cosa.peligrosidad()
		}		
	}
	method sacarCosa(cosa){ 
		cosasAdentro.remove(cosa)
		peso-=cosa.peso()
		if(cosa == cosasAdentro.min( {c => c.peligrosidad()})){
		peligrosidad=0}		
	}
	method peso() = peso
	method peligrosidad() = peligrosidad
	method bultos()=1+cosasAdentro.sum({c=>c.bultos()})
	method consecuencia(){cosasAdentro.forEach({c=>c.consecuencia()})}
}


object residuosRadioactivos {
	var peso = 0
	const property peligrosidad = 200
	method peso(grs) {peso=grs} 
	method peso() = peso
	method bultos()=1
	method consecuencia(){self.peso(15)}
}

object embalajeSeguridad {
	var peso = 0
	var peligrosidad = 0
	method agregarCosa(cosa){ 
		peso=cosa.peso()
		peligrosidad=cosa.peligrosidad()
	}		
	method sacarCosa(cosa){ 
		peso=0
		peligrosidad=0		
	}
	method peligrosidad() = peligrosidad
	method peso() = peso
	method bultos()=2
	method consecuencia(){}
}
