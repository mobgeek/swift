//
//  ViewController.swift
//  App Filtro de Imagem
//
//  Created by Renan Siqueira de Souza Mesquita on 11/06/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagemSemFiltro = UIImage(named: "bebe.jpg")
    
    var imagemComFiltro: UIImage!
    
    var filtro1: CIFilter!
    
    var filtro2: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = imagemSemFiltro
        
        let imagemParaFiltro = CIImage(image: imagemSemFiltro)
        
        filtro1 = CIFilter(name: "CISepiaTone", withInputParameters: ["inputImage":imagemParaFiltro, "inputIntensity": 1.0])
        
        filtro2 = CIFilter(name: "CIHueAdjust", withInputParameters: ["inputImage": imagemParaFiltro, "inputAngle": 5.0])
        
    }

    @IBAction func aplicarFiltro1(sender: UIBarButtonItem) {
        
        imagemComFiltro = UIImage(CIImage: filtro1.outputImage)
        
        imageView.image = imagemComFiltro
        
    }
    
    
    @IBAction func limpar(sender: UIBarButtonItem) {
        
        
        imageView.image = imagemSemFiltro
        
    }
    
    @IBAction func aplicarFiltro2(sender: UIBarButtonItem) {
        
        imagemComFiltro = UIImage(CIImage: filtro2.outputImage)
        
        imageView.image = imagemComFiltro
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

