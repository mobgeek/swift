// Playground - noun: a place where people can play

import UIKit

// Classes e Estruturas

struct Resolução {
    // Propriedades ; Stored Properties (Propriedades de Armazenamento)

    var largura = 0
    
    var altura = 0

}

class AiPhone {
    
    // Propriedades

    var resolução = Resolução()
    
    var desbloqueado = false
    
    var peso = 0
    
    var dono: String?
    
}

var umiPhone = AiPhone()   //Initializer Syntax

var umaResolução = Resolução()


umiPhone.desbloqueado   //dot syntax

umaResolução.largura

umiPhone.resolução.altura


umiPhone.desbloqueado = true

umaResolução.largura = 1920


// Memberwise Initializers.


var fullHD = Resolução(largura: 1920, altura: 1080)


// Tipo Valor vs Referência


class Pessoa {
    
    var nome = ""
    
    var idade = 18
    
}

var pessoa = Pessoa()

var antigaResolução = Resolução(largura: 1920, altura: 1080)

var mesmaPessoa = pessoa // Classe: tipo ref.
var novaResolução = antigaResolução // Struct: tipo valor.

mesmaPessoa.nome = "João"

pessoa   //alterou aqui também

novaResolução.altura = 480

antigaResolução   //altura permaneceu a mesma


// Enumerations também são do tipo valor


enum Cor {
    
    case Vermelho, Laranja, Amarelo, Verde, Ciano, Azul, Violeta
    
}

var corSelecionada = Cor.Laranja

var corPreferida = corSelecionada

corSelecionada = Cor.Amarelo


if corPreferida == .Laranja {
    
    println("A cor preferida continua sendo laranja")
    
}

if corSelecionada == .Amarelo {
    
    println("A cor selecionada mudou pra Amarelo")
    
}


// Operadores Identidade (===, !==)

if pessoa === mesmaPessoa {
    
    println("pessoa e mesmaPessoa se referem a mesma instância")
    
}

var umaOutraPessoa = Pessoa()

if pessoa !== umaOutraPessoa {
    
    println("pessoa e umaOutraPessoa não se referem a mesma instância")
    
}

// (===) Idêntico
// (==) Igual
// (=) Atribiução
