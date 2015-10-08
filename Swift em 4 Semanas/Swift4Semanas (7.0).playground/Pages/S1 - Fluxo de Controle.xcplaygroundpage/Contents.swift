//: [Anterior: Operadores Básicos](@previous)

// Playground - noun: a place where people can play

import UIKit

// Controle Condicional

var temperatura = 35

if temperatura >= 35 {
    
    print("Tá quente! Partiu Praia!")
    
} else if temperatura <= 25 {
    
    print("Cariocas! preparem os seus casacos!")
    
} else {
    
    print("Pessoal, ainda não esquentou de verdade.")
    
}


// Operadores Lógicos:

var permitirJogar = false

if !permitirJogar {
    
    print("Video-game suspenso!")
    
}

// &&: ambos os valores precisam ser true para expressão inteira ser verdadeira.

var jantouTudo = true
var fezDever = false

if jantouTudo && fezDever {
    
    print("Playstation ligando...")
    
} else {
    
    print("Vamos cumprir os deveres primeiro?")
    
}

// ||: apenas um dos valores precisa ser true para toda a expressão ser true.

var temIngresso = false
var conheceFulanoDaOrganizacao = false

if temIngresso || conheceFulanoDaOrganizacao {
    
    print("Seja bem vindo!")
    
} else {
    
    print("O jogo passa na tv!")
    
}


var daImprensa = false
var temCracha = true

if temIngresso || conheceFulanoDaOrganizacao || daImprensa && temCracha {
    
    print("Seja bem vindo!")
    
} else {
    
    print("O jogo passa na tv!")
    
}


// Switch

var caller = ""

caller = "Mãe"

switch caller {
    
case "Pai":
    
    print("Pai, já te ligo!")
    
case "Amor":
    
    print("\(caller), to acabando de me arrumar.")
    
case "Mãe":
    
    print("Mãe, retorno assim que puder.")
    
default:
    
    print("Você ligou para o Fabio. Deixe o seu recado após o PIPS!")
    
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


// Guard

/*: Para falarmos sobre a estrutura condicional guard, precisaremos primeiro estudar optionals e funções.

Aqui está um link direto para os arquivos:

[Optionals Semana 2](S2%20-%20Optionals)

---

[Funções Semana 2](S2%20-%20Funções)

---

[Guard Semana 2](S2%20-%20Guard)

*/


// Loops

// For-in

for elemento in 1...9 {
    
    print("\(elemento) vezes 6 é \(elemento * 6)")
    
}


for letra in "Cafe".characters {
    
    print("Letra é \(letra)")
    
}


// For-condição-incremento


for var tentativa = 0; tentativa < 3; ++tentativa {
    
    print("Tentativa número: \(tentativa)")
    
}


// While


var dinheiro = 5

while dinheiro > 3 {
    
    print("Pode pedir a última! Saldo: \(dinheiro)")
    
    --dinheiro
    
}

dinheiro = 10


// Do-While


repeat {
    
    print("Pode pedir a última! Saldo: \(dinheiro)")
    
    --dinheiro
    
} while dinheiro > 3

dinheiro


//Extra: é possível verificar por condições ao final de um loop for-in usando a cláusula 'where'

for par in 0...10 where par % 2 == 0 {
    
    par
    
}

//: [Próximo: Continue & Break](@next)
