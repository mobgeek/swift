//: [Anterior: Protocolos](@previous)

// Playground - noun: a place where people can play

import UIKit

// Type Casting: is e as.

class ItemMidia {
    
    var nome: String
    
    init(nome: String) {
        
        self.nome = nome
        
    }
}

class Filme: ItemMidia {
    
    var diretor: String
    
    init(nome: String, diretor: String) {
        
        self.diretor = diretor
        super.init(nome: nome) // atenção!
        
    }
}

class Musica: ItemMidia {
    
    var artista: String
    
    init(nome: String, artista: String) {
        
        self.artista = artista
        super.init(nome: nome)
        
    }
}

// bibliotetica é do tipo [ItemMidia], compreove isso usando 'option + click' no constante para verificar seu tipo

let biblioteca = [Filme(nome:"Cidade de Deus",diretor: "Fernando Meirelles"),
    Musica(nome: "Maps", artista: "Maroon 5"),
    Filme(nome:"Spy Game",diretor: "Tony Scott"),
    Filme(nome:"Lista De Schindler",diretor: "Steven Spielberg"),
    Musica(nome: "Rude", artista: "Magic!")]


var contaFilme = 0
var contaMúsica = 0

for item in biblioteca {
    
    if item is Filme {
        
        ++contaFilme
        
    } else if item is Musica {
        
        ++contaMúsica
        
    }
}

print("A biblioteca de midia possui \(contaFilme) filmes e \(contaMúsica) músicas")

//as?

for item in biblioteca {
    
    if let filme = item as? Filme {
        
        print("Filme: '\(filme.nome)', dir. \(filme.diretor)'")
        
    } else if let música = item as? Musica {
        
        print("Música: '\(música.nome)', por \(música.artista)'")
    }
}

// Type Aliases: AnyObject e Any

// [AnyObject]

let algunsObjetos: [AnyObject] = [Filme(nome: "2001: A Space Odyssey", diretor: "Stanley Kubrick"),
    Filme(nome: "Moon", diretor: "Duncan Jones"),
    Filme(nome: "Alien", diretor: "Ridley Scott")]

// Como sabemos que essa Array apenas contém instância de Filme, podemos fazer downcast e unwrap diretamente com a versão as do operador:

for objeto in algunsObjetos {
    
    let filme = objeto as! Filme
    
    print("Filme: '\(filme.nome)', dir. \(filme.diretor)")
}


// Any

var coisas = [Any]()

coisas.append(0.00)
coisas.append("Oi")
coisas.append((1.3, 4.0))
coisas.append(Filme(nome: "Caça Fantasmas", diretor: "Ivan Reitman"))
coisas.append({ (nome: String) -> String in "Oi, \(nome)" })

for coisa in coisas {
    
    switch coisa {
        
    case 0 as Double:
        
        print("0 como um Double")
        
    case let umString as String:
        
        print("um string com valor \"\(umString)\"")
        
    case let(x,y) as (Double, Double):
        
        print("um ponto (x,y): (\(x), \(y))")
        
    case let filme as Filme:
        
        print("Um filme chamado '\(filme.nome)' , dir. \(filme.diretor)'")
        
    case let stringConverter as String -> String:
        
        print(stringConverter("Maria"))
        
    default:
        
        print("Outra coisa!")
    }
    
}

//: [Próximo: Tratamento de Erros](@next)
