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


println("Moedas no Banco: \(Banco.moedasCofre)")

// adiciona 1000 moedas se estiverem disponiveis

var jogadorUm: Jogador? = Jogador(moedas: 100)

println("Novo jogador acaba de entrar com \(jogadorUm!.moedasNaCarteira) moedas")

println("Moedas no Banco: \(Banco.moedasCofre)")

println("*------ Segunda Parte: Jogador fatura 2000 moedas -------*")

jogadorUm!.ganharMoedas(2_000)

println("Moedas do Jogador:\(jogadorUm!.moedasNaCarteira)")

println("Moedas no Banco: \(Banco.moedasCofre)")

println("*------ Terceira Parte: Jogador resolve partir -------*")

jogadorUm = nil

println("JogadorUm deixou o jogo...")

println("Moedas no Banco: \(Banco.moedasCofre)")

