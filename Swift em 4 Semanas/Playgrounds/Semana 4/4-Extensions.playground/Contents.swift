// Playground - noun: a place where people can play

import UIKit

// Extensions

// Propriedades Computadas

extension Double {
    
    var km: Double { return self * 1_000.0 }
    var m:  Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
    
}

let umaPolegada = 25.4.mm

let tresPés = 3.ft

let maratona = 42.km + 195.m


//Métodos

extension Int {
    
    func repetição(tarefa: () -> ()) {
        
        //() -> () indica uma função que não recebe parâmetros e não retorna valor.
        
        for i in 0..<self {
            
            tarefa()
        }
    }
}

7.repetição({
    
    println("Hey!")
})

7.repetição{println("Alou!")}   //Usando notação Trailing Closures



// Estendendo estruturas

extension Int {
    
    //Usar mutating
    
    mutating func ²() {
        
        self = self * self
    }
}

var inteiro = 3

inteiro.²()


// Acrescentando Nested Types

extension Int {
    
    enum Categoria {
        
        case Negativo, Positivo, Zero
        
    }
    
    var categoria: Categoria {   //propriedade computada read-only
        
        switch self {
            
        case 0:
            
            return .Zero
            
        case let x where x > 0:
            
            return .Positivo
            
        default:
            
            return .Negativo
            
        }
    }
}

func printCategoriaInteiros(numeros: [Int]) {
    
    for numero in numeros {
        
        switch numero.categoria {   //retorna a categoria do número
            
        case .Negativo:
            
            println("- ")
            
        case .Zero:
            
            println("0 ")
            
        case .Positivo:
            
            println("+ ")
        }
    }
    
    println("\n")
}

printCategoriaInteiros([3, 19, -27, 0, -6, 0, 7])


//Para verificar a saída: View -> Assistant Editor -> Show Assistant Editor

