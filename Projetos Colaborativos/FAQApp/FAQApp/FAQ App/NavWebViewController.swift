//
//  NewWebViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 02/07/15.
//  Copyright © 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

class NavWebViewController: CustomViewController, UIWebViewDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    //MARK: Constants & Variables
    
    //Informação trazida da cena anterior (pode vir tanto do FileWebView quanto do SocialTableView)
    
    var request: NSURLRequest!
    
    //MARK: - Actions
    
    ///Fecha essa view, retornando para a anterior
    @IBAction func close(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    ///Volta uma pagina na web
    @IBAction func goPreviousPage(sender: AnyObject) {
        
        webView.goBack()
        
    }
    
    ///Avança uma página na web
    @IBAction func goNextPage(sender: UIBarButtonItem) {
        
        webView.goForward()
        
    }
    
    //MARK: - UIWebViewDelegate methods
    
    ///Chamado quando a webView termina de carregar algum contúdo. Está sendo usado para saber quando habilita ou desabilita os botões anterior e próximo. *PROBLEMA: NAO ESTA FUNCIONANDO PARA O SITE DO DISCOURSE*
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        backButton.enabled = webView.canGoBack
        nextButton.enabled = webView.canGoForward
        
    }
    
    ///Chamado quando o webview falha ao carregar algum conteúdo
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        //Usando a gambiarra pra testar conexão do usuário com a internet
        if !checkForInternet() {
            
            backButton.enabled = false
            nextButton.enabled = false
            
            self.presentViewController(createNoInternetAlert(), animated: true, completion: nil)
            return
            
        }
        
        //A implementação baixo foi comentada, pois sempre que clica no botão Anterior antes da pagina ter aberto, gera um erro. :/
        
        //        if let erro = error {
        //
        //            print(erro)
        //            self.presentViewController(createSiteOfflineAlert(), animated: true, completion: nil)
        //
        //        }
        
    }
    
    ///Sempre chamado quando a view reaparece durante a execução do App. Tudo definido dentro desse método já será padrão para todo tableViewController.
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)   //chama as implementações de viewWillAppear das superClasses
        
        //Agora acrescenta nova funcionalidades especificas para essa cena
        
        backButton.enabled = false
        nextButton.enabled = false
        
    }
    
    //MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.scrollView.delegate = self
        
        //Já que existe um novo navigationController foi perciso "settar" o logo da baleia de novo
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "MobGeekLogo.jpg"), forBarMetrics: .Default)
        
        //Dando um título á barra de navegação da cena atual
        
        self.navigationItem.title = "Navegador"
        
        //Realizando os ajustes na interface (idem aos da cena anterior)
        
        webView.clipsToBounds = false
        webView.scrollView.clipsToBounds = false
        self.automaticallyAdjustsScrollViewInsets = false
        webView.scalesPageToFit = true
        
        //Carrega a request para algum site nesse webView
        
        webView.loadRequest(request)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}