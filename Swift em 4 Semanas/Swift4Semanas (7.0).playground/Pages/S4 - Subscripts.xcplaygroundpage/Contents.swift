//: [Anteiror: Deinicialização](@previous)

// Playground - noun: a place where people can play

import UIKit


// Subscripts


let novaArray = [10,20,30]

novaArray[0]   //subscript(index: Int) -> T


let novoDic = [1:"1", 2:"2"]

novoDic[2]!   //subscript(key: Key) -> Value?


struct Tabuada {
    
    let multiplicador: Int
    
    subscript(indice: Int) -> Int {
        
        return multiplicador * indice
        
    }
}

let tabuadaDeTres = Tabuada(multiplicador: 3)

tabuadaDeTres[7]


class Cômodo {
    
    var nome: String
    
    init(nome: String)
    {
        self.nome = nome
    }
    
}

class Casa {
    
    var cômodos = [Cômodo]()
    
    var númeroDeCômodo:Int {
        
        return cômodos.count
    }
    
    subscript(índice: Int) -> Cômodo {
        
        return cômodos[índice]
        
    }
}

var novaCasa = Casa()

novaCasa.cômodos = [Cômodo(nome:"Cozinha"), Cômodo(nome:"Sala de Estar")]

novaCasa[0].nome   //Acessando um cômodo atrvés de uma instância da classe Casa

//novaArray[2].nome   //ERRO, indice excedeu o limite

//: [Próximo: Nested Types](@next)
