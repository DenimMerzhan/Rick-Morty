//
//  PlanetCellViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit


class PlanetCellViewModel: PlanetCellViewModelType {
    
    var loaction: Location
    
    var image: UIImage? {
        return K.image.planet
    }
    
    var name: String {
        return loaction.name
    }
    
    init(origin: Location) {
        self.loaction = origin
    }
}
