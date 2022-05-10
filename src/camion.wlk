import cosas.*

object camion{

	var cosas = []

	method cargar(cosa){cosas.add(cosa)	}
	method descargar(cosa){	cosas.remove(cosa)}	
	method todoPesoPar(){ return (cosas.all({c => c.peso()%2==0}))}
	method hayAlgunoQuePesa(peso){ return cosas.any( {c => c.peso()==peso } )}
	method elDeNivel(nivel){ return cosas.find( {c => c.peligrosidad()==nivel})}
	method pesoTotal(){ return 1000 + cosas.sum({ c => c.peso()})}
	method excedidoDePeso(){return self.pesoTotal()>2500}
	method objetosQueSuperanPeligrosidad(nivel){return cosas.filter( {c => c.peligrosidad()>nivel})}
	method objetosMasPeligrososQue(cosa){return cosas.filter( {c => c.peligrosidad()>cosa.peligrosidad()})}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){return self.excedidoDePeso() and cosas.all({c => c.peligrosidad()<nivelMaximoPeligrosidad})}
	method tieneAlgoQuePesaEntre(min,max){return cosas.any({ c => c.peso()>min and c.peso()<max})}
	method cosasMasPesadas(){return cosas.max({c => c.peso()}) }
	method pesos(){ return cosas.map({c => c.peso()})}
	

}

