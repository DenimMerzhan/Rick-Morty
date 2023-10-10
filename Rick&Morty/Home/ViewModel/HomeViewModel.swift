//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation
import UIKit


struct HomeViewModel: HomeCollectionViewModelType {

    private var characters = [
        Character(id: 22, name: "dwwd", status: "wddw", species: "dwdw", type: "wddw", gender: "dwdw", image: nil, episode: ["dwwd"]),
        Character(id: 22, name: "dwwd", status: "wddw", species: "dwdw", type: "wddw", gender: "dwdw", image: nil, episode: ["dwwd"]),
        Character(id: 22, name: "dwwd", status: "wddw", species: "dwdw", type: "wddw", gender: "dwdw", image: nil, episode: ["dwwd"]),
        Character(id: 22, name: "dwwd", status: "wddw", species: "dwdw", type: "wddw", gender: "dwdw", image: nil, episode: ["dwwd"])]
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return characters.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CharacterCellViewModelType {
        let character = characters[indexPath.row]
        let cell = CharacterCellViewModel(character: character)
        return cell
    }
    
}
