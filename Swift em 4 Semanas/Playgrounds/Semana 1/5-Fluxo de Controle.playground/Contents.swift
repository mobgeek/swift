// Playground - noun: a place where people can play

import UIKit

// Controle Condicional 

var temperatura = 35

if temperatura >= 35 {
    
    println("Tá quente! Partiu Praia!")

} else if temperatura <= 25 {

    println("Cariocas! preparem os seus casacos!")

} else {

    println("Pessoal, ainda não esquentou de verdade.")

}


// Operadores Lógicos:

var permitirJogar = false

if !permitirJogar {

    println("Video-game suspenso!")

}

// &&: ambos os valores precisam ser true para expressão inteira ser verdadeira.

var jantouTudo = true
var fezDever = false

if jantouTudo && fezDever {

    println("Playstation ligando...")

} else {

    println("Vamos cumprir os deveres primeiro?")
    
}

// ||: apenas um dos valores precisa ser true para toda a expressão ser true.

var temIngresso = false
var conheceFulanoDaOrganizacao = false

if temIngresso || conheceFulanoDaOrganizacao {

    println("Seja bem vindo!")

} else {
    
    println("O jogo passa na tv!")

}


var daImprensa = false
var temCracha = true

if temIngresso || conheceFulanoDaOrganizacao || daImprensa && temCracha {

    println("Seja bem vindo!")

} else {
    
    println("O jogo passa na tv!")
    
}


// Switch

var caller = ""

caller = "Mãe"

switch caller {

    case "Pai":
    
    println("Pai, já te ligo!")
    
    case "Amor":
    
    println("\(caller), to acabando de me arrumar.")
    
    case "Mãe":
    
    println("Mãe, retorno assim que puder.")

    default:
    
    println("Você ligou para o Fabio. Deixe o seu recado após o PIPS!")
    
}


// Séries (Operadores Range)

1...5

1..<5


var ligações = 11

var contadorNatural: String

switch ligações {
    
case 0...9:
    contadorNatural = "algumas vezes"
    
case 10...99:
    contadorNatural = "dezenas de vezes"
    
default:
    contadorNatural = "um monte de vezes"

}

let mensagem = "Você me ligou \(contadorNatural)"


// Loops

// For-in

for elemento in 1...9 {

    println("\(elemento) vezes 6 é \(elemento * 6)")

}


for letra in "Cafe" {

    println("Letra é \(letra)")

}


// For-condição-incremento


for var tentativa = 0; tentativa < 3; ++tentativa {

    println("Tentativa número: \(tentativa)")

}


// While


var dinheiro = 5

while dinheiro > 3 {
    
    println("Pode pedir a última! Saldo: \(dinheiro)")
    
    --dinheiro
    
}

dinheiro = 10


// Do-While


do {

    println("Pode pedir a última! Saldo: \(dinheiro)")

    --dinheiro
    
} while dinheiro > 3

dinheiro

