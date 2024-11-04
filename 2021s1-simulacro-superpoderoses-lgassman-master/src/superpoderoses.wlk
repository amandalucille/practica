class Personaje{
    const poderes = #{} 
    var property estrategia  
    var property espiritualidad

    method suCapacidadDeBatalla() =
    poderes.sum({p => p.capacidadDeBatalla(self)})

    method suMejorPoder(personaje) = poderes.max({p => p.capacidadDeBatalla(self)})

    method puedeAfrontarPeligro(peligro){
        self.suCapacidadDeBatalla() > peligro.capacidadDeBatalla() and self.esInmuneALaRadiactividad()
    }
     method esInmuneALaRadiactividad() = 
}

class Poder{

    method capacidadDeBatalla(personaje) = 
        (self.agilidad(personaje) + self.fuerza(personaje)) * self.habilidadEspecial(personaje)  
    
    method agilidad(personaje)          
    method fuerza(personaje)            
    method habilidadEspecial(personaje) = personaje.espiritualidad() + personaje.estrategia()
           
}

class Velocidad inherits Poder{
    const property rapidez   
    
    override method agilidad(personaje)          = personaje.estrategia()     * rapidez
    override method fuerza(personaje)            = personaje.espiritualidad() * rapidez
    

}

class Vuelo inherits Poder{
    var property alturaMaxima
    var property energiaParaDespegue

    override method agilidad(personaje) = (personaje.estrategia() * alturaMaxima) / energiaParaDespegue
    override method fuerza(personaje)   = personaje.espiritualidad() + alturaMaxima - energiaParaDespegue  
       
}

class PoderAmplificador inherits Poder{
    var property poderBase 
    var property amplificador 

    override method agilidad(personaje) = poderBase.agilidad(personaje)
    override method fuerza(personaje) = poderBase.fuerza(personaje)
    override method habilidadEspecial(personaje) = poderBase.habilidadEspecial(personaje) * amplificador
}

class Equipo{
    const miembros = #{}

    method miembroMasVulnerable() = miembros.min({m => m.suCapacidadDeBatalla()})
    method calidad()              = (miembros.sum({m => m.suCapacidadDeBatalla()}) ) / miembros.size() 
    method mejoresPoderes()        = miembros.map({m => m.suMejorPoder(m)}).asSet() 
    
} 

class Peligro{
    var property capacidadDeBatalla
    
    method tieneDesechosRadiactivos() 
        
    






}