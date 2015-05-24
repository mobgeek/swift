//
//  Jogador.swift
//  dBank
//
//  Created by Fabio Santos on 16/01/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import Foundation


class Jogador {
    
    var moedasNaCarteira: Int
    
    init(moedas: Int) {
        
        moedasNaCarteira = Banco.distMoedas(moedas)
        
    }
    
    //pegar moedas com o banco e colocar na carteira.
    
    func ganhaMoedas(moedas: Int) {
        
        moedasNaCarteira += Banco.distMoedas(moedas)
        
    }
    
    //retorna todas as moedas do jogador para o banco.
    
    deinit {
        println("Chamaram o 'deinit'!")
        
        Banco.recebeMoedas(moedasNaCarteira)
        
    }
}
