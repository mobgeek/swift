//: [Anterior: Herança](@previous)

// Playground - noun: a place where you can play

import UIKit

// Initializers

struct CelsiusTeste {
    
    var temperatura:Double = 35.0
    
    //Uma outra opção seria usar o init() para inicializar temperatura. O resultado seria o mesmo.
    
    //    init() {
    //
    //        temperatura = 35.0
    //
    //    }
    
}

var c = CelsiusTeste()

print("A temperatura padrão é \(c.temperatura)")



//Customizando inicialização - Parâmetros de Inicialização


struct Celsius {
    
    var temperaturaEmCelsius: Double = 0.0
    
    init(deFahrenheit fahrenheit: Double) {
        
        temperaturaEmCelsius = (fahrenheit - 32) / 1.8
        
    }
    
    init(deKelvin kelvin: Double) {
        
        temperaturaEmCelsius = kelvin - 273.15
        
    }
    
}

//Não esquecer que definindo pontoDeEbulição e pontoDoCongelamento como constantes, todas as propriedades são consideradas constantes, por se tratar de uma estrutura (Tipo Valor)

let pontoDeEbulição = Celsius(deFahrenheit: 212.0)

let pontoDeCongelamento = Celsius(deKelvin: 273.15)


//Quando nomes externos para os parâmetros dos initializers não são informados, Swift irá considerar o nome como local e externo

struct Cor {
    
    let vermelho, verde, azul: Double
    
    init(vermelho: Double, verde: Double, azul: Double) {
        
        self.vermelho = vermelho
        self.verde = verde
        self.azul = azul
        
    }
    
    init(branco: Double) {
        
        vermelho = branco
        verde = branco
        azul = branco
        
    }
}

let magenta = Cor(vermelho: 1.0, verde: 0.0, azul: 1.0)

let meioCinza = Cor(branco: 0.5)

//let verdão = Cor(0.0, 1.0, 0.0)   //erro, nomes externos não foram informados


//Ignorando o Nome Externo

struct Celsius2 {
    
    var temperaturaEmCelsius: Double = 0.0
    
    //Basta usar o _ antes do parâmetro para não precisar usar mais nome externo
    
    init(_ celsius: Double) {
        
        temperaturaEmCelsius = celsius
        
    }
    
}

let temperaturaDoCorpo = Celsius2(37.0)   //nome externo foi ignorado


//Customizando inciaialização - Propriedades Opcionais


class PerguntaEnquete {
    
    var texto: String
    
    var resposta: String?   //inicializada com nil, logo, não é preciso usá-la em algum init
    
    init(texto: String) {
        
        self.texto = texto
        
    }
    
    func pergunta() {
        
        print(texto)
        
    }
}

let perguntaGeek = PerguntaEnquete(texto: "Você se considera um Geek?")

perguntaGeek.pergunta()
perguntaGeek.resposta = "Hm. Acho que sim :-)"
perguntaGeek.resposta!   //Lembrando que é preciso forçar o desempacotamento (F.U.)


//Propriedades Constantes:

//mudando a propriedade texto da classe PerguntaEnquete de variável para constante, ela poderá ter seu valor alterado apenas dentro de algum initializer



//Inicializadores Padrão

//Relembrando: Em Estruturas, ao fornecer ou não valores padrão para todas as propriedades, Swift fornece um Incializador de Membro.

//Agora, tanto Classes e Estruturas, ao terem todas as suas propriedades inicializadas com algum valor padrão, Swift fornecerá um Inicializador Padrão para elas. E nas Estruturas além de ter o Inicializador Padrão, terá o de Membro.


//Em Classes


class ListaDeCompras {
    
    var nome: String?
    
    var quantidade = 1
    
    var comprado = false
    
}

var item = ListaDeCompras()   //Inicializador Padrão


// Em estruturas


struct Resolução {
    
    var largura = 0.0
    
    var altura = 0.0
    
}

var fullHD1 = Resolução(largura: 1920, altura: 1080)   //Inicializador de Membro
var novaResolução = Resolução()   //Inicializador Padrão

//: [Próximo: Delegando Inicialização](@next)
