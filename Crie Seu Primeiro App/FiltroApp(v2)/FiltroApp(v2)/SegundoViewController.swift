//
//  ViewController.swift
//  FiltroApp(v2)
//
//  Created by Renan Siqueira de Souza Mesquita on 26/08/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {

    //Implicit Unwrapped Optionals
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagemSemFiltro: UIImage!
    var imagemComFiltro: UIImage!
    
    var filtro: CIFilter!
    
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.image = imagemSemFiltro
        
        let imagemParaFiltro = CIImage(image: imagemSemFiltro)
        
        filtro = CIFilter(name: "CISepiaTone", withInputParameters: ["inputImage": imagemParaFiltro, "inputIntensity": 1.0])
    
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //Optional Chaining
        self.navigationController?.toolbarHidden = false
        
    }
    
    @IBAction func aplicaFiltro(sender: UIBarButtonItem) {
        
        let imagemRenderizada = context.createCGImage(filtro.outputImage, fromRect: filtro.outputImage.extent())
        
        imagemComFiltro = UIImage(CGImage: imagemRenderizada)
        
        imageView.image = imagemComFiltro
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

