//
//  SettingsTableViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 04/07/15.
//  Copyright © 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

class SocialTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
    //Coleção de IBOutlets -> Reduz a quantidade de linhas de código
    ///Guarda as células estáticas do tableView dessa View definidas na storyboard
    @IBOutlet var collectionOfCells: [UITableViewCell]!
    
    //Informação que será enviada para a cena seguinte (NavWebView)
    
    ///Armazena a request disparada ao clicar em algumas das céulas do tableView dessa View
    var request: NSURLRequest!
    
    //MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "MobGeekLogo.jpg"), forBarMetrics: .Default)
        
        //Dando um título á barra de navegação da cena atual

        self.navigationItem.title = "Social"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view data source

    ///Chamado quando alguma célula é selecionada pelo usuário
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        switch cell! {
            
        case collectionOfCells[0]:   //twitter
            
            request = NSURLRequest(URL: NSURL(string: "https://twitter.com/mobgeekbrasil")!)
            
        case collectionOfCells[1]:   //facebook
            
            request = NSURLRequest(URL: NSURL(string: "https://www.facebook.com/groups/Swiftem4semanas/")!)
            
        case collectionOfCells[2]:   //discourse
            
            request = NSURLRequest(URL: NSURL(string: "http://comunidade.mobgeek.com.br")!)

        case collectionOfCells[3]:   //email
            
            //Redirecionando para o app nativo *mail*
            
            UIApplication.sharedApplication().openURL(NSURL(string: "mailto:contato@mobgeek.com.br")!)
            
            //Enquanto não implementar a feature de enviar email dentro do App, será precisar retirar a seleção da célula de email por aqui, pois o viewWillAppear não detecta quando o App volta do email.
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            return   //Para não disparar a segue
            
        case collectionOfCells[4]:   //livro swift
            
            //Redirecionando para o App nativo *ibooks*
            
            UIApplication.sharedApplication().openURL(NSURL(string: "ibooks://itunes.apple.com/us/book/swift-programming-language/id881256329?mt=11")!)
            
            //Enquanto não implementar a feature de enviar email dentro do App, será precisar retirar a seleção da célula de email por aqui, pois o viewWillAppear não detecta quando o App volta do email.
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            return   //Para não disparar a segue
            
        default:
            break
            
        }

    performSegueWithIdentifier("SocialToNavSegue", sender: self)
        
    }
    
    //MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Como existe um navigationController entre esta cena e a próxima, é preciso dizer primeiro que terá que passar pelo navigationController para depois ver a cena a qual ele leva.
        
        let newNC = segue.destinationViewController as! UINavigationController
        let newVC = newNC.topViewController as! NavWebViewController
        
        //Passando a request capturada quando o usuário selecionou alguma célula
        
        newVC.request = request
        
    }
    
    ///Vamos customizar estaticamente o tableView direto na storyboard, por isso não foi preciso utilizar os métodos de retornar a quantidade de linhas e de linhas por seção da table View
 

}
