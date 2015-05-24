// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Exemplo #01

var linguagem = "Obj-C"

linguagem = "Swift"


// Exemplo #02

var idade = 18

var novaIdade = idade + 2


// Exemplo #03: for 10 times. 100 times.

for i in 0..<50 {
    
    i*i
    
}

// Exemplo #04

var preço = 3.46

var avaliação: String


switch preço {
    
case 0...10:
    
    avaliação = "Aproveita! o preço está bom!"
    
case 11...50:
    
    avaliação = "Caro, não?"
    
default:
    
    avaliação = "Espera por uma melhor oportunidade de compra."
    
}


// Exemplo Extra:

let color = UIColor.greenColor()


