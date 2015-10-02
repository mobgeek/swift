//
//  AdicionarItemViewController.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import UIKit

class AdicionarItemViewController: UIViewController {

    var novoNomeParaItem: String?
    
    @IBOutlet weak var novoItemTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let button = sender as? UIBarButtonItem {
        
            if button != doneButton { return }
        }
        
        if let texto = novoItemTextField.text where !texto.isEmpty {
        
            novoNomeParaItem = texto
        }
        
    }
}