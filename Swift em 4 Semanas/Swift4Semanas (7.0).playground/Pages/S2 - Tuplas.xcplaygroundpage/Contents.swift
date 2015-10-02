//: [Anterior: Optionals](@previous)

// Playground - noun: a place where people can play

import UIKit

let compra = (5, "KG", "Maça") // (Int, String, String)

let (quantidade, unidade, mercadoria) = compra

print("Você comprou \(quantidade) \(unidade) de \(mercadoria).")


let (_,_,produto) = compra

print("\(produto) foi adicionada ao seu carrinho :-)")


print("\(compra.2) foi adicionada ao seu carrinho.")


let minhaCompra = (quantidade: 2, unidade: "KG", mercadoria: "Laranja")

let meuProduto = minhaCompra.mercadoria

//: [Próximo: Funções](@next)
