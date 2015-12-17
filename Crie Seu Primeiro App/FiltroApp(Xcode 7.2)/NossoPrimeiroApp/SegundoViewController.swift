//
//  SegundoViewController.swift
//  NossoPrimeiroApp
//
//  Created by Renan Siqueira de Souza Mesquita on 12/16/15.
//  Copyright © 2015 Mobgeek. All rights reserved.
//

import UIKit
import CoreImage
import CoreLocation

class SegundoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var intensidade: Double!
    var imagem: UIImage!
    
    var filtro: CIFilter!
    
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        imageView.image = imagem
        
        let imagemParaFiltro = CIImage(image: imagem)
        
        filtro = CIFilter(name: "CISepiaTone", withInputParameters: ["inputImage": imagemParaFiltro!, "inputIntensity": intensidade])
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.toolbarHidden = false
        
    }

    
    @IBAction func aplicaFiltro(sender: UIBarButtonItem) {
        
        let imagemRenderizada = context.createCGImage(filtro.outputImage!, fromRect: filtro.outputImage!.extent)
        
        imagem = UIImage(CGImage: imagemRenderizada)
        
        imageView.image = imagem
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
