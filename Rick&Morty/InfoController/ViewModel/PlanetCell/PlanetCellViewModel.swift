//
//  PlanetCellViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit


class PlanetCellViewModel: PlanetCellViewModelType {
    
    var origin: Origin
    
    var image: UIImage? {
        return K.image.planet
    }
    
    var name: String {
        return origin.name
    }
    
    var type: String?
    
    init(origin: Origin) {
        self.origin = origin
    }
}
