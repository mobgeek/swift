// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Enumerations

// Regiões: Norte, Sul, Leste e Oeste.

enum Regiao {
    
    case Norte
    case Sul
    case Oeste, Leste

}

var regiaoPreferida = Regiao.Norte


regiaoPreferida = .Sul


switch regiaoPreferida {

case .Norte:
    
    println("Vários planetas têm norte")

default:
    
    println("Com certeza não é o Norte!")

}

// Valores Associados

// UPC-A: 1-0123456789-1
// QR até 2.953 caracteres.

enum CodigoDeBarras {

    case UPCA(Int, Int, Int, Int)
    case QRCode(String)

}

var codigoBarrasProduto = CodigoDeBarras.UPCA(4, 86897, 45667, 2)

codigoBarrasProduto = .QRCode("HFGYEURTES")



switch codigoBarrasProduto {
    
case .UPCA(let numeroSistema, let fabricante, let produto, let verificador):
    
    // alternativa: case let .UPCA(numeroSistema, fabricante, produto, verificador):
    
    println("UPC-A com os valores \(numeroSistema), \(fabricante),\(produto), \(verificador).")
    
case .QRCode(let codigo):
    
    println("QR Code com o valor \(codigo).")
    
}

// Valores padrão (raw values)


enum Moeda: String {

    case Real = "R$"
    case Euro = "€"
    case Dolar = "$"

}


enum Medalha: Int {

    case Ouro = 1, Prata, Bronze

}


let posiçãoParaPrata = Medalha.Prata.rawValue

var possívelMedalha = Medalha(rawValue: 3) // Medalha?


let classificação = 4

if let algumaPremiação = Medalha(rawValue: classificação) {

    switch algumaPremiação {
    
    case .Ouro:
        
        println("Você é o vencedor!")
        
    default:
        
        println("É podium")
    
    }
} else {

    println("Você conseguiu! Obrigado pela participação :-)")
    
}












