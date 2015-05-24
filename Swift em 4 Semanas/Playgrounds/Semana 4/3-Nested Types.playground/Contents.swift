//: Playground - noun: a place where people can play

import UIKit


// Nested Types

struct PapelMoeda {
    
    // tipo aninhado: Moeda
    
    enum Moeda: String {
        
        case Dolar = "$", Euro = "€", Real = "R$"
        
        var porExtenso: String {
            
            switch self {
                
            case .Dolar:
                
                return "Dólar Americano"
                
            case .Euro:
                
                return "Euro"
                
            case .Real:
                
                return "Real"
                
            }
            
        }
    }
    
    //tipo aninhado: Valor
    
    enum Valor: Int {
        
        case Dois = 2, Cinco = 5, Dez = 10, Vinte = 20, Cinquenta = 50, Cem = 100
        
    }
    
    // Propriedades de PapelMoeda:
    
    let moeda: Moeda, valor: Valor
    
    var descrição: String {
        
        return "Nota impressa de \(moeda.porExtenso) valendo \(moeda.rawValue)\(valor.rawValue)"
        
    }
}


let cemReais = PapelMoeda(moeda: .Real, valor: .Cem)
cemReais.descrição

let vinteEuros = PapelMoeda(moeda: .Euro, valor: .Vinte)
vinteEuros.descrição


//E se Swift não inferisse o tipo?

let maisCemReais = PapelMoeda(moeda: PapelMoeda.Moeda.Real, valor: .Cem)


let simboloEuro = PapelMoeda.Moeda.Euro.rawValue


