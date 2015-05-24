//
//  ListaTableViewController.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController,UITableViewDelegate, UITableViewDataSource {

    var itens: [ItemLista] = []
    
    
    func carregarDadosIniciais() {
    
        var item1 = ItemLista(nome: "Comprar Maças")
        
        itens.append(item1)
        
        
        var item2 = ItemLista(nome: "Estudar Swift")
        
        itens.append(item2)
        
        var item3 = ItemLista(nome: "Ligar para o Banco")
        
        itens.append(item3)
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregarDadosIniciais()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    @IBAction func voltaParaLista(segue: UIStoryboardSegue!) {
    
        var sourceVC = segue.sourceViewController as! AdicionarItemViewController
        
        
        if let item = sourceVC.novoItemDaLista {
        
            itens.append(item)
            
            tableView.reloadData()
            
        }
        
    
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListaPrototypeCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        var itemDaLista = itens[indexPath.row]
        
        cell.textLabel?.text = itemDaLista.nome
        
        
        cell.accessoryType = itemDaLista.concluido ? UITableViewCellAccessoryType.Checkmark :UITableViewCellAccessoryType.None
    
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var itemTocado = itens[indexPath.row]
        
        itemTocado.concluido = !itemTocado.concluido
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
