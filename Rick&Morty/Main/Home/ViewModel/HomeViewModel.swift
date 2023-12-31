//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation
import UIKit
import Kingfisher


final class HomeViewModel: HomeViewModelType {
    
    var characters = [Character]()
    
    var isCharacterOver = false
    var isThereActiveDowloadNewCharacter = false
    
    var numberOfSection: Int {
        return 1
    }
    
    private var indexCharacter  = 1
    
    func numberOfRowsInSection(section: Int) -> Int {
        return characters.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CharacterCellViewModelType {
        let character = characters[indexPath.row]
        let cell = CharacterCellViewModel(character: character)
        return cell
    }
}

//MARK: - FetchCharacters

extension HomeViewModel {
    
    func fetchCharacters(numberOfCharacters: Int, completion: @escaping () -> Void ) {
        
        let count = abs(numberOfCharacters - indexCharacter)
        isThereActiveDowloadNewCharacter = true
        
        for i in 0...count {
            
            fetchCharacter(indexCharacter: indexCharacter) { [weak self] in
                completion()
                if i == count {
                    self?.isThereActiveDowloadNewCharacter = false
                }
            }
            
            indexCharacter += 1
        }
    }
    
    private func fetchCharacter(indexCharacter: Int, completion: @escaping () -> Void ){
        guard let url = URL(string: Link.character.url + "/" + "\(indexCharacter)") else {return}
        
        NetworkService.shared.getData(with: url) { [weak self] result in
            switch result {
            case.failure(let error):
                print(error)
                self?.isThereActiveDowloadNewCharacter = false
                switch error {
                case .response404:
                    self?.isCharacterOver = true
                default: break
                }
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
