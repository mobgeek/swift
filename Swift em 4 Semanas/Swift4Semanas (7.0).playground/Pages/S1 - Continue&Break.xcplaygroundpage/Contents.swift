//: [Anterior: Fluxo de Controle](@previous)

//Playground - noun: a place where people can play

import UIKit

// Transferência de Controle


// Continue

let frase = "Estou super empolgado com Swift"

var contadorLetraO = 0

for character in frase.characters {
    
    switch character {
        
    case "o":
        
        ++contadorLetraO
        
    default:
        
        continue   //atua sobre o loop
    }
}


// Break


let sequencia: String = ":-]"

var possivelSmiley: String?

switch sequencia {
    
case ":-)", ":-]", ":)":
    
    possivelSmiley = "\u{1F604}"
    
case ":-(", ":-[", ":(":
    
    possivelSmiley = "\u{1F61E}"
    
default:
    
    break
}


var lista = ["banana", "maça","kiwi", "tomate", "banana"]

for item in lista {
    
    if "maça" == item {
        
        print("Encontrei a maça!")
        break
        
    }
    
}


// Aninhando estruturas


var quantidadeBananas = 0


listaLoop: for item in lista {
    
    switch item {
        
    case "banana":
        +quantidadeBananas
        
    case "tomate":
        break listaLoop
        
    default:
        break
        
        
    }
    
}

//: [Próximo: Optionals](@next)
