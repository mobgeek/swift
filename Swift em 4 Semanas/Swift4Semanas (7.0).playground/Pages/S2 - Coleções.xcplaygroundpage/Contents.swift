//: [Anterior: Guard](@previous)

// Playground - noun: a place where people can play

import UIKit

// Arrays

var listaCompras: [String] = ["Laranja", "Maça", "Limão"]

var novaListaCompras = ["Laranja", "Tomate", "Alface"]


// Propriedades

listaCompras.count

novaListaCompras.isEmpty


// Métodos

listaCompras.append("Picanha")

listaCompras.removeAtIndex(2)

listaCompras

listaCompras += ["Abacaxi", "Cafe"]


// Subscript

listaCompras[0] = "Cerveja"

listaCompras[2...4] = ["Leite", "Sal"]

listaCompras


for item in listaCompras {
    
    print(item)
    
}

// Array vazia

var algunsInteiros = [Int] ()

algunsInteiros.append(6)
algunsInteiros.append(9)

algunsInteiros = []



// Dicionários

var dicionarioNumeros = [1: "Um", 2:"Dois"] // [Int: String]

dicionarioNumeros[3]

if let numero = dicionarioNumeros[3] {
    
    
    print("O valor correspondente a essa chave existe e é \(numero)")
    
}

dicionarioNumeros.count


dicionarioNumeros[3] = "Tres"

dicionarioNumeros[3] = "Três"


dicionarioNumeros[3] = nil

dicionarioNumeros


for (numero, descrição) in dicionarioNumeros {
    
    print("\(numero): \(descrição)")
    
}


for numero in dicionarioNumeros.keys {
    
    print("Número: \(numero)")
    
}


var numeroEmPolones = [Int:String]()

numeroEmPolones[13] = "trzynascie"


numeroEmPolones = [:]

//: [Próximo: Closures](@next)
