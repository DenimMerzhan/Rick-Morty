//
//  PlanetCellViewModelType.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit


protocol PlanetCellViewModelType: InfoType {
 
    var image: UIImage? {get}
    var name: String? {get}
    var type: String? {get}
    
}
