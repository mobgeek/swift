//
//  WebViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit
import Parse

class FileWebViewController: CustomViewController, UIWebViewDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var webView: UIWebView!
    
    //MARK: - Constants & Variables
    
    //Informação que poder ser passada pra próxima cena
    ///Armazena a request disparada na interface ao clicar em um link
    var request: NSURLRequest!
    
    //Informação recebida da cena anterior
    ///Armazena o arquivo e sua extensão referentes a pergunta selecionada pelo usuário
    var answer: (file:PFFile, ext:String)!
    
    //MARK: - Custom methods
    
    ///Carrega o arquvivo no webView
    func loadFile() {
        
        //PFFile's guardam referências para o conteúdo de arquivos armazenados no Parse, mesmo tendo instâncias de PFFile armazendas no LDS, é preciso que pelo menos uma vez seja baixado o seu conteúdo. Por isso há a necessidade de verificar se é a primeira vez que o usuário está tentando visualizar o arquivo no device, se ele estiver com internet o getData() retornará os dados do arquivo e estes serão atualizados localmente, se ele estiver sem internet manda um alerta. Nas próximas vezes ele não precisará estar conectado a internet para ver o arquivo ;)
        
        //Quando se trata de NSData, o mínino de comparações, atribuições e carregamento de dados que pudermos fazer com eles é melhor. Logo, ao invés de usar Optional Binding, vamos apenas comparar com nil. Caso contrário seria feita uma atribuição a uma constante e em seguida seria carregado seu conteúdo, isso faria com que o arquivo demorasse a carregar para o usuário.
        
        guard answer.file.getData() != nil else {
            
            let alert = createNoFileAlert()
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
            
        }
        
        //Carregando o "arquivo" offline, fornecendo um MIME que repsenta o tipo do arquivo. Aqui foram usados os MIMEs da Microsoft para os arquivos docx e pptx.
        
        switch answer.ext {
            
        case "docx":
            
            webView.loadData(answer.file.getData()!, MIMEType: "application/vnd.openxmlformats-officedocument.wordprocessingml.document", textEncodingName: "UTF-8", baseURL: NSURL())
            
        case "pptx":
            
            webView.loadData(answer.file.getData()!, MIMEType: "application/vnd.openxmlformats-officedocument.presentationml.presentation", textEncodingName: "UTF-8", baseURL: NSURL())
            
        default:
            
            webView.loadHTMLString("<h1><center>FORMATO NAO SUPORTADO</center></h1>", baseURL: nil)
            
        }
        
        //Para outros MIMEs:
        //Microsoft:https://filext.com/faq/office_mime_types.php
        //https://en.wikipedia.org/wiki/Internet_media_type
        
    }
    
    ///Cria um alerta para ser disparado quando o usuário tenta vizualizar algum arquivo pela primeira vez.
    func createNoFileAlert() -> UIAlertController {
        
        ///Alerta para ser mostrado na falta de internet
        let noFileAlert = UIAlertController(title: "Falha no Carregamento", message: "Vizualizando esta resposta pela primeira vez? Conecte-se a internet para baixá-la =)", preferredStyle: .Alert)
        
        let actionOK = UIAlertAction(title: "Ok", style: .Default) { _ in}
        
        noFileAlert.addAction(actionOK)
        
        return noFileAlert
        
    }

    //MARK: - UIWebViewDelegate methods

   ///Chamdo quando algum link é pressinado no webView, gerando assim, uma request
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest,navigationType: UIWebViewNavigationType) -> Bool {

        //Se o caminho para a URL não existir (nil) habilita carregamento de requests nesta webView para que ao girar o device seja possível recarregar os dados do arquivo na interface. Se não fizermos isso, ao girar o device o dispositivo irá para a cena seguinte.
        
        guard request.URL?.path != nil else {
            
            return true

        }
        
        //Armazenando a request disparada nesse webView para depois passar para a cena seguinte
        self.request = request
        
        //Dispara a segue para a cena seguinte
        performSegueWithIdentifier("FileToNavSegue", sender: nil)
    
        //Retorna falso para que o link pressionado não seja carregado nessa webView de arquivos
        return false
            
    }
    
    //MARK: - UIViewController methods

    ///Chamado sempre que o device muda a orientação (vertical ou horizontal)
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        //Fazendo uma requisição vazia para limpar os dados atuais no webview e em seguida recarregar o arquivo
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "about:blank")!))
        
        //Aqui está a segunda gambiarra, quando mudávamos a orientação do dispositivo, a tela não se ajustava corretamente se usássemos o gesto de pinça. Solução simples, recarregar o arquivo quando o device mudar a orientação.
        
        loadFile()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Para fazer com que as implementações de métodos do UIScrollViewDelegate surtam efeito, é preciso fazer com que a scrollView do nosso webView seja o delegate para o qual os métodos de UIScrollViewDelegate vão mandar as mensagens.
        
        self.webView.scrollView.delegate = self
                
        //Dando um título á barra de navegação da cena atual

        self.navigationItem.title = "Resposta"
        
        //Para arquivos *RTF* não é preciso usar scalesPageToFit e o UIWebView na storyboard deve ser totalmente esticado para os lados. (Lembrar de reajustar o autolayout)
        
        //Para arquivos docx, pptx, xlsx, pdf, .... basta fazer os seguintes ajustes:
        
        webView.clipsToBounds = false
        webView.scrollView.clipsToBounds = false
        self.automaticallyAdjustsScrollViewInsets = false
        webView.scalesPageToFit = true
        
        //Carrega o arquivo no webView
        
        loadFile()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Como existe um navigationController entre esta cena e a próxima, é preciso dizer primeiro que terá que passar pelo navigationController para depois ver a cena a qual ele leva.
        
        let newNC = segue.destinationViewController as! UINavigationController
        let newVC = newNC.topViewController as! NavWebViewController

        //Passa a request capturada no webView(:shouldStartLoadWithRequest) para a cena seguinte
        
        newVC.request = request
        
    }
    
}
