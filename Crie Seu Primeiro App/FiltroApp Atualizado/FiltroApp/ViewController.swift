
//
//  ViewController.swift
//  FiltroApp
//
//  Created by Renan Siqueira de Souza Mesquita on 23/09/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.toolbarHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let novoVC = segue.destinationViewController as! SegundoViewController
        
        if segue.identifier == "bebeSegue" {
            
            novoVC.imagem = UIImage(named: "bebe.jpg")
            
        } else {
            
            novoVC.imagem = UIImage(named: "dog.jpg")
            
        }
        
        //6.4 -> doubleValue -> NSString
        //7.0 -> Double(textField.text!)
        //7.0 -> Int(textFiled.text!)
        
        let intensidade = (textField.text as NSString).doubleValue
        
        if !textField.text.isEmpty && (0.1...1.0).contains(intensidade) {
            
            novoVC.intensidade = intensidade
            
        } else {
            
            novoVC.intensidade = 1.0
            
        }
        
    }


}

