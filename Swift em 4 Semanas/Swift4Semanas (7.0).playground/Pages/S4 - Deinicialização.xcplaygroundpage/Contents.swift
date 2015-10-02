//: [Anterior: Tratamento de Erros](@previous)

// Playground - noun: a place where people can play

import UIKit

struct Banco {
    
    // acompanha o número de moedas no Banco.
    
    static var moedasCofre = 10_000
    
    // distribuição de moedas:
    
    static func distMoedas(var moedas: Int) -> Int {
        
        // antes de distribuir precisamos garantir que existem moedas suficiente:
        
        moedas = min(moedas, moedasCofre)
        
        moedasCofre -= moedas
        
        return moedas
        
    }
    
    // coletando moedas:
    
    static func receberMoedas(moedas: Int) {
        
        moedasCofre += moedas
        
    }
}


class Jogador {
    
    var moedasNaCarteira: Int
    
    init(moedas: Int) {
        
        moedasNaCarteira = Banco.distMoedas(moedas)
        
    }
    
    //pegar moedas com o banco e colocar na carteira.
    
    func ganharMoedas(moedas: Int) {
        
        moedasNaCarteira += Banco.distMoedas(moedas)
        
    }
    
    //retorna todas as moedas do jogador para o banco.
    
    deinit {
        
        Banco.receberMoedas(moedasNaCarteira)
        
    }
}


print("Moedas no Banco: \(Banco.moedasCofre)")

// adiciona 1000 moedas se estiverem disponiveis

var jogadorUm: Jogador? = Jogador(moedas: 100)

print("Novo jogador acaba de entrar com \(jogadorUm!.moedasNaCarteira) moedas")

print("Moedas no Banco: \(Banco.moedasCofre)")

print("*------ Segunda Parte: Jogador fatura 2000 moedas -------*")

jogadorUm!.ganharMoedas(2_000)

print("Moedas do Jogador:\(jogadorUm!.moedasNaCarteira)")

print("Moedas no Banco: \(Banco.moedasCofre)")

print("*------ Terceira Parte: Jogador resolve partir -------*")

jogadorUm = nil

print("JogadorUm deixou o jogo...")

print("Moedas no Banco: \(Banco.moedasCofre)")

//: [Próximo: Subscripts](@next)
