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
    
    let dataCriacao: NSDate      // 1º Passo
    
    
    init(nome: String) {
    
       self.nome = nome
        
       // agora = NSDate()
        
       dataCriacao = NSDate()    // 2º Passo
    
    }
}