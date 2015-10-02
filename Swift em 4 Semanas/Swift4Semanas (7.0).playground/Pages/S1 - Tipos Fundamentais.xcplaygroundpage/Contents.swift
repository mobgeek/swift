//: [Anterior: Constantes e Variáveis](@previous)

// Playground - noun: a place where people can play

import UIKit


//Inteiros e Decimais


var anguloDeLançamento: Int = 4

var anguloDeLançamentoMaisPreciso: Double = 4.3248969578956


//Booleanos


var gostaDeBanana = true   //Swift infere o tipo como sendo Bool

var clienteMilhas = false

//clienteMilhas = "não tem!"   //erro, a variável é do tipo Bool e não String.


//Conversão de Tipos


var valorFixo = 40

var ajuste = 0.3567

//Soma feita usando valores literais, ou seja, que não fora associados a uma varável ou constante

40 + 0.3567

//Não é possível realizar a soma abaixo, pois Swift verifica que uma variável é do tipo Int e outra do tipo Double

//valorFixo + ajuste

var valorFixoTipoDouble = Double(valorFixo) + ajuste

let integerTaxaFixa = Int(valorFixoTipoDouble)


//Tipagem Segura


//var nome: String = 3   //erro, atribuindo Int a uma variável do tipo String

var tempoAproximado = 10   //Swift deduz que é do tipo Int

var tempoExato = 10 + 0.3456   //Não gera erro, pois está somando valores litera

//: [Próximo: Operadores Básicos](@next)
