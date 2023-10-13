//
//  InfoViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit

class InfoViewModel: InfoViewModelType {

    var numberOfSections: Int {
        return 3
    }
    
    var character: Character
    var episodeArr =  [Episode]()
    var location: Location?
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return episodeArr.count
        }
    }
    
    init(character: Character){
        self.character = character
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> InfoType {
        switch indexPath.section {
        case 0:
            let infoCell = InfoCellViewModel(character: character)
            return infoCell
        case 1:
            let planetCell = PlanetCellViewModel(location: location)
            return planetCell
        default:
            let episode = episodeArr[indexPath.row]
            let episodeCell = EpisodeCellViewModel(episode: episode)
            return episodeCell
        }
    }
    
    func textFooter(textForFooterInSection section: Int) -> String {
        switch section {
        case 0:
            return "Info"
        case 1:
            return "Origin"
        default:
            return "Episodes"
        }
    }    
}

//MARK: - FetchEpisodes

extension InfoViewModel {
    
    func fetchAllEpisodes(completion: @escaping () -> ()){
        character.episode.forEach { string in
            if let url = URL(string: string) {
                fetchEpisode(with: url) {
                    completion()
                }
            }
        }
    }
    
    
    private func fetchEpisode(with url: URL, completion: @escaping () -> ()){
        
        NetworkService.shared.getData(with: url) { [weak self] results in
            switch results {
            case .failure(let error):
                print("Ошибка загрузки персонажей - \(error)")
            case .success(let data):
                if let episode = DecodeJson.decode(with: data, type: Episode.self) {
                        self?.episodeArr.append(episode)
                        completion()
                }
            }
        }
    }
}

//MARK: - FetchOrigin

extension InfoViewModel {
    
    func fetchLocation(completion: @escaping () -> Void){
        guard let stringUrl = character.location.url, let url = URL(string: stringUrl) else {return}
        NetworkService.shared.getData(with: url) { [weak self] result in
            switch result {
            case .failure(let error):
                print("Ошибка загрузки origin - \(error)")
            case .success(let data):
                self?.location =  DecodeJson.decode(with: data, type: Location.self)
                completion()
            }
        }
    }
    
}

