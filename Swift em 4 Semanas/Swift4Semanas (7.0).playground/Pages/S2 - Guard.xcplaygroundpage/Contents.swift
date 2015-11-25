//: [Anterior: Funções](@previous)

import UIKit

//O guard, assim como o if, verifica se uma expressão é verdadeira ou falsa. Se for verdadeira (true), retorna a execução para o escopo externo ao guard, caso seja falso (false), o fluxo de execução é direcionado para dentro do escopo do guard para sair da função.


func saudações(pessoa: [String: String]) {
    
    //Assim como o Optional Binding realizado pelo 'if let', é possível fazê-lo através do 'guard let' sendo que a constante criada poderá ser utilizada fora do escopo do guard
    
    guard let nome = pessoa["nome"] else {
        
        //dentro de um guard, precisaremos sempre ter uma estrutura de transferência de controle que permita sair do escopo externo ao guard (break ou return)
        
        return
        
    }
    
    print("Olá \(nome)!")
    
    
    guard let local = pessoa["local"] else {
        
        print("O clima parece estar bom perto de você")
        
        return
        
    }
    
    print("O clima parece estar bom em \(local).")
}

saudações(["nome": "pedro"])

saudações(["nome": "kátia", "local": "Cupertino"])





//: [Próximo: Coleções](@next)
