//
//  PlanetCellViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit


class PlanetCellViewModel: PlanetCellViewModelType {
    
    var location: Location?
    
    var image: UIImage? {
        return K.image.planet
    }
    
    var name: String? {
        return location?.name
    }
    
    var type: String? {
        location?.type
    }
    
    init(location: Location?) {
        self.location = location
    }
}
