// Playground - noun: a place where people can play

import UIKit

// Herança

class Veículo {

    var númeroRodas: Int
    var maxPassageiros: Int

    init() {
    
        númeroRodas = 0
        maxPassageiros = 1
    
    }
    
    func descrição() -> String {
    
    return "\(númeroRodas) rodas; até \(maxPassageiros) passageiros"
    
    }
}


let umVeículo = Veículo()


class Bicicleta: Veículo {

    override init()  {
    
        super.init()   //A superClasse deve ser inicializada primeiro
        númeroRodas = 2
        
    }
}



let bicicleta = Bicicleta()

bicicleta.númeroRodas

bicicleta.descrição()


class Tandem: Bicicleta {

    override init() {
    
        super.init()
        maxPassageiros = 2
        
    }
}

let tandem = Tandem()

tandem.descrição()



// Exemplo 5:

class Carro: Veículo {

    var velocidade: Double = 0.0
    
    override init()  {
    
        super.init()
        maxPassageiros = 5
        númeroRodas = 4
    }

    override func descrição() -> String {
    
        return super.descrição() + ";" + "dirigindo a \(velocidade) km/h"
    
    }

}

let carro = Carro()

carro.descrição()

carro.velocidade = 80

carro.descrição()



class CarroVelocidadeLimitada: Carro {

    override var velocidade: Double {
    
       get {
    
           return super.velocidade
       }
    
       set {
    
           super.velocidade = min(newValue, 80.0)
        
       }

    }
    
}

let carroLimitado = CarroVelocidadeLimitada()

carroLimitado.velocidade = 120

carroLimitado.descrição()



class CarroAutomático: Carro {
    
    var marcha = 1
    
    override var velocidade: Double {
    
       didSet{
    
           marcha = Int(velocidade / 16.0) + 1
    
       }

    }
    
    override func descrição() -> String {
        
        return super.descrição() + " na marcha \(marcha)"
        
    }
}


let autoCar = CarroAutomático()

autoCar.velocidade = 70


//Mude algum método de alguma superClasse acima para final, e veja como as subClasses dela não vão conseguir sobreescrever seus final method.



