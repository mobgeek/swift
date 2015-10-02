//: [Anterior: Propriedades](@previous)

// Playground - noun: a place where people can play

import UIKit

// Métodos em Classes

class Pontuador {
    
    var pontosTotal = 0
    
    func pontua() {
        
        pontosTotal++
        
    }
    
    func pontuaCom(quantidade: Int) {
        
        pontosTotal += quantidade
        
    }
    
    func reseta() {
        
        pontosTotal = 0
        
    }
}

let pontuação = Pontuador()

pontuação.pontua()
pontuação.pontuaCom(10)
pontuação.reseta()

class PontuadorBeta {
    
    var pontosTotal = 0
    
    func pontua() {
        
        pontosTotal++
        
    }
    
    func pontuaCom(quantidade: Int, numeroDeVezes: Int) {
        
        pontosTotal += quantidade * numeroDeVezes
        
    }
    
    func reseta() {
        
        pontosTotal = 0
        
    }
}

let pontuaçãoBeta = PontuadorBeta()

pontuaçãoBeta.pontuaCom(4, numeroDeVezes: 2)


// self


class PontuadorGama {
    
    var pontosTotal = 0
    
    func pontua() {
        
        self.pontosTotal++
        
    }
    
    func pontuaCom(quantidade: Int, numeroDeVezes: Int) {
        
        self.pontosTotal += quantidade * numeroDeVezes
        
    }
    
    func reseta() {
        
        self.pontosTotal = 0
        
    }
}

class PontuadorAlfa {
    
    var pontosTotal = 0
    
    func pontua() {
        
        self.pontosTotal++
        
    }
    
    func pontuaCom(quantidade: Int, numeroDeVezes: Int) {
        
        self.pontosTotal += quantidade * numeroDeVezes
        
    }
    
    func reseta() {
        
        self.pontosTotal = 0
        
    }
    
    func restauraPontosPara(pontosTotal: Int) {
        
        //nomes iguais !!! Use self para distinguir nome de propriedade da instância do nome do parâmetro do método
        
        self.pontosTotal = pontosTotal
        
    }
}

let pontuacaoAlfa = PontuadorAlfa()

pontuacaoAlfa.pontuaCom(8, numeroDeVezes: 2)

pontuacaoAlfa.restauraPontosPara(10)


// Métodos em Estruturas


struct Ponto {
    
    var x = 0.0, y = 0.0
    
    mutating func moverPorX(deltaX: Double, y deltaY: Double) {
        
        x += deltaX
        y += deltaY
        
    }
}

var pontoFixo = Ponto(x: 5, y: 5)

pontoFixo.moverPorX(2, y: 5)

let pontoRealmenteFixo = Ponto(x: 2, y: 3)

// pontoRealmenteFixo.moverPorX(1, y: 2)   //Erro



struct PontoBeta {
    
    var x = 0.0, y = 0.0
    
    mutating func moverPorX(deltaX: Double, y deltaY: Double) {
        
        self = PontoBeta(x: x + deltaX, y: y + deltaY)
        
    }
}

var pontoBeta = PontoBeta()

pontoBeta.moverPorX(8, y: 9)


//Métodos em Enumerações

enum InterruptorTrêsNiveis {
    
    case Desligado, Baixo, Alto
    
    mutating func proximo() {
        
        switch self {
            
        case Desligado:
            
            self = Baixo
            
        case Baixo:
            
            self = Alto
            
        case Alto:
            
            self = Desligado
            
        }
        
    }
    
}

var luzQuarto = InterruptorTrêsNiveis.Alto

luzQuarto.proximo()

luzQuarto.proximo()


// Métodos do Tipo


class UmaClasse {
    
    class func umMétodoDoTipo() {
        
        // aqui você escreve a implementação
        var chameiOMétodoDoTipo = true
        
    }
    
}

UmaClasse.umMétodoDoTipo()


// Para estruturas precisamos usar o termo 'static'

class UmaEstrutura {
    
    static func umMétodoDoTipo() {
        
        //implementação
        
    }
    
}

//Um exemplo mais claro de métodos do tipo, é o métodos blueColor() do tipo UIColor.

//Até que faz sentido ele ser implementado dessa forma, pois podemos simplesmente querer retornar uma cor verde, sem ter que instânciar um objeto do tipo UIColor.

UIColor.greenColor()


//: [Próximo: Herança](@next)
