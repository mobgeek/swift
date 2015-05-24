// Playground - noun: a place where people can play

import UIKit


// Required Initializers


class umaClasse {
    
    required init() {
        
        // implementação aqui
    }
}

class umaSubclasse: umaClasse {
    
    required init() {
        
        // implementação do required initializer aqui
    }
}


// Failable Initializers


UIImage(named: "bebê.jpg")   //imagem não existe, nome está errado, é sem ^

if let imagemUsuário = UIImage(named: "bebe.jpg") {
    
    // carregou a imagem
    
    imagemUsuário

} else {
    
    // não podemos carregar a imagem
    
}

//As imagens estão na pasta resources, use o atalho 'Command + 1' para ver no playground



struct Estudante {
    
    var universidade: String
    
    init?(universidade: String) {
        
        // O valor de parâmetro "" não é considerado válido. Você retorna nil para indicar onde a falha será constatada.
        
        if universidade.isEmpty { return nil }
        
        self.universidade = universidade
    }
    
}

// Agora eu posso usar este 'failable init' pra inicializar um estudante e checar se foi bem sucedido:

let umEstudante = Estudante(universidade: "USP")


// Exemplificando a falha ao inicializar outroEstudante:

let outroEstudante = Estudante(universidade: "")


class Produto {
    
    let nome: String
    
    // IUO porque a classe Produto precisa fornecer um valor para a propriedade nome antes de gerar uma falha de inicialização.
    
    init?(nome: String) {
        
        self.nome = nome
        
        if nome.isEmpty { return nil }
        
    }
}





