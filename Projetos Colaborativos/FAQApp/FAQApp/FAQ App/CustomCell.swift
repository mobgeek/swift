//
//  CustomCell.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 30/06/15.
//  Copyright © 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

///Mesmo apenas usando um estilo de UITableViewCell já pronto chamado subtitle, foi criada uma célula customizada para as células do tableView da cena de perguntas, possibilitando assim, novas customizações futuras.

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
}