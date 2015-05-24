// Playground - noun: a place where people can play

import UIKit

struct Tamanho {
    var largura = 0.0, altura = 0.0
}

struct Ponto {
    var x = 0.0, y = 0.0
}

struct Retangulo {
    var origem = Ponto() // a origem do Retângulo.
    var tamanho = Tamanho() // o tamanho do Retângulo.
    
    init() {}
    init(origem: Ponto, tamanho: Tamanho) {
        
        self.origem = origem
        self.tamanho = tamanho
    }
    
    init(centro: Ponto, tamanho: Tamanho) {
        
        let originX = centro.x - (tamanho.largura / 2)
        let originY = centro.y - (tamanho.altura / 2)
        self.init(origem: Ponto(x: originX, y: originY), tamanho: tamanho)
        
    }
}

let retanguloBasico = Retangulo()

let retanguloOrigem = Retangulo(origem: Ponto(x: 2.0, y: 2.0),
    tamanho: Tamanho(largura: 5.0, altura: 5.0))

let retanguloCentro = Retangulo(centro: Ponto(x: 4.0, y: 4.0),
    tamanho: Tamanho(largura: 3.0, altura: 3.0))


// Herança e Initializers


class Veículo {
    
    var quantidadeRodas = 0
    
    var descrição: String {
        
        return "\(quantidadeRodas) roda(s)"
        
    }
}

class Bicicleta: Veículo {
    
    override init() {
        super.init()
        quantidadeRodas = 2
        
    }
}

let bike = Bicicleta()

println("Bicicleta: \(bike.descrição)")


// Como herdar inicializadores automaticamente?


class Alimento {
    
    var nome: String
    
    // designated init
    
    init(nome: String) {
        
        self.nome = nome
    }
    
    convenience init() {   //Poder criar uma instância dessa classe sem informar um nome inicial.
        
        self.init(nome: "[Sem nome]")
        //chama o seu designated init -> init(nome:String)
        
    }
}

let carneConhecida = Alimento(nome: "Picanha")
//chamando o designated init

let carneDesconhecida = Alimento()
//chamando o convenience init


class IngredienteDaReceita: Alimento {
    
    var quantidade: Int
    
    init(nome: String, quantidade: Int) {   // (1) designated init
        
        self.quantidade = quantidade // (2)
        
        super.init(nome: nome)   // (3) chama o designated init da sua superclasse
        
    }
    
    //Usando override pois esse convenience init sobrescreve o designated init da sua superclasse
    
    override convenience init(nome: String) {   //Poder criar um instância dessa classe apenas com o nome
        
        self.init(nome: nome, quantidade: 1)   //chama o seu designated init -> init(nome:String, quantidade:Int)
        
    }
}

let umItemDesconhecido = IngredienteDaReceita()
//chamando o convenience init de Alimento

let umQueijo = IngredienteDaReceita(nome: "Queijo")
//chamando o convenience init de IngredienteDaReceita

let tresOvos = IngredienteDaReceita(nome: "Ovos", quantidade: 3)   //chamando o designated init de IngredienteDaReceita


class ItemListaDeCompras: IngredienteDaReceita {
    
    var comprado = false
    
    var descrição: String {
        
        var output = "\(quantidade) x \(nome)"
        
        output += comprado ? " ✔" : " ✘"
        
        return output
    }
    
    //Como esta classe não possui initializers, ela automaticamente herda todos os designated e convenience initializers da sua superclasse
    
}

var listaCafeDaManha = [ItemListaDeCompras(), ItemListaDeCompras(nome: "Queijo"), ItemListaDeCompras(nome: "Ovos", quantidade: 3)]

listaCafeDaManha[0].nome = "Orange juice"
listaCafeDaManha[0].comprado = true
