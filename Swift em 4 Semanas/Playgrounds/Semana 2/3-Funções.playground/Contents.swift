// Playground - noun: a place where people can play

import UIKit

// Funções

func cancelaPropaganda(nomeServico: String) -> String {
    
    switch nomeServico {
    
    case "Vivo":
        
        return "Enviando a mensagem SAIR a 457 (VIVO)"
    
    case "Claro":
        
        return "Enviando a mensagem SAIR a 888 (CLARO)"
        
    case "Oi":
        
        return "Enviando a mensagem SAIR a 55555 (OI)"
        
    case "TIM":
        
        return "Enviando a mensagem SAIR a 4112 (TIM)"
        
    default:
        
        return "Será que vc digitou corretamente a operadora?"
    
    }
}

var cancelamento = cancelaPropaganda("Vivo")


// Múltiplos parâmetros

func media(n1: Double, n2: Double) -> Double {

    return (n1 + n2) / 2

}

// Sem parâmetros


func confirma() -> String {

    return "Ahan..."

}

confirma()


// Valores de Retorno

// Sem valores de retorno: tipo de retorno é VOID.


func digaOcupado(nomePessoa: String) {

    println("To ocupado \(nomePessoa). Te ligo mais tarde!")

}

// Múltiplos valores de retorno.

func contar(string: String) -> (vogais: Int, consoantes: Int, outros: Int) {

    var vogais = 0 , consoantes = 0, outros = 0
    
    // classificação e incrementos das variáveis
    
    return (vogais, consoantes, outros)

}


// Nomes locais de parâmetro

func juntar(s1: String, s2: String, comJunção junção: String) -> String {

    return s1 + junção + s2

}


juntar("flamengo", "vasco", comJunção:" x ")


// Nomes externos curtos de Parâmetro:


// #

func possuiLetra(#string: String, #letraEncontrar: Character) -> Bool {

    for letra in string {
    
        if letra == letraEncontrar {
            
            return true
            
        }
    
    }
    
    return false

}


var temA = possuiLetra(string: "Oi Ana!", letraEncontrar: "A")



// Valores Padrão de Parâmetros

func novaJuntar(s1: String, s2: String, junção: String = " x ") -> String {

    return s1 + junção + s2

}

novaJuntar("Flamengo", "Vasco", junção: " e ")


// Parâmetros "Variadic"


func chamarIntensidade(var nome: String, intensidade: Int) -> String {

    for _ in 1...intensidade {
    
        nome += "!"
    
    }

    return nome
}

chamarIntensidade("Maria", 7)


// Parâmetros In-Out

func trocaAssento(inout a1: String, inout a2: String) {

    let assentoTemporario = a1
    
    a1 = a2
    
    a2 = assentoTemporario

}


var poltronaJoao = "17A"

var poltronaMarcos = "18B"

trocaAssento(&poltronaJoao, &poltronaMarcos)

poltronaJoao

poltronaMarcos


// Tipo Função


func adicionaInteiros(a: Int, b: Int) -> Int    // (Int, Int) -> Int
{
    return a + b
}

adicionaInteiros(3, 3)


func digaOi() { println("Oi")} // ()->() Void

digaOi()



var funcaoMatematica: (Int, Int) -> Int = adicionaInteiros


funcaoMatematica(2,5)

func resultado(funcaoMatematica: (Int, Int) -> Int, a: Int, b: Int) -> String
{

    return "Resultado: \(funcaoMatematica(a,b))"

}

resultado(adicionaInteiros, 4, 6)


// Funções Aninhadas


func selecionaOperação(comDesconto: Bool) -> (Double) -> Double
{
    func totalComDesconto(valor: Double) -> Double
    {
        
        return valor * 0.8 * 1.2
        
    }
    
    
    func totalSemDesconto(valor: Double) -> Double
    {
        
        return valor * 1.2
        
    }
    
    
    return comDesconto ? totalComDesconto : totalSemDesconto

}


var total = selecionaOperação(false)

total(10)






































