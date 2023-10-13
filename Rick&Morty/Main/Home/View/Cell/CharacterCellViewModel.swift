//
//  CollectionViewCellModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation

final class CharacterCellViewModel: CharacterCellViewModelType {
    
    private var character: Character
    
    var urlImage: URL? {
        return character.image
    }
    
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
