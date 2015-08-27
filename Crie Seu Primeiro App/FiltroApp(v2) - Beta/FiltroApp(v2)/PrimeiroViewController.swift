//
//  PrimeiroViewController.swift
//  FiltroApp(v2)
//
//  Created by Renan Siqueira de Souza Mesquita on 26/08/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

class PrimeiroViewController: UIViewController {

    var imagem: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //Optional Chaining
        self.navigationController?.toolbarHidden = true
        
    }
    
    
    
    @IBAction func bebePressionado(sender: UIButton) {
        
        imagem = UIImage(named: "bebe.jpg")
        
        performSegueWithIdentifier("FirstToSecondScene", sender: nil)
        
    }
    
    
    @IBAction func cachorroPressionado(sender: UIButton) {
        
        imagem = UIImage(named: "dog.jpg")
        
        performSegueWithIdentifier("FirstToSecondScene", sender: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Downcasting
        
        let newVC = segue.destinationViewController as! SegundoViewController
        
        newVC.imagemSemFiltro = imagem
        
    }

}
