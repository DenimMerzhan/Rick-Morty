//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation
import UIKit


class HomeViewModel: HomeCollectionViewModelType {
    
    private var indexCharacter  = 1
    
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
    

    func fetchCharacters(numberOfCharacters: Int, completion: @escaping () -> Void ) {
        for _ in 0...numberOfCharacters {
            indexCharacter += 1
            fetchCharacter {
                completion()
            }
        }
    }
    
    private func fetchCharacter(completion: @escaping () -> Void ){
        guard let url = URL(string: Link.character.url + "/" + "\(indexCharacter)") else {return}
        
        NetworkService.shared.fetchCharacter(with: url) { [weak self] result in
            switch result {
            case.failure(let error):
                print(error)
            case .success(let data):
                if let character = DecodeJson.decode(with: data, type: Character.self) {
                    self?.characters.append(character)
                    completion()
                }
            }
        }
    }
    
}


//MARK: - Link

extension HomeViewModel {
    enum Link {
        case character
        
        var url: String {
            switch self {
            case .character:
                return "https://rickandmortyapi.com/api/character"
            }
        }
    }
}
