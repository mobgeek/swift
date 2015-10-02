//: [Anterior: Inicializadores que Falham](@previous)

// Definição

protocol umProtocolo {
    
    //definição do protocolo
    
}

class umaClasse: umProtocolo {
    
    //definição da classe.
    //cumprimento do que foi definido no protocolo que foi adotado por essa classe
    
}



// Propriedades e Métodos

//Propriedades dentro de protocolos podem ser definidas de 2 formas:

//gettable - { get } -> A classe, estrutura ou enum que adotar um protocolo com alguma propriedade desse tipo, poderá declará-la da forma como quiser.

//gettable e settable - { get set } -> A classe, estrutura ou enum que adotar um protocolo com alguma propriedade desse tipo, não poderá declará-la como uma propriedade de armazenamento constante (let) ou como uma propriedade computada ready-only (apenas de leitura - que fornece apenas o get)



protocol temSeuLugar {
    
    var lugarDefinido: String? { get }   //LugarDefinido poderá ser declarada de qualquer forma
    
    var noLugar: String { get set }   //noLugar não poderá ser declarada como uma propriedade de armazenamento constante ou como uma propriedade comptuada ready-only
    
    
    //Métodos recebem a palavra mutating pois podem vir a ser adotados por estruturas, e vimos que em estruturas (Tipo Valor) para que um método possa modificar as propriedas de uma isntancia dessa estrutura, é preciso definir o método como mutating.
    
    mutating func colocaNoLugar() -> String
}


class Coisa: temSeuLugar {
    
    //Se você esquecer Swift irá te ajudar a lembrar que as exigências deverão ser cumpridas.
    
    var lugarDefinido: String?
    
    var noLugar: String
    
    //var noLugar: String { return self.noLugar }   //erro, faltou especificar um set, pois noLugar é {get set}
    
    //let noLugar: String   //erro, não pode ser declarada como constante, pois noLugar é {get set}
    
    init() {
        
        noLugar = "por aí"
        
    }
    
    func colocaNoLugar() -> String {
        
        if let local = lugarDefinido {
            
            noLugar = local
            
        }
        
        return "De volta ao seu lugar!"
        
    }
    
}

let chave = Coisa()

chave.lugarDefinido = "pendurada"

chave.noLugar = "ao lado do computador"

chave.colocaNoLugar()

chave



//Mais exemplos de protocolos:

protocol GeradorNumeroAleatorio {
    
    func aleatorio() -> Double
    
}



class GeradorLinearCongruente: GeradorNumeroAleatorio {
    
    var ultimoAleatorio = 35.0
    
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func aleatorio() -> Double {
        
        ultimoAleatorio = ((ultimoAleatorio * a + c) % m)
        
        return ultimoAleatorio / m
        
    }
    
}

let gerador = GeradorLinearCongruente()

print("Número aleatório é: \(gerador.aleatorio())")

print("e mais um: \(gerador.aleatorio())")



// Protocolo Usado Como Tipo

class Dado {
    
    let lados: Int
    
    let gerador: GeradorNumeroAleatorio   //Qualquer instância que adote esse protocolo pode ser atribuída a gerador
    
    init(lados: Int, gerador: GeradorNumeroAleatorio) {
        
        self.lados = lados
        self.gerador = gerador
        
    }
    
    func rolar() -> Int {
        
        return Int(gerador.aleatorio() * Double(lados)) + 1
        
    }
}

var dadoSeis = Dado(lados: 6, gerador: GeradorLinearCongruente())

for _ in 1...5 {
    
    print("Rolando o dado..... \(dadoSeis.rolar()) !")
    
}

//: [Próximo: Type Casting](@next)
