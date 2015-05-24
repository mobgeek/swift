//
//  ItemLista.swift
//  Lista
//
//  Created by Fabio Santos on 11/3/14.
//  Copyright (c) 2014 Fabio Santos. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var nome: String
    @NSManaged var foiConcluido: Bool
    @NSManaged var criadoEm: NSDate
}