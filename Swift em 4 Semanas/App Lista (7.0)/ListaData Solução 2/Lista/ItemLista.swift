//
//  ItemLista.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import Foundation

class ItemLista {

    var nome: String
    
    var concluido = false
    
    let dataCriacao: NSDate
    
    
    init(nome: String) {
    
       self.nome = nome
        
        let secondsPerDay: NSTimeInterval = 24 * 60 * 60
        
        let ontem = NSDate(timeIntervalSinceNow: -secondsPerDay)
        
        dataCriacao = ontem
    
    }
}