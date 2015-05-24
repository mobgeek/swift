// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Optionals 

var telefoneFixo: String = "2616-8756"

var celular: String?

celular = "8875-6857"

//celular = nil

//telefoneFixo =  nil

// null

var numeroOpcional: Int?

var podeJogar: Bool?


// Como acessar? Forced Unwrapping

// celular!

if celular != nil {
    
    println("O celular dessa pessoa é: \(celular!)")

}

// Optional Binding

if let numeroParaDiscar = celular {

    println("Ligando para \(numeroParaDiscar)")

} else {

    println("Essa pessoa não possui celular")

}

// Operador Ternário com Optionals  
// pergunta ? resposta1 : resposta2

// var numeroPreferencial = celular != nil ? celular! : telefoneFixo


// Operador Nil Coalescing


var numeroPreferencial = celular ?? telefoneFixo


let bebidaPadrão = "chopp"

var bebidaPreferidaPeloCliente: String?

bebidaPreferidaPeloCliente = "Erdinger"

var bebidaPedido = bebidaPreferidaPeloCliente ?? bebidaPadrão


// Implicit Unwrapped Optionals (IUO)

// T! em vez de T?


var ideia: String? = "Temos aqui um String opcional"
// requer ! para acessar valor.

var ideiaCerta: String! = "Uma IUO"
// Não requer ! para acessar o seu valor.









