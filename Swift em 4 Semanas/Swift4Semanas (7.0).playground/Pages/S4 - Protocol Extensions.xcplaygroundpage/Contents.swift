/*: 

[Anterior: Optional Chaining](@previous)

---

Caso precise revisar extensions e protocolos:

[Extensions](Extensions)

---

[Protocolos](Protocolos)

*/

//Em Swift 2.0 é possível extender um protocolo para implementar um de seus requerimentos ou para implementar funcionalidades adicionais que tipos que estão em conformidade com o protocolo podem tirar vantagem.



//Antes:

//O protocolo apenas possuia a assinatura dos métodos e propriedades, e quem tinha que implementá-los era o tipo que fôsse adotá-lo.

protocol Comportamento {
    
    var vida: Int { get }
    
    var podeLançarProjétil: Bool { get }
    
    mutating func disparaProjétil()
    
}

//No exemplo abaixo, a implmentação fica a cargo das classes que vão adotar o protolo Comportamento

//No entanto, mesmo que a implementação fosse idêntica em todos os tipos que adotam o protocolo, era necessário replicar a implementação. Isso para manutenções futuras no código, se tornava algo bem tedioso.

//class MonstroRank1: Comportamento {
//
//    var vida = 400
//
//    var podeLançarProjétil = true
//
//    func disparaProjétil() {
//
//        if podeLançarProjétil == true {
//
//            "Dano de Projétil == 6"
//
//        } else {
//
//            "Dano Corpo a Corpo == 3"
//
//        }
//
//    }
//
//}
//
//
//class MonstroRank2: Comportamento {
//
//    var vida = 500
//
//    var podeLançarProjétil = true
//
//    func disparaProjétil() {
//
//        if podeLançarProjétil == true {
//
//            "Dano de Projétil == 6"
//
//        } else {
//
//            "Dano Corpo a Corpo == 3"
//
//        }
//
//    }
//
//}


//Solução Antiga:

//Uma solução para o problema acima, era usar uma classe base, ao invés de um protocolo, essa classe base nunca seria inicializada, apenas as suas subclasses. Nisso já tinhamos que construir pelo menos um nível de herança e trablhar obrigatoriamente com tipos de referência (classes).

//class Monstro {
//
//    var vida: Int
//
//    var podeLançarProjétil: Bool
//
//    func disparaProjétil() {
//
//        if podeLançarProjétil == true {
//
//            "Dano de Projétil == 6"
//
//        } else {
//
//            "Dano Corpo a Corpo == 3"
//
//        }
//
//    }
//
//    init(vida: Int, podeLançarProjétil: Bool) {
//
//        self.vida = vida
//        self.podeLançarProjétil = podeLançarProjétil
//
//    }
//
//}
//
//class MonstroRank1: Monstro {
//
//
//     init() {
//
//        super.init(vida: 400, podeLançarProjétil: true)
//
//     }
//
//
//}
//
//
//class MonstroRank2: Monstro {
//
//    var podeAssimilar: Bool
//
//    init(podeAssimilar: Bool) {
//
//        self.podeAssimilar = podeAssimilar
//        super.init(vida: 500, podeLançarProjétil: true)
//
//
//    }
//
//}
//
//var monstro1 = MonstroRank2(podeAssimilar: true)
//var monstro2 = MonstroRank2(podeAssimilar: false)

////Aqui estamos passando uma referência, e não uma cópia dos valores

//monstro1 = monstro2
//
//monstro1.vida = 100

////veja que a vida do monstro 2 foi alterada também

//monstro2.vida


//Solução Nova:

//Agora com Protocol Extensions, podemos extender o protocolo e fornecer uma implementação padrão para seus métodos e propriedades que vão ser automaticamente fornecidas para os tipos que adotem esse protocolo. Com isso, podemos substituir a classe base que criamos acima por um protocolo, colocar a implementação do método na extensions desse protocolo e trocar as subsclasses por estruturas. Assim, podemos trabalhar com tipos de valor (estruturas ou enums)

extension Comportamento {
    
    mutating func disparaProjétil() {
        
        if podeLançarProjétil == true {
            
            "Dano de Projétil == 6"
            
        } else {
            
            "Dano Corpo a Corpo == 3"
            
        }
        
    }
    
}

struct MonstroRank1: Comportamento {
    
    var vida = 400
    
    var podeLançarProjétil: Bool
    
    init(podeLançarProjétil: Bool) {
        
        self.podeLançarProjétil = podeLançarProjétil
        
    }
    
}

struct MonstroRank2: Comportamento {
    
    var podeAssimilar: Bool
    
    var vida = 500
    
    var podeLançarProjétil: Bool
    
    init(podeAssimilar: Bool, podeLançarProjétil: Bool) {
        
        self.podeAssimilar = podeAssimilar
        self.podeLançarProjétil = podeLançarProjétil
        
    }
    
}

//Se não quisermos usar a implementação padrão fornecida pela extensão do protocolo, podemos criar uma nova para o tipo em questão. Dessa forma, swift vai considerar apenas a existência da implementação do método que está no tipo. Não precisando assim, usar o termo override já que não trabalhamos com herança.

struct MonstroRank3: Comportamento {
    
    var vida = 300
    
    var podeLançarProjétil = true
    
    mutating func disparaProjétil() {
        
        if podeLançarProjétil == true {
            
            "Dano de Projétil == 3"
            
        } else {
            
            "Dano Corpo a Corpo == 10"
            
        }
        
    }
    
}

//Vantagens de se trabalhar com tipo de valor:

//Ao criar o monstro que possui a habilidade de assimilar outro, ele cria uma cópia no momento da atribuição, sem interferir nas características do monstro o qual ele está assimilando

var monstro1 = MonstroRank2(podeAssimilar: true, podeLançarProjétil: true)
var monstro2 = MonstroRank2(podeAssimilar: false, podeLançarProjétil: false)

monstro1 = monstro2

monstro1.vida = 200

//veja que a vida do monstro 2 permanece intática

monstro2.vida

var monstro3 = MonstroRank3()

//Usando a implementação que foi definida no próprio tipo

monstro3.disparaProjétil()

//Além de todas essas vantagens, um mesmo tipo pode adotar vários protocolos, o que não contece com herança, pois uma classe só pode herdar de uma única outra classe.

protocol Voa {
    
    //Assinatura dos requerimentos
    
}

protocol Som {
    
    //Assinatura dos requerimentos
    
}

extension Voa {
    
    //Implementação padrão dos requerimentos
    
}

extension Som {
    
    //Implementação padrão dos requerimentos

    
}

struct Ave: Som, Voa {
    
    //Implementação de características mais específicas
    
}

//-------------------//

//Impactos na Biblioteca de Swift:

let numeros = [3,1,10,4,6]

//Para não ter que ficar reimplementando filter, sorted, map em todas as classes, estruturas ou enumeracoes que adotassem os protocolos CollectionType, a Apple criava filter,sorted, map ... como funções genéricas globais que funcionavam apenas com tipos que adotassem certos protocolos. (generics with type Constraints)

//filter(sorted(numeros){$0 < $1}){$0 % 2 == 0}

var numerosOrdenados = numeros.sort{$0 < $1}

numerosOrdenados

//Agora com protocol extensions sort,map,filter,... possuem implementacoes padroes em extensoes do protocole ColletionType, logo todo tipo que adotar esse protocolo como Array, vão ter esses métodos como sendo deles automaticamente.

var numerosOrdenadosEFiltrados = numeros.sort{$0 < $1}.filter{$0 % 2 == 0}

numerosOrdenadosEFiltrados



