//: [Anterior: Type Casting](@previous)

//Funções ou métodos que retornam nulo transmitem incerteza

//struct Carteira {
//
//    var moedas = 0
//    let capacidade = 1000
//
//    mutating func adicionaMoedas(qnt: Int) -> Int? {
//
//        if (moedas + qnt) >= capacidade {
//
//            return nil
//
//        }
//
//        moedas += qnt
//        return moedas
//
//    }
//
//    mutating func depositaMoedas(qnt: Int) -> Int? {
//
//        if qnt > moedas {
//
//            return nil
//
//        }
//
//        moedas -= qnt
//        return moedas
//
//    }
//
//}
//
//
//var carteira = Carteira()

////Não conseguimos idenficar a natureza de cada erro

//carteira.depositaMoedas(10)
//carteira.adicionaMoedas(1001)


//Usando Tratamento de Erros

// O Primeiro passo é criar uma enumeração que vai adotar o protocolo ErrorType. Este protocolo indica que os tipos que o adotam podem ser usados para tratar erros pelo código.

enum CarteiraErros: ErrorType {
    
    case ExcedeuCapacidade
    case SemMoedasSuficientes
    
}

struct Carteira {
    
    var moedas = 0
    let capacidade = 1000
    
    //Para indicar que um métodos pode lançar um erro durante sua execução, usamos a palavra 'throws' entre seus parâmetros e retorno.
    
    mutating func adicionaMoedas(qnt: Int) throws -> Int {
        
        //Quando houver a condição de erro (que antes retornava nil), lançamos o erro, usando a palavra 'throw'
        
        if (moedas + qnt) >= capacidade {
            
            throw CarteiraErros.ExcedeuCapacidade
            
        }
        
        moedas += qnt
        return moedas
        
    }
    
    mutating func depositaMoedas(qnt: Int) throws -> Int {
        
        if qnt > moedas {
            
            throw CarteiraErros.SemMoedasSuficientes
            
        }
        
        moedas -= qnt
        return moedas
        
    }
    
}

//Agora precisamos ter uma forma de capturar esse erro pelo código.

var carteira = Carteira()

//Primeiro precisaremos criar um escopo, faremos isso usando 'do { }'

do {
    
    //Dentro desse novo escopo, vamos tentar ('try'), usar o método que pode lançar algum tipo de erro
    
    try carteira.depositaMoedas(10)
    
    //Caso um erro seja disparado, precisamos capturá-lo ('catch')
    
} catch {
    
    //Automaticamente, Swift já nos fornece uma constante ('error') que é do tipo ErrorType, ou seja, error pode ser qualquer objeto/instância do tipo que adoto o protocolo ErrorType, nesse caso, um objeto do tipo CarteiraErros.
    
    print(error)
    
}


//Também podemos capturar o erro explicitamente

do {
    
    try carteira.depositaMoedas(10)
    
} catch CarteiraErros.SemMoedasSuficientes {
    
    print("Não há moedas suficientes")
    
}

//Vamos a mais um exemplo:

//Enums são perfeitas para tratar erros, pois elas permitem definir tipos associados que vão nos trazer mais informação sobre um determinado erro

enum MáquinaDeVendasErro: ErrorType {
   
    case SeleçãoInválida
    case MoedasInsuficientes(moedasNecessárias: Int)
    case NãoTemNoEstoque
    
}

//Vamos criar a estrutura Item que vai servir de molde para criar os itens da maquina de vendas

struct Item {
    
    var preço: Int
    var qnt: Int
    
}

//Aqui temos a classe que vai representar a nossa máquina de vendas

class MáquinaDeVendas {
    
    //Um dicionário onde cada valor de cada chave é um objeto/instância de Item.
    
    var inventário = [
        
        "Barra De Chocolate": Item(preço: 12, qnt: 7),
        "Batata": Item(preço: 10, qnt: 4),
        "Pretzels": Item(preço: 7, qnt: 11)
        
    ]
    
    var moedasDepositadas = 0
    
    func dispenseSnack(snack: String) {
        
        print("Dispensing \(snack)")
        
    }
    
    //A máquina de vendas possui um método vender que pode lançar 3 erros diferentes, imagine se estivéssemos usando nil como retorno para os 3 erros, seria difícil identificar depois de qual erro foi proveniente o nil.
    
    func vender(nome: String) throws {
        
        guard var item = inventário[nome] else {
            
            throw MáquinaDeVendasErro.SeleçãoInválida
            
        }
        
        guard item.qnt > 0 else {
            
            throw MáquinaDeVendasErro.NãoTemNoEstoque
            
        }
        
        guard item.preço <= moedasDepositadas else {
            
            throw MáquinaDeVendasErro.MoedasInsuficientes(moedasNecessárias: item.preço - moedasDepositadas)
            
        }
        
        moedasDepositadas -= item.preço
        --item.qnt
        inventário[nome] = item
        
        dispenseSnack(nome)
        
    }
    
}

let favoriteSnacks = [
    "João": "Batata",
    "Rafael": "Bala",
    "Lucas": "Pretzels",
]

func comprar(pessoa: String, máquinaDeVendas: MáquinaDeVendas) throws {
    
    let nomeDoItem = favoriteSnacks[pessoa] ?? "Barra de Chocolate"
    
    try máquinaDeVendas.vender(nomeDoItem)
}

//Vamos instanciar a nossa máquina de vendas

var máquinaDeVendas = MáquinaDeVendas()

máquinaDeVendas.moedasDepositadas = 8

do {
    
    try comprar("João", máquinaDeVendas: máquinaDeVendas)
    
} catch MáquinaDeVendasErro.SeleçãoInválida {
    
    print("Seleção inválida")
    
} catch MáquinaDeVendasErro.NãoTemNoEstoque {
    
    print("Não tem no estoque")
    
} catch MáquinaDeVendasErro.MoedasInsuficientes(let moedasNecessárias) {
    
    //Por causa dos tipos associdados, podemos fácilmente extrair as moédas que faltam para a pessoa fornecer
    
    print("Moedas insuficientes. Insira mais \(moedasNecessárias) moedas.")
    
}



//: [Próximo: Deinicialização](@next)
