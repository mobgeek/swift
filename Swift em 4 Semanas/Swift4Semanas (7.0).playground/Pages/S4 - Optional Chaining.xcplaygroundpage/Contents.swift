//: [Anterior: Generics](@previous)

// Playground - noun: a place where people can play

import UIKit

// Optional Chaining

class Endereço {
    
    var nomePrédio: String?
    var númeroPrédio: String?
    var rua: String?
    
    func identificadorPrédio() -> String? {
        
        if nomePrédio != nil {
            
            return nomePrédio
            
        } else if númeroPrédio != nil {
            
            return númeroPrédio
            
        } else {
            
            return nil
            
        }
    }
    
}

class Cômodo {
    
    let nome: String
    
    init(nome:String)
    {
        self.nome = nome
    }
    
}

class Residência {
    
    var endereço: Endereço?
    
    var comodos = [Cômodo]()
    
    var numeroDeComodos: Int {
        //propriedade computada que retorna a quantidade de itens no array de cômodos
        
        return comodos.count
        
    }
    
    subscript (i: Int) -> Cômodo {
        
        return comodos[i]
        
    }
    
    func imprimeNumeroDeCômodos() {
        
        print("O numero de quartos é \(numeroDeComodos)")
        
    }
    
}

class Pessoa {
    
    var primeiraResidência = Residência()
    
    //Swift infere que residência é do tipo Residência
    var segundaResidência: Residência?
}

let renan = Pessoa()

var dinheiro: String?

//renan.segundaResidência!.numeroDeComodos  //erro, o programa para de exeutar tudo que está abaixo pois está tentando desempacotar um valor que não existe.

renan.segundaResidência?.numeroDeComodos


// Acessando propriedades

if let quantidadeComodos = renan.segundaResidência?.numeroDeComodos {
    
    print("A residência do Renan tem \(quantidadeComodos) quarto(s).")
    
} else {
    
    print("Não foi possível consultar o número de quartos.")
    
}


let casaDoRenan = Residência()

casaDoRenan.comodos += [Cômodo(nome: "Sala de Estar")]
casaDoRenan.comodos += [Cômodo(nome: "Cozinha")]

renan.segundaResidência = casaDoRenan

renan.segundaResidência?.numeroDeComodos


if let quantidadeComodos = renan.segundaResidência?.numeroDeComodos {
    //retorna um valor do tipo Int?
    
    print("A residência do Renan tem \(quantidadeComodos) cômodo(s).")
    
} else {
    
    print("Não foi possível consultar o número de cômodos.")
    
}


// Chamando métodos

if renan.segundaResidência?.imprimeNumeroDeCômodos() != nil {
    
    //retorna um Void? (Optional Void)
    
    print("Foi possível enviar a mensagem com o número de quartos.")
    
} else {
    
    print("Não foi possível enviar a mensagem com o número de quartos.")
    
}


var umEndereço = Endereço()

if (renan.segundaResidência?.endereço = umEndereço) != nil {
    
    print("Endereço foi atualizado com sucesso.")
    
} else {
    
    print("Não foi possível atualizar o endereço com sucesso.")
    
}


// Múltiplos níveis


if let ruaDoRenan = renan.segundaResidência?.endereço?.rua {   //retorna um String?
    
    print("A rua do Renan é \(ruaDoRenan).")
    
} else {
    
    print("Não foi possível obter o endereço.")
    
}


// Chamando métodos que retornam valores opcionais


if let identificadorPredio = renan.primeiraResidência.endereço?.identificadorPrédio() {
    print("Identificador do prédio do Renan:  \(identificadorPredio).")
}


renan.segundaResidência?.endereço?.nomePrédio = "Condominio das Flores"

if let comecaComCondominio = renan.segundaResidência?.endereço?.identificadorPrédio()?.hasPrefix("Condominio") {
    
    print("Identificador do Prédio começa com\"Condomínio\".")
    
}


// Subscripts


if let primeiroNomeDoCômodo = renan.segundaResidência?[0].nome {   //String?
    
    print("O primeiro nome do comodo é \(primeiroNomeDoCômodo)")
    
} else {
    
    print("Não foi possível retornar o primeiro nome do Comodo")
    
}

//: [Próximo: Protocol Extensions](@next)
