//
//  ListaTableViewController.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import UIKit
import CoreData

class ListaTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var itens: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let moc = appDelegate.managedObjectContext!
        
        
        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        var erro: NSError?
        
        let fetchedResults = moc.executeFetchRequest(fetchRequest, error: &erro) as! [Item]?
        
        if let results = fetchedResults {
        
            itens = results
        
        } else {
            
            println("O fetch não foi possível. \(erro), \(erro?.userInfo)")
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListaPrototypeCell", forIndexPath: indexPath) as! UITableViewCell
                
        var itemDaLista = itens[indexPath.row]
        cell.textLabel?.text = itemDaLista.nome
        cell.accessoryType = itemDaLista.foiConcluido ? UITableViewCellAccessoryType.Checkmark :UITableViewCellAccessoryType.None
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var itemTocado = itens[indexPath.row]
        itemTocado.foiConcluido = !itemTocado.foiConcluido
        
        itemTocado.managedObjectContext?.save(nil)
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
    }
    
    
    // MARK: - Actions
    
    @IBAction func voltaParaLista(segue: UIStoryboardSegue!) {
    
        var sourceVC = segue.sourceViewController as! AdicionarItemViewController
        
        if let nomeDoItem = sourceVC.novoNomeParaItem {
        
            // itens.append(nomeDoItem)
            
            armazenarItem(nomeDoItem)
            
            tableView.reloadData()
        }
    }
    
    func armazenarItem(nome: String, concluido: Bool = false, criadoEm: NSDate = NSDate()) {
    
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let moc = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: moc)
        
        let item = Item(entity: entity!, insertIntoManagedObjectContext: moc)
        
        item.nome = nome
        item.foiConcluido = concluido
        item.criadoEm = criadoEm
        
        var erro: NSError?
        
        if !moc.save(&erro) {
            
            println("Não foi possível armazenar. \(erro), \(erro?.userInfo)")
        
        }
        
        itens.append(item)
    }
}
