//
//  InfoCellViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation

class InfoCellViewModel: InfoCellViewModelType {

    var character: Character

    var species: String {
        return character.species
    }
    
    var type: String {
        return character.type
    }
    
    var gender: String {
        return character.gender
    }

    
    init(character: Character) {
        self.character = character
    }
    
}
