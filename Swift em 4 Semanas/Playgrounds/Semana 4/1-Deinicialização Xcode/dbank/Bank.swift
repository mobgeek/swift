//
//  Bank.swift
//  dBank
//
//  Created by Fabio Santos on 16/01/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import Foundation


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
    
    static func recebeMoedas(moedas: Int) {
        
        moedasCofre += moedas
        
    }
}
