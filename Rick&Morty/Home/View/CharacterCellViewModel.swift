//
//  CollectionViewCellModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation

class CharacterCellViewModel: CharacterCellViewModelType {
    
    private var character: Character
    
    var name: String {
        return character.name
    }
    var gender: String {
        return character.gender
    }
    var status: String {
        return character.status
    }
    
    init(character: Character) {
        self.character = character
    }
    
}
