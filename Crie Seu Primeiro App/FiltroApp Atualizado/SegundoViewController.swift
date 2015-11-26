//
//  SegundoViewController.swift
//  FiltroApp
//
//  Created by Renan Siqueira de Souza Mesquita on 07/10/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagem: UIImage!
    var intensidade: Double!
    
    var filtro: CIFilter!
    
    var contexto: CIContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contexto = CIContext(options: nil)
        
        imageView.image = imagem
        
        let imagemParaFiltro = CIImage(image: imagem)
        
        filtro = CIFilter(name: "CISepiaTone", withInputParameters: ["inputImage":imagemParaFiltro, "inputIntensity": intensidade])

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.toolbarHidden = false
        
    }


    @IBAction func aplicaFiltro(sender: UIBarButtonItem) {
        
        let imagemRenderizada = contexto.createCGImage(filtro.outputImage, fromRect: filtro.outputImage.extent())
        
        imagem = UIImage(CGImage: imagemRenderizada)
        
        imageView.image = imagem
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
