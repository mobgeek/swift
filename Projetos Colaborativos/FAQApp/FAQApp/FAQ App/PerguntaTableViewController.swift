//
//  PerguntaTableViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

//Tuples nao conformam com o protocolo Equateble. Solução: Sobreescrever == para aceitar tuplas
func ==<T: Equatable, U: Equatable>(lhs: (T,U), rhs: (T,U)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1
}

class PerguntaTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!

    //MARK: - Constants & Variables

    ///Indica se está ocorrendo busca na searchBar
    var isSearching: Bool = false
    
    ///Guarda os resultados filtrados pela searchBar
    var filteredResults: [(title: String, subTitle: String)] = []
    
    //Informação que será usada para passar outras informações para a cena seguinte
    ///Guarda o texto da célula que indica a pergunta selecionada pelo usuário
    var selectedQuestion: (title: String, subTitle: String) = ("","")

    //Informações trazidas da cena anterior:
    
    ///Contém uma Array de perguntas pertinentes à categoria selecionada na cena anterior
    var questionArray: [(title: String,subTitle: String)] = []
    
    ///Contém a categoria selecionada pelo usuário na cena anterior
    var selectedCategory: String!
    
    //MARK: - Custom methods
    
    ///Será usado como ação de um gesto de toque para fechar o teclado
    func hideKeyboard() {
        tableView.endEditing(true)
    }
    
    //MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        //Criando gesto para fechar o teclado quando o usuário clicar em qualquer área da tableView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("hideKeyboard"))
        tapGesture.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapGesture)
        
        //Mudando a cor de fundo da view para branco, pois se rodar o app no device estará preto por padrão
        
        self.tableView.backgroundColor = UIColor.whiteColor()

        //Dando um título á barra de navegação da cena atual

        self.navigationItem.title = "Perguntas"
        
        //Dando um nome padrão para ser colocado no searchBar quando enquanto nada é digitado
        
        self.searchBar.placeholder = "Busque por perguntas"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UISearchBarDelegate methods
    
    ///Sempre é chamado quando o usuário digita algo na barra de busca
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredResults = questionArray.filter({
            
            //Verifica se existe alguma ocorrência do que foi digitado no searchBar em alguma posição do questionArray (título + subtítulo)
            
            //Decompõe a Tupla
            (title: String, subTitle: String) -> Bool in

            //Verifica se o texto digitado é substring de alguma pergunta (título *OU* subtitulo) armazenada no na Array de perguntas
            
            let matched1 = title.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let matched2 = subTitle.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            //Se pelos menos 1 (título ou subtítulo) der o "match" retorna true
            return matched1 != nil || matched2 != nil
            
        })
        
        //Se estiver vazio o searchBar significa que não está ocorrendo busca
        
        if searchBar.text!.isEmpty {
            isSearching = false
        } else {
            isSearching = true
        }
        
        //Atualiza os dados conforme vai sendo digitado algo no searchBar
        
        self.tableView.reloadData()
    
    }

    // MARK: - UITableViewDataSource methods

    ///Retorna o número de seções da tabela
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    ///Retorna o número de linhas na seção
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //Se o searchBar não estiver vazio, a quantidade de linhas (células) na tableView será correspondente à quantidade de elementos de filteredResults
        
        if isSearching {
            
            return filteredResults.count
            
        }
        
        //Caso contrário, será correspondente ao total de elementos do Array de perguntas.

        return questionArray.count
    
    }

    ///Chamado quando é solicitada a inclusão de algum dado em alguma célula da tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PerguntaPrototypeCell", forIndexPath: indexPath) as! CustomCell
        
        //Se o searchBar não estiver vazio, carrega no tableView os dados filtrados
        
        if isSearching {
            
            //Armazenando em uma outra Array as tuplas (título + subtítulo) do Array de resultados filtrados em ordem alfabética

            let orderedTuple = filteredResults.sort( {$0.0.lowercaseString < $1.0.lowercaseString || $0.1.lowercaseString < $1.1.lowercaseString} )
            
            //Utilizando os labels customizados
            
            cell.title.text = orderedTuple[indexPath.row].title
            cell.subTitle.text = orderedTuple[indexPath.row].subTitle
            
        } else {
        
            //Armazenando em uma outra Array as tuplas (título e subtítulo) do Array de perguntas em ordem alfabética
            
            let orderedTuple = questionArray.sort( {$0.0.lowercaseString < $1.0.lowercaseString || $0.1.lowercaseString < $1.1.lowercaseString} )
            
            //Utilizando os labels customizados

            cell.title.text = orderedTuple[indexPath.row].title
            cell.subTitle.text = orderedTuple[indexPath.row].subTitle
        
        }

        return cell
        
    }
    
    ///Chamado quando alguma célula é selecionada pelo usuário
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Verifica qual célula foi selecionada e guarda o texto dessa célula (título + subTítulo) na tupla de pergunta selecionada
        
        selectedQuestion.title = (tableView.cellForRowAtIndexPath(indexPath) as! CustomCell).title.text!
        selectedQuestion.subTitle = (tableView.cellForRowAtIndexPath(indexPath) as! CustomCell).subTitle.text!
        
        //Dispara a a segue que vai nos levar para a cena de resposta
        performSegueWithIdentifier("QuestionToAnswerSegue", sender: self)

    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        let newVC = segue.destinationViewController as! FileWebViewController
        
        //Busca pelo arquivo no array de tuplas, contido no dicionário, referente a pergunta selecionada
        
        for (title, subTitle, file, fileExt) in dicionário[selectedCategory]! {
            
            //Aqui podemos ver a utilidade de se usar Operator Overloading ;)
            //Quando encontrar a tupla correspondente, passa para a próxima cena o arquivo e extensão associados a ela.
            
            if (title,subTitle) == selectedQuestion {
                
                newVC.answer = (file, fileExt)
                
            }
            
        }
        
    }

}
