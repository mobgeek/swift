//
//  ListaTableViewController.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import UIKit



class ListaTableViewController: UITableViewController {

    
    // MARK - Propriedades
    
    var itens: [ItemLista] = []
    
    lazy var dateFormatter: NSDateFormatter = {
    
        let dateFormatter = NSDateFormatter()
        
        // Configure o estilo
        
        dateFormatter.dateStyle = .ShortStyle
        // Outros: NoStyle, ShortStyle, MediumStyle, FullStyle
        // Eventualmente:
        // dateFormatter.timeStyle = .ShortStyle

        
        // Cool Stuff: Hoje, Amanhã, etc..
        
        // dateFormatter.doesRelativeDateFormatting = true
        
        // Alternativa: Há também a opção de criar formatos customizados...Para uma lista de especificadores consulte a documentação Data Formatting Guide: https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369-SW1
        // dateFormatter.dateFormat = "'Criado em' dd/MM/yyyy 'às' HH:mm"
        // dateFormatter.dateFormat = "EEE, MMM d"
        
        
        // Estabeleça o Português como preferência. NSLocale
        
        dateFormatter.locale = NSLocale(localeIdentifier:"pt_BR")
        
        return dateFormatter
    
    } ()
    
    func timeSinceDate(date: NSDate) -> String {
        
        let startDate = date
        
        let endDate = NSDate()
        
        
        var calendar = NSCalendar.currentCalendar()
        
        let unidades: NSCalendarUnit = [.Day, .Hour, .Minute]
        
        let components = calendar.components(unidades, fromDate: startDate, toDate: endDate, options: [])
        
        return "Criado há \(components.day) dia(s) e \(components.minute) minuto(s) atrás"
        
    }
    
   
    // MARK - Helper Methods
    
    func carregarDadosIniciais() {
    
        var item1 = ItemLista(nome: "Comprar Maças")
        
        itens.append(item1)
        
        var item2 = ItemLista(nome: "Estudar Swift")
        
        itens.append(item2)
        
        var item3 = ItemLista(nome: "Ligar para o Banco")
        
        itens.append(item3)
    
    }
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregarDadosIniciais()

    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return itens.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListaPrototypeCell", forIndexPath: indexPath)

        // Configure the cell...
        
        var itemDaLista = itens[indexPath.row]
        
        cell.textLabel!.text = itemDaLista.nome
        
        cell.accessoryType = itemDaLista.concluido ? UITableViewCellAccessoryType.Checkmark :UITableViewCellAccessoryType.None
    
        cell.detailTextLabel?.text = timeSinceDate(itemDaLista.dataCriacao)
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var itemTocado = itens[indexPath.row]
        
        itemTocado.concluido = !itemTocado.concluido
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        
    }
    
    
    // MARK: - Navigation
    
    @IBAction func voltaParaLista(segue: UIStoryboardSegue!) {
        
        var sourceVC = segue.sourceViewController as! AdicionarItemViewController
        
        if let item = sourceVC.novoItemDaLista {
            
            itens.append(item)
            
            tableView.reloadData()
            
        }
    }
}
