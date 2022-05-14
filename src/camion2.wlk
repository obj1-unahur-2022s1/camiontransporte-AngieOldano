/*
 * camion2: Bien(-). Al cargar un objeto en la lista de cosas, se debía llamar 
 * al método consecuencia() de cada cosa. Te dejé algunos comentarios en los métodos.
 */

import cosas2.*

object camion{

	var cosas = []

	method cargar(cosa){
		/* Regular. Al cargar cada objeto en la lista de cosas, se debía indicar
		 * a cada cosa que realice la acción consecuencia(). 
		 */
		cosas.add(cosa)
		cosa.consecuencia()
	}
	method descargar(cosa){	cosas.remove(cosa)}	
	method todoPesoPar() = cosas.all({c => c.peso().even()}) // otra forma sin usar return
	method hayAlgunoQuePesa(peso){ return cosas.any( {c => c.peso()==peso } )}
	method elDeNivel(nivel){ 
		/* Se puede hacer más simple utilizando el método find, que devuelve el primer objeto
		 * * que coincide con la condición. Te dejo esta forma.
		*/
		 return cosas.find( {c => c.peligrosidad()==nivel})
	}
	method pesoTotal(){ return 1000 + cosas.sum({ c => c.peso()})}
	method excedidoDePeso(){return self.pesoTotal()>2500}
	method objetosQueSuperanPeligrosidad(nivel){return cosas.filter( {c => c.peligrosidad()>nivel})}
	method objetosMasPeligrososQue(cosa){return cosas.filter( {c => c.peligrosidad()>cosa.peligrosidad()})}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		/* el método excedidoDePeso() hay que negarlo */
		return not self.excedidoDePeso() and cosas.all({c => c.peligrosidad()<nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min,max){
		/* se podía resolver la condición con el método between, te dejo la forma */
		return cosas.any({ c => c.peso().between(min,max) })
	}
	method cosaMasPesada(){return cosas.max({c => c.peso()}) }
	method pesos(){ return cosas.map({c => c.peso()})}
	method totalBultos()= cosas.sum({c=>c.bultos()})
}
