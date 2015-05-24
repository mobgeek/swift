// Playground - noun: a place where people can play

import UIKit

// Closures

func duasVezes(num: Int) -> Int {

    return 2 * num

}

var dobro = duasVezes(2)

count("Fabio")


let megaSena = [02, 33, 35, 12, 46, 13]

// sorted : ordenado

// (Int, Int) -> Bool

func decrescente(n1: Int, n2: Int) -> Bool {
    
    return n1 > n2
    
}

//Usando função como parâmetro

var megaOrdenadaDecrescente = sorted(megaSena, decrescente)

//Usando inline closure como parâmetro e simplificando ela a cada linha

megaOrdenadaDecrescente = sorted(megaSena, {(n1: Int, n2: Int) -> Bool in return n1 > n2})

megaOrdenadaDecrescente = sorted(megaSena, {(n1, n2) in return n1 > n2})

megaOrdenadaDecrescente = sorted(megaSena, {$0 > $1})

megaOrdenadaDecrescente = sorted(megaSena) {$0 > $1} // trailing closure.


// numero curto de argumentos

megaOrdenadaDecrescente


func criarDoador(paraValor valor: Int) -> () -> Int {
    
    var doaçãoTotal = 0
    
    func doador() -> Int {
        
        doaçãoTotal += valor
        
        return doaçãoTotal
        
    }
    
    return doador
}

let doarDez = criarDoador(paraValor: 10)

doarDez()

doarDez()

doarDez()


let doarVinte = criarDoador(paraValor: 20)

doarVinte()

doarDez()

let tambemDoarDez = doarDez

tambemDoarDez()

