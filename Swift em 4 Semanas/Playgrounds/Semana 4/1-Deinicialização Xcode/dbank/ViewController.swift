//
//  ViewController.swift
//  dBank
//
//  Created by Fabio Santos on 16/01/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runGame()
    }
    
    func runGame() {
    
        println("Moedas no Banco: \(Banco.moedasCofre)")
        
        // adiciona 1000 moedas se estiverem disponiveis
        
        var jogadorUm: Jogador? = Jogador(moedas: 100)

        println("Novo jogador acaba de entrar com \(jogadorUm!.moedasNaCarteira) moedas")
        
        println("Moedas no Banco: \(Banco.moedasCofre)")
        
        
        // Segunda Parte 
        
        println("*------ Segunda Parte: Jogador fatura 2000 moedas -------*")
        
        jogadorUm!.ganhaMoedas(2_000)
        
        println("Moedas do Jogador:\(jogadorUm!.moedasNaCarteira)")
        
        println("Moedas no Banco: \(Banco.moedasCofre)")
        
        
        // Terceira Parte
        
        println("*------ Terceira Parte: Jogador resolve partir -------*")
        
        jogadorUm = nil
        
        println("JogadorUm deixou o jogo...")
        
        println("Moedas no Banco: \(Banco.moedasCofre)")
    
    }
}

