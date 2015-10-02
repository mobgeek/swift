//: [Anterior: Extensions](@previous)

// Playground - noun: a place where people can play

import UIKit

//Generics

//Funções Genéricas

func permutaDoisInts(inout a: Int, inout _ b: Int) {
    
    let aTemporário = a
    
    a = b
    
    b = aTemporário
    
}

var umInt = 5

var outroInt = 346

permutaDoisInts(&umInt, &outroInt)

umInt

func permutaDoisStrings(inout a: String, inout b: String) {
    
    let aTemporário = a
    
    a = b
    
    b = aTemporário
}

func permutaDoisValores<T>(inout a: T, inout _ b: T) {
    
    //T representa um tipo qualquer
    
    // T: um espaço reservado para o tipo. Ele não diz nada sobre o tipo, mas já podemos constatar que tanto a e b precisam ser do mesmo tipo, não importa o que tipo T representa. O tipo T só será determinado quando essa função for chamada.
    
    // Os símbolos <> dizem para o Swift que T é um espaço reservado dentro da definição da função permutaDoisValores e, por isso, Swift não busca por um tipo chamado T.
    
    
    let aTemporário = a
    
    a = b
    
    b = aTemporário
    
}

umInt

permutaDoisValores(&umInt, &outroInt)   //T será Int

umInt


var umString = "Oi!"

var outroString = "Tudo bem?"

permutaDoisValores(&umString, &outroString)   //T será String

outroString


// Tipos Genéricos

enum ValorOpcional<T> {
    
    case Nenhum
    case Algum(T)
    
}

var possívelInteiro: ValorOpcional<Int> = .Nenhum
possívelInteiro = .Algum(50)

var possívelString: ValorOpcional<String> = .Nenhum
possívelString = .Algum("Oi")


struct Pilha<T> {
    
    var itens = [T]()
    
    mutating func empilha(item: T) {
        
        itens.append(item)
        
    }
    
    mutating func desempilha() -> T {
        
        return itens.removeLast()
        
    }
    
}

var pilhaDeInteiros = Pilha(itens: [1,2,3])   //Swift infere que a variável é do tipo Pilha<Int>

pilhaDeInteiros.empilha(4)
pilhaDeInteiros.desempilha()
pilhaDeInteiros


//Type Constraints

class UmaClasse {}
protocol UmProtocolo {}

func umaFunção<T: UmaClasse, U: UmProtocolo>(algumT: T, algumU: U) {
    
    //algumT deve ser de um tipo T que deve ser uma subclasse de UmaClasse
    //algumU deve ser de um tipo U que deve estar em conformidade com UmProtocolo
    
}

// Ex.: Dictionary<Key: Hashable, Valeu>


// Tipos Associados

protocol Container {
    
    typealias TipoItem   //O tipo só será especificado quando esse protocolo for adotado
    
    mutating func insere(item: TipoItem)
    
    var count: Int { get }
    
    subscript(i: Int) -> TipoItem { get }
    
}


struct umaEstrutura<U>: Container {
    
    //typealias TipoItem = U   //especifica o tipo apropriado
    
    var itens = [U]()
    
    //Não é preciso especificar o tipo explicitamente. Assim que essa estrutura estiver em conformidade com o protocolo Container, Swift inferirá o tipo T que no caso será um tipo genérico U.
    
    mutating func insere(item: U) {
        
        itens.append(item)
        
    }
    
    var count: Int {
        
        return itens.count
        
    }
    
    subscript(i:Int) -> U {
        
        return itens[i]
        
    }
    
}


// Cláusula Where

func todosOsItensCombinam<C1: Container, C2: Container where C1.TipoItem == C2.TipoItem, C1.TipoItem: Equatable>(umContainer: C1, _ outroContainer: C2) -> Bool {
    
    //Os tipos C1 e C2 são espaços reservados para os tipos dos containers quando a função for chamada.
    
    // Resumindo o que cada uma dessas exigências significam: umContainer é um container de tipo C1. outroContainer é um container do tipo C2. umContainer e outroContainer contém o mesmo tipo de itens. Os itens em outroContainer podem ser comparados com o operador “not equal” (!=) a fim de descobrir se eles são diferentes um do outro, porque o tipo TipoItem dos itens deve estar de acordo com o protocolo Equatable.
    
    //Verifica se a quantidade de itens nos Containers são iguais
    
    if umContainer.count != outroContainer.count {
        
        return false
        
    }
    
    //Verifica se os itens são iguais e estão na mesma ordem
    
    for i in 0..<umContainer.count {
        
        if umContainer[i] != outroContainer[i] {
            
            return false
            
        }
        
    }
    
    // se todos itens são iguais, retorna true. Se o loop termina sem encontrar um elemento diferente, os dois containers são correspondentes e a função retorna true.
    
    return true
    
}

//Criando diferentes instâncias de UmaEstrutura

var container = umaEstrutura(itens: [1,2,3])
var outroContainer = umaEstrutura(itens: ["item1","item2"])
var containerInteiros = umaEstrutura(itens: [1,2,3])

//todosOsItensCombinam(container, outroContainer)   //erro, os itens de container são de um tipo diferente dos itens de outroContainer

todosOsItensCombinam(container, containerInteiros)

//: [Próximo: Optional Chaining](@next)
