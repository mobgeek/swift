// Playground - noun: a place where people can play

import UIKit

// Instâncias de Estruturas como constantes

struct AiPhoneEstrutura {
    
    //Propriedades:

    var versãoOS: Float
    let UDID: String
    
}

var umAiPhone = AiPhoneEstrutura(versãoOS: 7.0, UDID:"GFHTUN56HET546GDM9KJ")

umAiPhone.versãoOS = 8.0

// umAiPhone.UDID = "" //Erro


let segundoAiPhone = AiPhoneEstrutura(versãoOS: 8.0, UDID:"RTHTYN56HET546GDJUKJ")

// segundoAiPhone.versãoOS = 7.0  // Isso irá reportar um erro, mesmo que versãoOS for declarado como uma variável.


// Instâncias de Classes como constantes


class AiPhoneClasse {
    
    var versãoOS = 7.0
    let UDID = ""
    
}

let umOutroAiPhone = AiPhoneClasse()

umOutroAiPhone.versãoOS = 8.0

umAiPhone


// Lazy


class ImportaDados {
    
    // vamos assumir que essa classe demora um pouquinho para inicializar.
    // Pode ser lento porque essa instância precisa abrir um arquivo e ler o seu conteúdo na memória enquanto a instância está sendo inicializada.

    let nomeDoArquivo = "dados.txt"
    
    // algumas outras funcionalidades aqui...

}

class MrDados {
    
    lazy var importa = ImportaDados()
    
    var dados = [String]()

    // algumas funcionalidades para gerenciar dados entrariam aqui...

}

let mister = MrDados()

mister.dados.append("Alguns dados")

mister.dados.append("Mais dados")

// A instância de ImportaDados para a propriedade importa ainda não foi criada.

mister.dados

mister.importa.nomeDoArquivo  //Aqui a instância de ImportaDados foi criada


// Propriedades Computadas


struct TriânguloEquilátero {
    
    var comprimentoLado: Double = 0.0
    
    var perimêtro: Double {
    
       get {
        
           return 3.0 * comprimentoLado
    
       }
    
       set(novoLado) {
    
           comprimentoLado = novoLado / 3.0
    
       }
    
    }
}

var triângulo = TriânguloEquilátero(comprimentoLado: 3.0)

var perimetroTriangulo = triângulo.perimêtro   //chamando o get

triângulo.comprimentoLado = 9.9   //chamando o set


// Propriedades Read-only


struct Ortoedro {

    var altura = 0.0, largura = 0.0, profundidade = 0.0
    
    var volume: Double {
        
            return altura*largura*profundidade
        
    }
}


let caixa = Ortoedro(altura: 3.0, largura: 2.0, profundidade: 8.0)

caixa.volume

//caixa.valume = 60   //Erro


// Observadores de Propriedades


class ContaPassos {

    var totalPassos: Int = 0 {
    
        willSet(novoTotalPassos) {
    
            println("Prestes a configurar totalPassos para \(novoTotalPassos) ")
        }
    
        didSet {
    
            if totalPassos > oldValue {
        
                println("\(totalPassos - oldValue) passos adicionados!")
        
            }
    
        }
    
    }

}


let contaPassos = ContaPassos()

contaPassos.totalPassos = 500

// Prestes a configurar totalPassos para 200
// 200 passos adicioandos!

contaPassos.totalPassos = 600

// Prestes a configurar totalPassos para 600
// 100 passos adicioandos!


// Propriedades de Tipo


struct umaEstrutura {

    static var propArmDoTipo = "Algum valor."
    
    static var propCompDoTipo: Int {
    
       return 1
    
    }
}

class umaClasse {

    class var propCompDoTipo: Int {
    
    return 1
    
    }
}


umaClasse.propCompDoTipo

umaEstrutura.propArmDoTipo

umaEstrutura.propArmDoTipo = "Outro valor."

umaEstrutura.propArmDoTipo





