//
//  AdicionarItemViewController.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import UIKit

class AdicionarItemViewController: UIViewController {

    var novoItemDaLista: ItemLista?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let button = sender as? UIBarButtonItem {
        
            if button != doneButton {
            
                return
            
            }
        
        }
        
        
        if let texto = textField.text where !texto.isEmpty {
            
            novoItemDaLista = ItemLista(nome: texto)
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
