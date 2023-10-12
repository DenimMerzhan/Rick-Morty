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
    var episodeArr: [Episode]?
    
    func numberOfRowsInSection(section: Int) -> Int? {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        default:
            return episodeArr?.count
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
            let planetCell = PlanetCellViewModel(origin: character.origin)
            return planetCell
        default:
            let episode = episodeArr?[indexPath.row]
            let episodeCell = EpisodeCellViewModel(episode: episode)
            return episodeCell
        }
    }
    
    
}


