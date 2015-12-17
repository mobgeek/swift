//
//  ViewController.swift
//  NossoPrimeiroApp
//
//  Created by Renan Siqueira de Souza Mesquita on 25/11/15.
//  Copyright © 2015 Mobgeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var intensidade: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
    
        self.navigationController?.toolbarHidden = true
        
    }
    
    func apresentaAlerta() {
        
        let alerta = UIAlertController(title: "Intensidade Inválida", message: "Informe um valor entre 0.1 e 1.0", preferredStyle: .Alert)
        
        let ação = UIAlertAction(title: "OK", style: .Default, handler: { _ in
        
            
            print("Botão foi pressionado")
        
        
        })
        
        alerta.addAction(ação)
        
        presentViewController(alerta, animated: true, completion: nil)
        
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        guard let intensidade = Double(textField.text!) where (0.1...1.0).contains(intensidade) else {
            
            
            apresentaAlerta()
            
            return false
            
        }
        
        self.intensidade = intensidade
        
        print("\(intensidade)")
        
        return true
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        textField.resignFirstResponder()

        let newVC = segue.destinationViewController as! SegundoViewController
        
        if segue.identifier == "babySegue" {
            
            newVC.imagem = UIImage(named: "bebe.jpg")
            
        } else {
            
            newVC.imagem = UIImage(named: "dog.jpg")
            
        }
        
        newVC.intensidade = self.intensidade
        
        
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

