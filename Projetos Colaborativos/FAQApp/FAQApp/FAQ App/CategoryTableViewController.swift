//
//  CategoryTableViewController.swift
//  
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//
//

import UIKit
import Parse

class CategoryTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Outlets

    @IBOutlet weak var searchBar: UISearchBar!

    //MARK: - Constants & Variables
    
    ///Objeto que contém os métodos customizados para lidar com dados do Parse
    var parse: ParseClass!
    
    ///Indica se está ocorrendo busca na searchBar
    var isSearching: Bool = false
    
    ///Guarda os resultados filtrados pela searchBar
    var filteredResults: [String] = []
    
    //Informação que será passada pra próxima cena
    ///Guarda o texto da célula que indica a categoria selecionada pelo usuário
    var selectedCategory: String!

    //var spinner: UIActivityIndicatorView!

    ///Usado como ação de um gesto de toque para fechar o teclado
    func hideKeyboard() {
        tableView.endEditing(true)
    }

    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Instanciando o objeto parse assim que a cena é carregada na memória. Agora podemos usar os métodos e propriedades definidos nele.
        
        parse = ParseClass()

        //Como colocar um activity indicator para disparar e fechar no tempo certo? As 3 linhas abaixo criam um.

//        spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
//        spinner.center = self.tableView.center
//        self.tableView.addSubview(self.spinner)
        
        //Criando gesto para fechar o teclado quando o usuário clicar em qualquer área da tableView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("hideKeyboard"))
        tapGesture.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapGesture)
        
        //Mudando a cor de fundo da view para branco, pois se rodar o app no device estará preto por padrão
        
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        //Atualizando a imagem do logo da MobGeek na NavigationBar dos 3 ViewControllers que estão conectados hierarquicamente ao mesmo NavigationController
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "MobGeekLogo.jpg"), forBarMetrics: .Default)
        
        //Dando um título á barra de navegação da cena atual
        
        self.navigationItem.title = "Categorias"
        
        //Dando um nome padrão para ser colocado no searchBar quando enquanto nada é digitado
        
        self.searchBar.placeholder = "Busque por categorias"

        //Verificando se o Local Datastore está vazio (ou seja, se é a primeira vez que usam o App) e caso também esteja sem internet avisa ao usuário através de um alerta
        
        if parse.offlineQuery.countObjects() == 0 && !checkForInternet() {
            
            let alert = createNoInternetAlert()
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if parse.offlineQuery.countObjects() == 0  {   //Caso seja a primeira vez e tenha conexão
            
            //Pega todos os objetos online e coloca no Local Datastore caso não hajam campos em branco na tabela online
            
            if let onlineObjects = parse.checkForNilFields() {
                
                //Chama o método customizado que copia, de forma segura, os dados localmente
                
                parse.copyLocally(onlineObjects)
            
            }
            
        }
        
        //Atualiza o modelo de dados do App
        
        parse.updateModel()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    ///Verifica por atualizações
    @IBAction func refresh(sender: UIBarButtonItem) {

        //Se não tiver internet, apresenta o alerta e já sai do método
        
        if !checkForInternet() {
            
            let alert = createNoInternetAlert()
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
            
        }
        
        //Criando os botões e definindo suas ações. O botão retry vai chamar o método refresh de novo. Como se o botão fosse disparado sem precisar clicar nele.
        let actionOK = UIAlertAction(title: "Ok", style: .Default) { _ in}
        let actionRetry = UIAlertAction(title: "Retry", style: .Default) { _ in
            
            self.refresh(sender)
            
        }
        
        //Criando os alertas de sucesso, falha e indicação de campos em branco na tabela (ótima forma do usuário reportar um bug) ao sincronizar os dados com Parse
        
        let successAlert = UIAlertController(title: "Novas atualizações", message: "Novas perguntas e respostas foram adiciondas ao App :)", preferredStyle: .Alert)
       
        let failureAlert = UIAlertController(title: "Não há atualizações", message: "Nenhuma alteração recente foi feita", preferredStyle: .Alert)
        
        let nilFieldsAlert = UIAlertController(title: "Existem campos vazios na tabela", message: "Favor entrar em contato conosco: contato@mobgeek.com.br", preferredStyle: .Alert)
 

        //Adicionando os botões e ações aos alertas
        
        successAlert.addAction(actionOK)
        failureAlert.addAction(actionOK)
        failureAlert.addAction(actionRetry)
        nilFieldsAlert.addAction(actionOK)
        
        //Verificando se os dados online (no site) foram modifcados.
        
        if let novosObjetos = parse.checkForNewData() {
            
            //Limpa o rastro de objetos antigos
            
            PFObject.unpinAllObjects()
            
            //Armazena, de forma segura, no Local Datastore, os novos objetos que foram retornados pelo método checkForNewData()

            parse.copyLocally(novosObjetos)

            //Atualiza o medelo (nosso querido dicioário de Array de Tuplas *_*)
            
            parse.updateModel()
            
            //Atualiza os dados na tableView
            
            tableView.reloadData()
            
            //Apresenta o alerta de sucesso
            
            self.presentViewController(successAlert, animated: true, completion: nil)
            
        } else if parse.checkForNilFields() == nil {   //Se saiu do método checkForNewData() pelo fato de ter campos nulos, manda um alerta ao usuário pedindo para entrar em contato conosco
            
            //Diz ao usuário que foram encontrados campos com nil ou "" na tabela
            
            self.presentViewController(nilFieldsAlert, animated: true, completion: nil)
            
        } else {

            //Apresenta o alerta de falha
            
            self.presentViewController(failureAlert, animated: true, completion: nil)
            
        }
        
    }
    
    // MARK: - UISearchBarDelegate methods
    
    ///Sempre é chamado quando o usuário digita algo na barra de busca
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        //Armazenando todas as categorias do dicionário que tem algo a ver com o que foi digitado na barra de busca
        
        filteredResults = dicionário.keys.array.filter({
            
            (categoria: String) -> Bool in
            
            //Verifica se o texto digitado é substring de alguma categoria armazenada no dicionário
            
            let matched = categoria.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            //Se for verdade, armazena a categoria no filteredResults, caso contrário, não
            
            return matched != nil
            
        })
        
        //Se estiver vazia a barra de busca significa que não está ocorrendo busca
        
        if searchBar.text!.isEmpty {
            isSearching = false
        } else {
            isSearching = true
        }
        
        //Atualiza os dados no tablevView conforme vai sendo digitado algo no searchBar
        
        self.tableView.reloadData()
        
    }

    // MARK: - UITableViewDataSource methods

    ///Retorna o número de seções da tabela
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    ///Retorna o número de linhas na seção
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Se o searchBar não estiver vazio, a quantidade de linhas (células) na tableView será correspondente ao total de elementos de filteredResults
        
        if isSearching {
            
            return filteredResults.count
            
        }
        
        //Caso contrário, será correspondente ao total de elementos do dicionário.
        
        return dicionário.count
   
    }

    ///Chamado quando é solicitada a inclusão de algum dado em alguma célula da tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryPrototypeCell", forIndexPath: indexPath)
        
        //Se o searchBar não estiver vazio, carrega no tableView os dados filtrados
        
        if isSearching {
            
            //Talvez possa tirar todos os lowercaseString de todos os sorts pois toda frase ou titulo vai comecar com letra maiuscula, a nao ser que cometamos um erro na hora de colocar novos dados no Parse.
            
            //Armazenando em uma Array as categorias filtradas em ordem alfabética

            let orderedFilter = filteredResults.sort( {$0.lowercaseString < $1.lowercaseString} )
            
            //Atualiza cada célula com as categorias da Array

           cell.textLabel?.text = orderedFilter[indexPath.row]
            
        } else {
            
            //Armazenando em uma Array as categorias do dicionário em ordem alfabética
            
            var orderedCategory = dicionário.keys.array.sort({$0.lowercaseString < $1.lowercaseString})
            
            //Atualiza cada célula com as categorias da Array
            
            cell.textLabel?.text = orderedCategory[indexPath.row]
            
        }

        return cell
    
    }
    
    ///Chamado quando alguma célula é selecionada pelo usuário
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Verifica qual célula foi selecionada e guarda o texto dessa célula (categoria)
    
        selectedCategory = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
        
        //Dispara a segue que irá nos levar para a cena de perguntas
        
        performSegueWithIdentifier("CategoryToQuestionSegue", sender: self)
        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newVC = segue.destinationViewController as! PerguntaTableViewController
        
        //Passando para a cena seguinte as informções já bem divididas
        
        for (title, subTitle, _, _) in dicionário[selectedCategory]! {
            
            newVC.questionArray.append(title: title, subTitle: subTitle)
            
        }

        newVC.selectedCategory = selectedCategory
       
    }
    
}
