/*
 * cosas2: Bien(-). Se definen variables y constantes que no son necesarias y hay algunos 
 * errores en algunos métodos. Revisá por favor los comentarios sobre cada objeto. 
 */

object knightRider {
	/* Bien(-). Es innecesario definir las referencias peso y peligrosidad, para casos 
	 * en que se pida que un objeto sepa responder a un mensaje con un valor fijo. 
	 * Te dejo la manera correcta de implementar esto. 
	 */
	method peso() = 500
	method peligrosidad() = 10
	method bultos()=1
	method consecuencia(){}
}

object bumblebee {
	/* Bien(-) Si bien esta solución funciona, en la definición del objeto indica que
	 * puede tener solo 2 formas: robot y auto, por lo tanto es mejor manejar una variable
	 * booleana y no listas. Con la peligrosidad pasa igual, al haber 2 estados, su resultado
	 * dependerá de la variable booleana. Respecto a la forma, no se pide que se exprese con
	 * un string, y cuando trabajamos con objetos, difícilmente utilicemos strings para hacer
	 * referencia a valores que pueda asumir una variable, siempre usaremos objetos.
	 * Te dejo una solución más simple para resolver este objeto y sus métodos. La variable
	 * que maneja si está o no como auto usa el property que permite ahorrarse escribir los 
	 * métodos getter y setter (serían estaComoAuto() y estaComoAuto(valorBooleano)
	 */
	var property estaComoAuto = true
	
	method peso() = 800
	method peligrosidad() = if(estaComoAuto) {15} else {30}
	method bultos() = 2
	method consecuencia() { estaComoAuto = false }
	
}

object paqueteLadrillos{
	/* Bien(-) Es innecesario utilizar variable peso, ya que el mismo se calcula directamente
	 * con el doble de la cantidad de ladrillos que tenga el paquete. Respecto a la peligrosidad, 
	 * tampoco es necesario usar una constante, ya que eso se resuelve directamente con un
	 * método de consulta. Te dejo una solución más simple y adecuada.
	 */
	var property cantidad = 0
	
	method peso() = cantidad * 2
	method peligrosidad() = 2
	method bultos() = if(cantidad <= 100) {1}
					  else if(cantidad <= 300) {2}
					  else {3}
	method consecuencia() { cantidad += 12 }
}


object arena {
	/* Bien(-) Cuando un objeto deba responder un valor fijo que no cambia, la forma correcta
	 * es mediante un método, es innecesario definir variables o constantes para eso. Y para el peso
	 * que será un valor que va a ir cambiando, se puede usar var property. Te dejo una forma
	 * más simple de resolver los métodos de este objeto.
	 */
	var property peso = 0
	
	method peligrosidad() = 1
	method bultos() = 1
	method consecuencia() { peso += 20 }
}

object bateriaAntiarea {
	/* Bien(-). Lo único que necesariamente debe "recordar" o memorizar el objeto
	 * es si tiene cargados los misiles o no. Para el resto de las consultas debían
	 * implementarse como métodos. Te dejo como sería la solución más adecuada para 
	 * resolver lo que se pide para este objeto*/
	var property tieneMisiles = false

	method peso() = if(tieneMisiles) {300} else {200}
	method peligrosidad() = if(tieneMisiles) {100} else {0}
	method bultos() = if(tieneMisiles) {2} else {1}
	method consecuencia() { self.tieneMisiles(true) }
}


object contenedor {
	/* Bien(-). peso y peligrosidad no necesitan variables, se resuelven con métodos.
	 * La lista de cosasAdentro podría ser una constante si siempre va a apuntar a
	 la misma lista en la que agregaremos cosas. Te dejo como sería la solución. */

	const cosasAdentro = []

	method peso() = self.pesoCosasAdentro() + 100
	method pesoCosasAdentro() = cosasAdentro.sum({ c => c.peso() })
	method peligrosidad() = if(cosasAdentro.isEmpty()) {0}
							else {self.objetoMasPeligrosoContenido().peligrosidad()}
							
	method objetoMasPeligrosoContenido() = cosasAdentro.max({ c => c.peligrosidad() })
	method bultos() = cosasAdentro.sum({ c => c.bultos() }) +1
	method consecuencia() { cosasAdentro.forEach({ c => c.consecuencia() }) }
	method agregarCosa(cosa){ cosasAdentro.add(cosa) }
	method sacarCosa(cosa){ cosasAdentro.remove(cosa) }
}


object residuosRadioactivos {
	/* Regular. El método consecuencia no suma 15 al valor del peso, sino que le setea
	 * el valor 15, perdiendo el peso que se indicó en el método peso(grs). Además es
	 * innecesaria la referencia a peligrosidad. La forma correcta sería la siguiente */
	var property peso = 0
	
	method peligrosidad() = 200
	method bultos() = 1
	method consecuencia() { peso += 15 }
}

object embalajeSeguridad {
	/* Regular. No se necesitan las variables peso y peligrosidad, se resuelve con métodos.
	 * El objeto embalajeSeguridad debe "recordar" a que objeto envuelve, y no modificar
	 * su peso con el de la cosa que envuelve. Además, el nivel de peligrosidad del 
	 * embalaje debe ser la mitad del objeto que envuelve. Te dejo cual sería la solución. 
	 */
	var cosaEnvuelta
	
	method cosaEnvuelta(cosa) { cosaEnvuelta = cosa}
	method peso() = cosaEnvuelta.peso()
	method peligrosidad() = cosaEnvuelta.peligrosidad() *0.5
	method bultos() = 2
	method consecuencia() {}

}
