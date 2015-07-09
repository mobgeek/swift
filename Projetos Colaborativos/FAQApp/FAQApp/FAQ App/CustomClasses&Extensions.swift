//
//  CustomClasses:Extensions.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 07/07/15.
//  Copyright © 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

//Este arquivo contém extensões e classes customizadas com o intuito de contralizar implementações padrões de métodos que são utilizadas pelas classes das cenas ao longo do programa.

//Dessa forma, não precisamos, por exemplo, criar para todas as tableViews do código, uma implementação de viewWillAppear que retira a seleção das células ao voltar para alguma cena.

//Um outro exemplo é o do scrollView. Todas as cenas no App lidam com scrollView. E existe uma funcionalidade no App que esconde a barra inferior quando a tela é arrastada para cima, e quem nos ajuda a implementar isso é o protocolo UIScrollViewDelegate. Imagina termos que para cada arquivo de cada view recriar as mesmas implementacões para os métodos desse protocolo, seria praticamente crtl+C e crtl+V, tornando o código muito grande.

//SubClassing e Extensions nos ajudam a resolver esses problemas


///Registra as coordenadas de onde o scrollView está parado antes de iniciar a rolagem
var currentPoint = CGPoint(x: 0, y: 0)

///Extensão da classe UIViewController para que ela passe a adotar o protocolo UIScrollViewDelegate e já possua 2 implementações de 2 métodos desse protocolo. Assim, toda classe que for subClasse de UIViewController, já estará em conformidade com o protocolo UIScrollViewDelegate, além de herdar essas 2 implementações de métodos.

extension UIViewController: UIScrollViewDelegate {
    
    ///Armazena o tipo de barra da view atual
    var bar: UIView? {
        
        //Verifica se é uma tabBar (de um tabBarController) ou uma ToolBar (de um Navigation Controller) que está presente na view. Para isso usamos Optional Chaining para verificar se o acnestral mais próximo é uma tabBarController ou um navigationController.
        
        get { return self.tabBarController?.tabBar ?? self.navigationController?.toolbar }
        
    }
    
    ///Sempre que o usuário estiver prestes a arrastar a scrollView, vai pegar o posicionamento dela na interface.
    
    public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        currentPoint = scrollView.contentOffset
        print("currentPoint: \(currentPoint.y)")
        
    }
    
    ///Sempre que a scrollView estiver em movimento, verifica se foi para cima ou para baixo
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        
        print("scrollView: \(scrollView.contentOffset.y)")
        
        //Se está na origem, não precisa realizar as comparações seguintes, deixando a barra sempre visível.
        
        if currentPoint.y == 0 {
            
            //bar == tabBar OU bar == toolBar
            
            bar?.hidden = false
            return
        }
        
        //Lembrando de plano cartesiano da matemática, y são as direção para cima ou para baixo.
        
        //(1) Caso a scrollView seja arrastado para baixo, vai verificar que o y dela é menor que o y do ponto quando ele estava parado. Então, mostra a barra inferior.
        
        //(2) Caso o scrollView seja arrastado para cima, vai verificar que o y dele é maior que o y de ponto quando ele estava parado. Então, esconde a barra inferior, pois o usuário está interessado em ler o conteúdo mais abaixo.
        
        if (scrollView.contentOffset.y < currentPoint.y) { //(1)
            
            bar?.hidden = false
            
            
        } else if (scrollView.contentOffset.y > currentPoint.y) { //(2)
            
            bar?.hidden = true
            
        }
        
        
    }
    
}

///Classe customizada que herda todas as caracteristicas e funcionalidades de UIViewController que vai fornecer, a principio, uma implementação padrão para viewWillAppear para todos as classes que herdarem dela. Foi preciso fazer esse subClassing pois essa era uma forma de poder sobrescrever o método viewWillAppear de UIViewController

class CustomViewController: UIViewController {
    
    ///Sempre chamado quando a view reaparece durante a execução do App. Tudo definido dentro desse método já será padrão para todo tableViewController. A principio vamos usar esse método para (1) fazer com que a barra inferior reapareça e (2) resetar as coordenadas do ponto atual da scrollView
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //(1)
        //Como essa classe é subClasse de UIViewController, a propriedade bar foi herdade por essa classe ;)
        
        bar?.hidden = false
        
        //(2)
        //Reseta o ponto atual para a origem
        
        currentPoint.x = 0
        currentPoint.y = 0
        
    }
    
}

///Extensão para a classe UITableViewController. Como essa classe já possui uma superClasse definida pela Apple, a UIViewController, UITableViewController já herdou todos os métodos de UIScrollViewDelegate implementados pela extensão que fizemos anteriormente para UIViewController. Dentro dessa extensão é fornecida uma implementação de viewWillAppear para a classe UITableViewController que está sobreescrevendo a da superClasse UIViewController adcionando novas funcionalidades.

extension UITableViewController {
    
    ///Sempre chamado quando a view reaparece durante a execução do App. 
    ///Tudo definido dentro desse método já será padrão para todo tableViewController. A principio vamos usar esse método para (1) tirar a seleção da célula quando voltarmos para a view que nos levou para a view seguinte, (2) fazer com que a barra inferior reapareça e (3) resetar as coordenadas do ponto atual do scrollView
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Se estiver iniciando o App, não é desejado que desempacote nulo, por isso o Optional Binding
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            //(1)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        
        //(2)
        //Como essa classe é subClasse de UIViewController, a propriedade bar foi herdada por essa classe ;)
        bar?.hidden = false
        
        //(3)
        currentPoint.x = 0
        currentPoint.y = 0
        
    }
    
}








